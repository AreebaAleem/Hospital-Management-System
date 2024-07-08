using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Windows.Input;

namespace hospitalManagement1
{
    public partial class secondScreen : Form
    {
        public secondScreen()
        {
            InitializeComponent();
        }
         
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-K08IIJP\\SQLEXPRESS;Initial Catalog =hospital_Management2; Integrated Security = true");
        private void textname_TextChanged(object sender, EventArgs e)
        {
        }

        private void patientRecords_Click(object sender, EventArgs e)
        {
            




            con.Open();

            String Query = "select * from Patients";
            SqlCommand cmd = new SqlCommand(Query, con);
           
            var reader = cmd.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            dataGridView1.DataSource = table;
            con.Close();
            reader.Close();

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void secondScreen_Load(object sender, EventArgs e)
        {

        }

        private void Insert_Click(object sender, EventArgs e)
        {
            



        }

        private void button1_Click(object sender, EventArgs e)
        {
           /* Admin ob1 = new Admin();
            ob1.Show();*/
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textname_TextChanged_1(object sender, EventArgs e)
        {

        }

        private void Insert_Click_1(object sender, EventArgs e)
        {   
            String patientName = textname.Text;
            String Gender = textGender.Text;
            long  contact = int.Parse(textcontact.Text);
            string Age= textage.Text;
            string height = textheight.Text;
            string weight= textweight.Text;
            DateTime joindate = DateTime.Parse(dateTimePicker1.Text);
            con.Open();

            SqlCommand command = con.CreateCommand();

            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "spPatientInsert";
            command.Parameters.AddWithValue("@Patient_Name", patientName);
            command.Parameters.AddWithValue("@P_Gender", Gender);
            command.Parameters.AddWithValue("@Patient_Contact", contact);
            command.Parameters.AddWithValue("@Patient_Age", Age);
            command.Parameters.AddWithValue("@Patient_Height", height);
            command.Parameters.AddWithValue("@Patient_Weight", weight);
            command.Parameters.AddWithValue("@Admission_date", joindate);

            command.ExecuteNonQuery();
            con.Close();
            
            MessageBox.Show("inserted successfully ");
            getPatient();
        }
        void getPatient()
        {
            SqlCommand c = new SqlCommand(" exec listPatient_SP", con);
            SqlDataAdapter sd = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            sd.Fill(dt);
            dataGridView1.DataSource = dt;  

        }

        private void secondScreen_Load_1(object sender, EventArgs e)
        {
            getPatient();
        }

        private void update_Click(object sender, EventArgs e)
        {   
            String patientName = textname.Text;
            String Gender = textGender.Text;
            long  contact = int.Parse(textcontact.Text);
            string Age = textage.Text;
            string height = textheight.Text;
            string weight = textweight.Text;
            DateTime joindate = DateTime.Parse(dateTimePicker1.Text);
            con.Open();
            SqlCommand update = new SqlCommand("spPatientUpdate",con);
            update.CommandType = CommandType.StoredProcedure;
            
            update.Parameters.AddWithValue("@Patient_Name", patientName);
            update.Parameters.AddWithValue("@P_Gender", Gender);
            update.Parameters.AddWithValue("@Patient_Contact", contact);
            update.Parameters.AddWithValue("@Patient_Age", Age);
            update.Parameters.AddWithValue("@Patient_Height", height);
            update.Parameters.AddWithValue("@Patient_Weight", weight);
            update.Parameters.AddWithValue("@Admission_date", joindate);
            update.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("updated successfully ");
            getPatient();
        }

        private void delete_Click(object sender, EventArgs e)
        {

            String patientName = textname.Text;
           
            con.Open();
            SqlCommand delete = new SqlCommand("Appointment_SP", con);
            delete.CommandType = CommandType.StoredProcedure;

            delete.Parameters.AddWithValue("@Patient_Name", patientName);
           
            delete.ExecuteNonQuery();
            con.Close();
            MessageBox.Show("deleted  successfully ");
            getPatient();


        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            string selectCommand = "select * from [dbo].[admin view]";

            con.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand, con);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            dataGridView2.DataSource = dataSet.Tables[0];
            con.Close();

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}


       