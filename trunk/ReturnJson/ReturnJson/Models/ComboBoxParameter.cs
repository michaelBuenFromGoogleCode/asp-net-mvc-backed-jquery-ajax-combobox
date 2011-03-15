using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel;

using ReturnJson.GeneralPurposeCode;

namespace ReturnJson.Models
{

    // If the creator of jQueryAjaxComboBox made the parameters PascalCase,
    // we will not have a need for BindingName

    public class ComboBoxParameter
    {
        
        [BindingName("db_table")] public string DbTable { get; set; }

        [BindingName("q_word")] public string QueryWord { get; set; }
        [BindingName("field")] public string Field { get; set; }


        string _showFieldRaw = "";
        [BindingName("show_field")]
        public string ShowFieldRaw { set { _showFieldRaw = value; ShowFields = _showFieldRaw.Split(','); } get { return _showFieldRaw; } }

        string _hideFieldRaw = "";
        [BindingName("hide_field")]
        public string HideFieldRaw { set { _hideFieldRaw = value; HideFields = _hideFieldRaw.Split(','); } get { return _hideFieldRaw; } }

        [BindingName("primary_key")] public string PrimaryKey { get; set; }

        [BindingName("order_field")] public string OrderField { get; set; }
        [BindingName("order_by")] public string OrderBy { get; set; }

        
        [BindingName("per_page")] public int PerPage { get; set; }

        [BindingName("page_num")] public int PageNum { get; set; }
        [BindingName("select_field")] public string SelectField { get; set; }


        string[] _showFields = new string[] { };
        public string[] ShowFields { private set { _showFields = value; } get { return _showFields; } }

        string[] _hideFields = new string[] { };
        public string[] HideFields { private set { _hideFields = value; } get { return _hideFields; } }

        public int Offset { get { return (PageNum - 1) * PerPage; } }

 
        
    }
}