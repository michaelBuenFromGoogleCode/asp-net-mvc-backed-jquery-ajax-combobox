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

        protected override void BindProperty(ControllerContext controllerContext, ModelBindingContext bindingContext, System.ComponentModel.PropertyDescriptor propertyDescriptor)
        {
            base.BindProperty(controllerContext, bindingContext, propertyDescriptor);


            
            for (int i = 0; i < propertyDescriptor.Attributes.Count; i++)
            {
                if (propertyDescriptor.Attributes[i].GetType() == typeof(BindingNameAttribute))
                {

                    object value = controllerContext.HttpContext.Request[(propertyDescriptor.Attributes[i] as BindingNameAttribute).Name];
                    if (propertyDescriptor.PropertyType == typeof(int))
                        propertyDescriptor.SetValue(bindingContext.Model, Convert.ToInt32(value));
                    else
                        propertyDescriptor.SetValue(bindingContext.Model, value);

                    break;
                }
            }
        }
    }// class PropertyBinder

    public class BindingNameAttribute : Attribute
    {
        public string Name { get; set; }

        public BindingNameAttribute() { }

        public BindingNameAttribute(string name) { Name = name; }
    }
}