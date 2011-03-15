using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReturnJson.GeneralPurposeCode
{

    // If only ASP.NET MVC supported binding a request's value to a property with different name, we wouldn't need this

    // Sourced from: 
    // http://stackoverflow.com/questions/4316301/asp-net-mvc-2-bind-a-models-property-to-a-different-named-value/4720211#4720211
    public class PropertyBinder : DefaultModelBinder
    {
        /*int z = 0;
        string sz = "";*/
        protected override void BindProperty(ControllerContext controllerContext, ModelBindingContext bindingContext, System.ComponentModel.PropertyDescriptor propertyDescriptor)
        {
            base.BindProperty(controllerContext, bindingContext, propertyDescriptor);


            

            /*
            sz += ", " + propertyDescriptor.Name;
            ++z;

            if (z == 9)            
                throw new Exception(sz);*/

            /*if (propertyDescriptor.Name == "SelectField")
                throw new Exception(controllerContext.HttpContext.Request["select_field"]);*/

            /*if (propertyDescriptor.Name == "ShowFieldRaw")
                throw new Exception(controllerContext.HttpContext.Request["show_field"]);*/
            
            foreach (var p in propertyDescriptor.Attributes)
            {
                if (p.GetType() == typeof(BindingNameAttribute))
                {
                    var b = p as BindingNameAttribute;
                    object value = controllerContext.HttpContext.Request[b.Name];
                    

                    if (propertyDescriptor.PropertyType == typeof(int))
                        propertyDescriptor.SetValue(bindingContext.Model, Convert.ToInt32(value));
                    else
                        propertyDescriptor.SetValue(bindingContext.Model, value);

                    break;
                }
            }//foreach
            
        }
    }// class PropertyBinder

    public class BindingNameAttribute : Attribute
    {
        public string Name { get; set; }

        public BindingNameAttribute() { }

        public BindingNameAttribute(string name) { Name = name; }
    }
}