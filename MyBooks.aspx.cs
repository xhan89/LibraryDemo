using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyBooks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DBConnect db = DBConnect.GetConnection("SELECT `tb_book`.`book_id` AS 'Book-No',`book_title` AS 'Title', `tb_user_book`.`book_date` AS 'Date' FROM lib_sys.tb_book INNER JOIN `tb_user_book` ON `tb_user_book`.`book_id` = `tb_book`.`book_id` WHERE `tb_user_book`.`user_id` = "+ Session["Usere"].ToString() +" AND `tb_user_book`.`book_returned` = 0 ORDER BY `tb_book`.`book_id` DESC LIMIT 1000; ");
        DataSet dts = new DataSet();
        db.oleDbAdapt.Fill(dts);

        GridViewBooks.DataSource = dts;
        GridViewBooks.DataBind();

        DataTable dtTemp = dts.Tables[0];
    }
}