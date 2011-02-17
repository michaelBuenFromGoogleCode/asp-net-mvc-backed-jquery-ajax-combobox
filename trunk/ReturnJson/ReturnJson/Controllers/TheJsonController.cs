using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Finisar.SQLite;
using System.Dynamic;
using System.Collections.Specialized;
using System.Data;
using ReturnJson.Models;

namespace ReturnJson.Controllers
{
    public class TheJsonController : Controller
    {
     
         
        
        public JsonResult List(

            
            [ModelBinder(typeof(ReturnJson.GeneralPurposeCode.PropertyBinder))] 

            ComboBoxParameter p)

        {
            
            using (var cx = Connection)
            {
                cx.Open();

                string query = @"
SELECT   {0}
FROM     {1}
WHERE    {2} LIKE '%{3}%'
ORDER BY (
	CASE
		WHEN {4} LIKE '%{3}%'
		THEN 0
		ELSE 1
	END
),{4} {5}
LIMIT    {6}
OFFSET   {7}";

                // QueryWord should be on SqliteParameter, the real downer 
                // on Finisar's SqliteParameter is it doesn't work on LIMIT and OFFSET clauses.
                string actualQuery = string.Format(query, 
                    p.SelectField, 
                    p.DbTable.Replace("\"", "\"\""), 
                    p.Field.Replace("\"","\"\""), 
                    p.QueryWord.Replace("'", "''"), 
                    p.OrderField, 
                    p.OrderBy, p.PerPage, p.Offset);

               

                var dt = new System.Data.DataTable();
                using(var da = new SQLiteDataAdapter(actualQuery, cx)) da.Fill(dt);


                var dtc = new System.Data.DataTable();
                using (var dac = new SQLiteDataAdapter(
                    string.Format(
                        "SELECT COUNT(*) as cnt FROM {0} WHERE {1} LIKE '%{2}%'",
                        p.DbTable.Replace("\"", "\"\""), p.Field.Replace("\"", "\"\""),
                        p.QueryWord.Replace("'", "''")), cx))
                {
                    dac.Fill(dtc);
                }
          
                long rowCount = Convert.ToInt64(dtc.Rows[0]["cnt"]);


                DataColumn[] dca = new DataColumn[dt.Columns.Count];
                dt.Columns.CopyTo(dca, 0);


                return Json(
                    new
                    {
                        cnt = rowCount

                        ,primary_key =
                            dt.Columns.Contains(p.PrimaryKey) ? dt.Select().Select(x =>  x[p.PrimaryKey].ToString()).ToArray() : new string[] { }
                        

                        ,candidate =
                            dt.Columns.Contains(p.Field) ? dt.Select().Select(x => x[p.Field].ToString()).ToArray() : new string[] { }

                        ,attached = 
                            dt.Select().Select(a =>

                                dca.Where(b => 
                                    b.ColumnName != p.Field
                                    && !p.HideFields.Contains(b.ColumnName)
                                    && (p.ShowFields.Contains("*") || p.ShowFields.Contains(b.ColumnName))

                                ).Select(c => new string[] { c.ColumnName, a[c.ColumnName].ToString() })

                            )
                        
                        ,cnt_page = dt.Rows.Count

                    });
            }// connection
        }//List


        public string InitVal(
            [ModelBinder(typeof(ReturnJson.GeneralPurposeCode.PropertyBinder))] 
            ComboBoxInitializer i)
        {
            string filename = @"UTF8Encoding=True; Data Source=" + System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "test.sqlite");



            using (var cx = Connection)
            {
                cx.Open();



                // QueryWord should be on SqliteParameter, the real downer 
                // on Finisar's SqliteParameter is it doesn't work on LIMIT and OFFSET clauses.
                string actualQuery =
string.Format(
@"select {0}
from {1}
where {2} = '{3}'", 
                  i.Field.Replace("\"","\"\""), 
                  i.DbTable.Replace("\"", "\"\""), 
                  i.PrimaryKey.Replace("\"", "\"\""), 
                  i.QueryWord.Replace("'","''"));


                var dt = new System.Data.DataTable();
                using (var da = new SQLiteDataAdapter(actualQuery, cx)) da.Fill(dt);

                return dt.Rows.Count == 0 ? "" : dt.Rows[0][0].ToString();
                    
            }
             

        }

        public SQLiteConnection Connection
        {
            get
            {
                string filename = @"UTF8Encoding=True; Data Source=" + System.IO.Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "test.sqlite");
                return new SQLiteConnection(filename);
            }
        }

    }// class JsonController

}// namespace
