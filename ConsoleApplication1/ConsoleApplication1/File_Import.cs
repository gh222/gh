using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ConsoleApplication1
{
    class File_Import
    {
        System.Data.DataTable dt                = new System.Data.DataTable();
        string delimiter                        = ",";
        string SQL_Table_ColumnNames            = "select c.name from sys.columns c inner join sys.tables t on t.object_id = c.object_id and t.name = 'Payments' and t.type = 'U'";

        public File_Import()
        {
            string csv_file_path                    = @"D:\10 SQL\Projects\ConsoleApplication1\PaymentFile_Short.txt";
            string database_connection              = @"Data Source=NIBS;Initial Catalog=Books;Integrated Security=SSPI;";
            string destinationTable                 = "Payments";
          
            Import_Csv_Into_SQL(csv_file_path, database_connection, destinationTable);
 
        }

 

        public void Import_Csv_Into_SQL(string csv_file_path, string database_connection, string destinationTable)
        {
            using (Microsoft.VisualBasic.FileIO.TextFieldParser csvreader = new Microsoft.VisualBasic.FileIO.TextFieldParser(csv_file_path))
            {
                // Set Parameters
                csvreader.SetDelimiters(new string[] { delimiter });
                csvreader.HasFieldsEnclosedInQuotes = false;

                // Get Column Names
                string[] filecolumns =   GetFileColumns(csvreader);
                string[] tablecolumns =  GetTableColumns(database_connection);

                if (Enumerable.SequenceEqual(filecolumns, tablecolumns))
                {
                    Console.WriteLine("match");
                    LoadDataTable(csvreader);
                    Bulk_Import_Into_SQL(csv_file_path, database_connection, destinationTable);
                }
                else
                {
                    Console.WriteLine("No Match");
                }
         
            }
        }
         private string[] GetTableColumns(string database_connection)
        {
            List<string> listacolumnas = new List<string>();
            using (System.Data.SqlClient.SqlConnection connection = new System.Data.SqlClient.SqlConnection(database_connection))
            using (System.Data.SqlClient.SqlCommand command = connection.CreateCommand())
            {
                command.CommandText = SQL_Table_ColumnNames;
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        listacolumnas.Add(reader.GetString(0));       
                    }
                }
            }
            return listacolumnas.ToArray(); 
        }
        private string[] GetFileColumns(Microsoft.VisualBasic.FileIO.TextFieldParser csvreader)
        {
            //Get Array of Column Names
            string[] colFields = csvreader.ReadFields();
            foreach (string column in colFields)
            {
                System.Data.DataColumn datacolumn = new System.Data.DataColumn(column);
                datacolumn.AllowDBNull = true;
                dt.Columns.Add(datacolumn);
            }
            return colFields;
        }
        private void LoadDataTable(Microsoft.VisualBasic.FileIO.TextFieldParser csvreader)
        {
            while (!csvreader.EndOfData)
            {
                string[] fieldData = csvreader.ReadFields();
                for (int i = 0; i < fieldData.Length; i++)
                {
                    if (fieldData[i] == "")
                    {
                        fieldData[i] = null;
                    }
                }
                dt.Rows.Add(fieldData);
            }
        }
        private void Bulk_Import_Into_SQL(string csv_file_path, string database_connection, string destinationTable)
        {

            using (System.Data.SqlClient.SqlConnection dbConnection = new System.Data.SqlClient.SqlConnection(database_connection))
            {
                dbConnection.Open();
                System.Data.SqlClient.SqlBulkCopy s = new System.Data.SqlClient.SqlBulkCopy(dbConnection);
                s.DestinationTableName = destinationTable;
                foreach (var column in dt.Columns)
                {
                    s.ColumnMappings.Add(column.ToString(), column.ToString());
                }
                try { s.WriteToServer(dt); }
                catch (Exception e) { Console.WriteLine(e.ToString()); }
                dbConnection.Close();
            }

        }
        private void PrintDataTable()
        {
            foreach (System.Data.DataRow dataRow in dt.Rows)
            {
                foreach (var item in dataRow.ItemArray)
                {
                    Console.WriteLine(item);
                }
            }

        }




    }
}
