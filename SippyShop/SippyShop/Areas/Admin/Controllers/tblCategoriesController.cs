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
    public class tblCategoriesController : Controller
    {
        private SippyShopEntities db = new SippyShopEntities();

        // GET: Admin/tblCategories
        public ActionResult Index(string searchValue)
        {
            Session.Add("PAGE", "Category");
            var tblCategories = db.tblCategories.Include(t => t.tblType);
            if (searchValue != null)
            {
                tblCategories = from t in db.tblCategories where t.name.Contains(searchValue) select t;
            }
            return View(tblCategories.ToList());
        }

        // GET: Admin/tblCategories/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCategory tblCategory = db.tblCategories.Find(id);
            if (tblCategory == null)
            {
                return HttpNotFound();
            }
            return View(tblCategory);
        }

        // GET: Admin/tblCategories/Create
        public ActionResult Create()
        {
            ViewBag.type = new SelectList(db.tblTypes, "type", "type");
            return View();
        }

        // POST: Admin/tblCategories/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "categoryId,name,type")] tblCategory tblCategory)
        {
            if (ModelState.IsValid)
            {
                tblCategory cate = db.tblCategories.Find(tblCategory.categoryId);
                if (cate != null)
                {
                    Session.Add("DUPLICATECAT", "Duplicated CategoryID");
                    ViewBag.type = new SelectList(db.tblTypes, "type", "type", tblCategory.type);
                    return View(tblCategory);
                }
              
                db.tblCategories.Add(tblCategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
          
            
            ViewBag.type = new SelectList(db.tblTypes, "type", "type", tblCategory.type);
            return View(tblCategory);
        }

        // GET: Admin/tblCategories/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCategory tblCategory = db.tblCategories.Find(id);
            if (tblCategory == null)
            {
                return HttpNotFound();
            }
            ViewBag.type = new SelectList(db.tblTypes, "type", "type", tblCategory.type);
            return View(tblCategory);
        }

        // POST: Admin/tblCategories/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "categoryId,name,type")] tblCategory tblCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tblCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.type = new SelectList(db.tblTypes, "type", "type", tblCategory.type);
            return View(tblCategory);
        }

        // GET: Admin/tblCategories/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblCategory tblCategory = db.tblCategories.Find(id);
            if (tblCategory == null)
            {
                return HttpNotFound();
            }
            return View(tblCategory);
        }

        // POST: Admin/tblCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tblCategory tblCategory = db.tblCategories.Find(id);
            db.tblCategories.Remove(tblCategory);
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
