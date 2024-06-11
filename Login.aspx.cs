using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Login : System.Web.UI.Page
{
    DataSet ds, ds1;
    SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = "select * from dbo.Users where UserName='" + TextBox1.Text + "' and Pass='" + TextBox2.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(str, con);
        ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            string Name= ds.Tables[0].Rows[0][0].ToString();
            string str1 = "select * from dbo.Register where Name='" + TextBox1.Text + "' ";
            SqlDataAdapter da1 = new SqlDataAdapter(str1, con);
            ds1 = new DataSet();
            da1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count > 0)
            {
                Session["Admin"] = ds1.Tables[0].Rows[0][1].ToString();
                Session["Image"] = ds1.Tables[0].Rows[0][2].ToString();
                Response.Redirect("Chat.aspx");
            }
        }
    }
}