using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SippyShop.Models;

namespace SippyShop.Areas.Admin.Controllers
{
    public class tblRegistrationsController : Controller
    {
        private SippyShopEntities db = new SippyShopEntities();

        // GET: Admin/tblRegistrations
        public ActionResult Index(string searchValue)
        {
            Session.Add("PAGE", "Registration");
            var tblRegistrations = from t in db.tblRegistrations select t;
            if (searchValue != null)
            {
                tblRegistrations = from t in db.tblRegistrations where t.email.Contains(searchValue) select t;
            }
            return View(tblRegistrations.ToList());
        }

        // GET: Admin/tblRegistrations/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRegistration tblRegistration = db.tblRegistrations.Find(id);
            if (tblRegistration == null)
            {
                return HttpNotFound();
            }
            return View(tblRegistration);
        }

        // GET: Admin/tblRegistrations/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/tblRegistrations/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "email,password")] tblRegistration tblRegistration)
        {
            if (ModelState.IsValid)
            {
                db.tblRegistrations.Add(tblRegistration);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tblRegistration);
        }

        // GET: Admin/tblRegistrations/Edit/5
        public ActionResult Acept(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRegistration tblRegistration = db.tblRegistrations.Find(id+".com");
            if (tblRegistration == null)
            {
                return HttpNotFound();
            }
            db.tblRegistrations.Remove(tblRegistration);
            db.SaveChanges();
            tblUser user = new tblUser();
            user.email = tblRegistration.email;
            user.password = tblRegistration.password;
            user.role = "User";
            db.tblUsers.Add(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/tblRegistrations/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRegistration tblRegistration = db.tblRegistrations.Find(id+".com");
            if (tblRegistration == null)
            {
                return HttpNotFound();
            }
            return View(tblRegistration);
        }

        // POST: Admin/tblRegistrations/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tblRegistration tblRegistration = db.tblRegistrations.Find(id+".com");
            db.tblRegistrations.Remove(tblRegistration);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
