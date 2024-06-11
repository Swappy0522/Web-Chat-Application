using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.IO;

public partial class Register : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            string fname = FileUpload1.FileName;

            string fpath = Server.MapPath("~/images/");
            int flen = FileUpload1.PostedFile.ContentLength;
            string fext = Path.GetExtension(fname);
            fext = fext.ToLower();
            if (flen < 1048576)
            {
                if (fext == ".jpg" || fext == ".png" || fext == ".gif" || fext == ".bmp")
                {
                    conn.Open();
                    FileUpload1.SaveAs(fpath + fname); 
                    string query = "insert into Register values(1,'" + TextBox1.Text + "','" + fname + "')";
                    string login= "insert into Users values('" + TextBox1.Text + "','" + TextBox2.Text + "')";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlCommand cmd1 = new SqlCommand(login, conn);
                    int i=cmd.ExecuteNonQuery();
                    int i1 = cmd1.ExecuteNonQuery();
                    conn.Close();
                    if (i >= 1 && i1 >= 1)
                    {
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        Response.Write("<script>alert('Yor are register Successfully \n Try to login your account');</script>");

                    }
                }
                else
                {
                    Response.Write("<script>alert('Only image files are allowed');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Max file size allowed is 1 MB');</script>");
            }


        }
        
    }
}