using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ReturnJson.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult English()
        {        
            return View();
        }

        public ActionResult Japanese()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

    }
}
