using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.SqlServer.Dts.Runtime;
using Microsoft.SqlServer.Management.IntegrationServices;
using Microsoft.SqlServer.Management.Smo.Agent;
using System.Data.SqlClient;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Server;
using Microsoft.SqlServer.Management.Common;


namespace ConsoleApplication1
{
    class Program
    {

        static void Main(string[] args)
        {


            SqlConnection conn = new SqlConnection("Data source=NIBS; Database=Books;User Id=GH;Password=GH");
            SqlCommand cmd = new SqlCommand("IF EXISTS(select name from sysobjects where name = 'GH') BEGIN DROP TABLE GH END create table GH(empno int,empname varchar(50),salary money);", conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            Console.WriteLine("Table Created Successfully...");
            conn.Close();


           // Console.ReadKey();
        }


    }
}
