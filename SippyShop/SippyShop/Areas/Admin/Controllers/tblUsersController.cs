using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SippyShop.Models;

namespace SippyShop.Areas.Admin.Controllers
{
    public class tblUsersController : Controller
    {
        private SippyShopEntities db = new SippyShopEntities();

        // GET: Admin/tblUsers
        public ActionResult Index(string searchValue)
        {
            Session.Add("PAGE", "User");
            var tblUser = from t in db.tblUsers select t;
            if (searchValue != null)
            {
                tblUser = from t in db.tblUsers where t.name.Contains(searchValue) select t;
            }
            return View(tblUser.ToList());
        }

        // GET: Admin/tblUsers/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id+".com");
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // GET: Admin/tblUsers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/tblUsers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "name,password,role,phoneNum,img,email,address")] tblUser tblUser,HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                tblUser pro = db.tblUsers.Find(tblUser.email);
                if (pro != null)
                {
                    Session.Add("DUPLICATEUSE", "Duplicate EMAIL");
                    return View(tblUser);
                }
               
                var fileName = "";
                var path = "";
                if (img != null)
                {
                    fileName = img.FileName;
                    path = Path.Combine(Server.MapPath("~/Content/image"), fileName);
                    img.SaveAs(path);
                    tblUser.img = "/Content/image/" + fileName;
                }
                else
                {
                    tblUser.img = null;
                }
                db.tblUsers.Add(tblUser);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
       
            return View(tblUser);
        }

        // GET: Admin/tblUsers/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id+".com");
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // POST: Admin/tblUsers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "name,password,role,phoneNum,img,email,address")] tblUser tblUser,HttpPostedFileBase img)
        {
            var fileName = "";
            var path = "";
            if (ModelState.IsValid)
            {
                if (img != null)
                {
                    fileName = img.FileName;
                    path = Path.Combine(Server.MapPath("~/Content/image"),fileName);
                    img.SaveAs(path);
                    tblUser.img = "/Content/image/" + fileName;
                }
                else
                {
                    tblUser.img = null;
                }

                db.Entry(tblUser).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tblUser);
        }

        // GET: Admin/tblUsers/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblUser tblUser = db.tblUsers.Find(id+".com");
            if (tblUser == null)
            {
                return HttpNotFound();
            }
            return View(tblUser);
        }

        // POST: Admin/tblUsers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tblUser tblUser = db.tblUsers.Find(id);
            db.tblUsers.Remove(tblUser);
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
