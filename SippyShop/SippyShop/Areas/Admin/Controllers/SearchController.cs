using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SippyShop.Areas.Admin.Controllers
{
    public class SearchController : Controller
    {
        // GET: Admin/Search
        public ActionResult Index(string searchValue)
        {
            string a = (string)Session["PAGE"];
            if(a== null || a.Equals("Product"))
            {
                return RedirectToAction("Index","tblProducts",new { searchValue=searchValue});
            }
            else if (a.Equals("Category"))
            {
                return RedirectToAction("Index", "tblCategories", new { searchValue = searchValue });
            }
            else if (a.Equals("User"))
            {
                return RedirectToAction("Index", "tblUsers", new { searchValue = searchValue });
            }
            else if (a.Equals("Recipt"))
            {
                return RedirectToAction("Index", "tblRecipts", new { searchValue = searchValue });
            }
            else if (a.Equals("Registration"))
            {
                return RedirectToAction("Index", "tblRegistrations", new { searchValue = searchValue });
            }
            return View();
        }
    }
}