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
    public class tblReciptsController : Controller
    {
        private SippyShopEntities db = new SippyShopEntities();

        // GET: Admin/tblRecipts
        public ActionResult Index(string seachValue)
        {
            Session.Add("PAGE", "Recipt");
            var v = from t in db.tblRecipts where t.stt != 0 select t;
            var tblRecipts = v.Include(t => t.tblUser);
            if (seachValue != null)
            {
                tblRecipts = from t in db.tblRecipts where t.name.Contains(seachValue) select t;
            }
            return View(tblRecipts.ToList());
        }

        // GET: Admin/tblRecipts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var v = from t in db.tblReciptDetails where t.reciptId == id select t;
            v.Include(t=> t.tblProduct);
            return View(v.ToList());
        }

        // GET: Admin/tblRecipts/Create
        public ActionResult Create()
        {
            ViewBag.email = new SelectList(db.tblUsers, "email", "name");
            return View();
        }

        // POST: Admin/tblRecipts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "reciptId,email,price,sale,name,phone,address,type,date")] tblRecipt tblRecipt)
        {
            if (ModelState.IsValid)
            {
                db.tblRecipts.Add(tblRecipt);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.email = new SelectList(db.tblUsers, "email", "name", tblRecipt.email);
            return View(tblRecipt);
        }

        // GET: Admin/tblRecipts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRecipt tblRecipt = db.tblRecipts.Find(id);
            if (tblRecipt == null)
            {
                return HttpNotFound();
            }
            ViewBag.email = new SelectList(db.tblUsers, "email", "name", tblRecipt.email);
            return View(tblRecipt);
        }

        // POST: Admin/tblRecipts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "reciptId,email,price,sale,name,phone,address,type,date")] tblRecipt tblRecipt,string stt)
        {
            if (ModelState.IsValid)
            {
                if (stt.Equals("In process"))
                {
                    tblRecipt.stt = 1;
                }
                else if(stt.Equals("Completed"))
                {
                    tblRecipt.stt = 2;
                }
                else
                {
                    tblRecipt.stt = 3;
                }
                db.Entry(tblRecipt).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.email = new SelectList(db.tblUsers, "email", "name", tblRecipt.email);
          
            return View(tblRecipt);
        }

        // GET: Admin/tblRecipts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblRecipt tblRecipt = db.tblRecipts.Find(id);
            if (tblRecipt == null)
            {
                return HttpNotFound();
            }
            return View(tblRecipt);
        }

        // POST: Admin/tblRecipts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tblRecipt tblRecipt = db.tblRecipts.Find(id);
            tblRecipt.stt = 0;
            db.Entry(tblRecipt).State = EntityState.Modified;
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
