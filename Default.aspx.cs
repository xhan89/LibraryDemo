using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonSignUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            DBInsert.ExecuteActionQuery("INSERT INTO `lib_sys`.`tb_user` (`user_email`,`user_phone`,`user_join_date`) VALUES ('" + TextBoxE.Text.ToUpper().Trim() + "','" + TextBoxP.Text.Trim() + "',NOW());");
            ScriptManager.RegisterStartupScript(this, this.GetType(),
"alert",
"alert('Thanks for signing up. Welcome to our community. We are happy to have you on board. !');window.location ='Default.aspx';",
true);
        }
    }

    protected void ButtonSignIN_Click(object sender, EventArgs e)
    {
        string userid = DBSingleQuery.ExecuteActionQuery("select ifnull((select `user_id` FROM lib_sys.tb_user WHERE `user_email` = '" + TextBoxEmail.Text.ToUpper().Trim() + "'),'0') As Res;") ;
        if (int.Parse(userid) != 0)
        {
            Session["Usere"] = userid;

            Response.Redirect("GetBooks.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(),
"alert",
"alert('Email does not exist !');",
true);
        }
    }

    protected void ButtonAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/admin/Default.aspx");
    }
}