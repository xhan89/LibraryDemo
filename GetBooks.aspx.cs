using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GetBooks : System.Web.UI.Page
{
    public static DataTable dt = new DataTable();

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static List<string> GetSearch(string prefixText)
    {

        DataTable Result = new DataTable();
        DBConnect db = DBConnect.GetConnection("select `book_title` from `tb_book` where `book_title` LIKE '%" + prefixText + "%'");
        DataSet dts = new DataSet();
        db.oleDbAdapt.Fill(dts);

        List<string> Output = new List<string>();

        foreach (DataRow myRow in dts.Tables[0].Rows)
        {
            Output.Add(myRow["book_title"].ToString());
        }

        return Output;

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DBConnect db = DBConnect.GetConnection("SELECT `book_id` AS 'Book-No',`book_title` AS 'Title',`book_rating` AS 'Rating',`book_available` AS 'Availability' FROM lib_sys.tb_book WHERE `book_available` > 0 ORDER BY `book_id` DESC LIMIT 1000; ");
            DataSet dts = new DataSet();
            db.oleDbAdapt.Fill(dts);

            GridViewBooks.DataSource = dts;
            GridViewBooks.DataBind();

            DataTable dtTemp = dts.Tables[0];

        }

    }




    protected void ButtonSearch_Click(object sender, EventArgs e)
    {
        DBConnect db = DBConnect.GetConnection("SELECT DISTINCT(`tb_book`.`book_id`) AS 'Book-No',`book_title` AS 'Title',`book_rating` AS 'Rating',`book_available` AS 'Availability' FROM lib_sys.tb_book INNER JOIN `tb_author_book` ON `tb_book`.`book_id` = `tb_author_book`.`book_id` INNER JOIN `tb_author` ON `tb_author_book`.`author_id` = `tb_author`.`author_id` WHERE `book_title` LIKE '%" + TextBoxtitle.Text.ToUpper() + "%' AND `tb_author`.`author_f_name` LIKE '%" + TextBoxAuthor.Text.ToUpper() + "%' OR `tb_author`.`author_l_name` LIKE '%" + TextBoxAuthor.Text.ToUpper() + "%' AND `book_available` > 0; ");
        DataSet dts = new DataSet();
        db.oleDbAdapt.Fill(dts);

        GridViewBooks.DataSource = dts;
        GridViewBooks.DataBind();

        DataTable dtTemp = dts.Tables[0];
    }

    protected void GridViewBooks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "BookRow")
        {
            string bid = GridViewBooks.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
            //Check customer bought this book already
            string bookex = DBSingleQuery.ExecuteActionQuery("SELECT EXISTS(SELECT `book_id` FROM `tb_user_book` WHERE `book_id` = " + bid + " AND `user_id` = " + Session["Usere"].ToString() + " AND `book_returned` = 0) as ext;");
            if (bookex == "0")
            {
                DBInsert.ExecuteActionQuery("START TRANSACTION; INSERT INTO `lib_sys`.`tb_user_book` (`user_id`,`book_id`,`book_date`) VALUES (" + Session["Usere"].ToString() + ", " + bid + ", NOW()); UPDATE `lib_sys`.`tb_book` SET `book_available` = `book_available` -1 WHERE `book_id` = " + bid + "; COMMIT; ");

                ScriptManager.RegisterStartupScript(this, this.GetType(),
"alert",
"alert('Order Confirmed !');window.location ='GetBooks.aspx';",
true);

            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(),
"alert",
"alert('You have already bought this book !');",
true);
            //Response.Redirect("#?dd=" + Session["Usere"].ToString());
        }

    }
}
