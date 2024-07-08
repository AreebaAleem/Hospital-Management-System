using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace hospitalManagement1
{
    public partial class login : Form
    {
        public login()
        {
            InitializeComponent();
        }

        private void Class1_Load(object sender, EventArgs e)
        {

        }
        
      

        private void textBoxUserName_TextChanged(object sender, EventArgs e)
        {

        }

       

        private void textBoxPassward_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            String Conn = ("Data Source=DESKTOP-K08IIJP\\SQLEXPRESS;Initial Catalog =hospital_Management2; Integrated Security = true");
          
            try
            {
                if (textBoxUserName.Text == "" && textBoxPassward.Text == "")
                {
                    MessageBox.Show(" Enter the User Name and Passward ");
                }
                else
                {
                    SqlConnection con = new SqlConnection(Conn);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select status from  loginForm where Name=@UserName and Passward=@UserPass ", con);
                    cmd.Parameters.AddWithValue("@UserName ", textBoxUserName.Text);
                    cmd.Parameters.AddWithValue("@UserPass", textBoxPassward.Text);

                    string status = (string)cmd.ExecuteScalar();
                    /*SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    adpt.Fill(ds);*/
                    con.Close();
                    if (status == "Doctor")
                    {
                        Doctor obj = new Doctor();
                        obj.Show();
                    }
                    else if (status == "Receptionist")
                    {
                        secondScreen ob = new secondScreen();
                        ob.Show();
                    }
                    else
                    {
                        Admin ob1 = new Admin();
                        ob1.Show();
                    }

                    /*int count = ds.Tables[0].Rows.Count;
                    if (count == 1)
                    {
                        MessageBox.Show(" successfully login");
                        this.Hide();
                        ob.Show();

                    }
                    else
                    {
                        MessageBox.Show(" Invalid User Name and Passward ");
                    }*/

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }


        }

        private void login_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
