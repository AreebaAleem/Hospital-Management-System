using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace hospitalManagement1
{
    public partial class Admin : Form
    {
        public Admin()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-K08IIJP\\SQLEXPRESS;Initial Catalog =hospital_Management2; Integrated Security = true");
        int DoctorTotal;
        int DeptTotal;
        private void button1_Click(object sender, EventArgs e)
        {try
            {
                int Dept_id = int.Parse(DeptId.Text) ;
                con.Open();
                SqlCommand cmd = new SqlCommand("spGetDoctorCountByDepartment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Dept_id", Dept_id);
                SqlParameter totalDoctors = new SqlParameter();
                totalDoctors.ParameterName = "@DoctorCount";
                totalDoctors.SqlDbType = SqlDbType.Int;
                totalDoctors.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(totalDoctors);
                cmd.ExecuteNonQuery();
                DoctorTotal = (int)totalDoctors.Value;
                con.Close();
                TotalDoctor.Text = DoctorTotal.ToString();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridViewdoc_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                int dept_id = int.Parse(textBox1.Text);
                string designation = textBox2.Text;
                con.Open();
                SqlCommand cmd = new SqlCommand("spGetDoctors", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@dept_id", dept_id);
                cmd.Parameters.AddWithValue("@designation", designation);
                SqlDataReader reader = cmd.ExecuteReader();
               
                DataTable table = new DataTable();
                DataSet dataSet = new DataSet();
                table.Load(reader);
                dataGridView1.DataSource = table;
                con.Close();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Admin_Load(object sender, EventArgs e)
        {
            
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                
                con.Open();
                SqlCommand cmd = new SqlCommand("spGetTotalDepartment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter totalDept = new SqlParameter();
                totalDept.ParameterName = "@TotalCount";
                totalDept.SqlDbType = SqlDbType.Int;
                totalDept.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(totalDept);
                cmd.ExecuteNonQuery();
                DeptTotal = (int)totalDept.Value;
                con.Close();
                dept.Text = DeptTotal.ToString();
            }
            catch (SqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
           /* Doctor obj = new Doctor();
            obj.Show();*/

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }
    }
}
