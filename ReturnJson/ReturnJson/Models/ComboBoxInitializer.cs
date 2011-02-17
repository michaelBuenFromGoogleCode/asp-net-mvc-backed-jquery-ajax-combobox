using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ReturnJson.GeneralPurposeCode;

namespace ReturnJson.Models
{
    public class ComboBoxInitializer
    {
        [BindingName("db_table")] public string DbTable { get; set; }
        [BindingName("q_word")] public string QueryWord { get; set; }
        [BindingName("field")] public string Field { get; set; }
        [BindingName("primary_key")] public string PrimaryKey { get; set; }
        
    }
}