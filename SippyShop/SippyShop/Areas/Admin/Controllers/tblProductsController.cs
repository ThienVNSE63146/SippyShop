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
    public class tblProductsController : Controller
    {
        private SippyShopEntities db = new SippyShopEntities();

        // GET: Admin/tblProducts
        public ActionResult Index(string searchValue)
        {
            Session.Add("PAGE", "Product");
            var tblProducts = db.tblProducts.Include(t => t.tblCategory);
            if (searchValue != null)
            {
                tblProducts = from t in db.tblProducts where t.name.Contains(searchValue) select t;
            }
          
            return View(tblProducts.ToList());
        }

        // GET: Admin/tblProducts/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProduct tblProduct = db.tblProducts.Find(id);
            if (tblProduct == null)
            {
                return HttpNotFound();
            }
            return View(tblProduct);
        }

        // GET: Admin/tblProducts/Create
        public ActionResult Create()
        {
            ViewBag.categoryId = new SelectList(db.tblCategories, "categoryId", "name");
            return View();
        }

        // POST: Admin/tblProducts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput (false)]
        public ActionResult Create([Bind(Include = "productId,name,quantity,price,sale,img,detail,categoryId")] tblProduct tblProduct,HttpPostedFileBase img)
        {
            var path = "";
            var fileName = "";
            if (ModelState.IsValid)
            {
                tblProduct pro = db.tblProducts.Find(tblProduct.productId);
                if (pro != null)
                {
                    Session.Add("DUPLICATEPRO", "Duplicate Product ID");
                    ViewBag.categoryId = new SelectList(db.tblCategories, "categoryId", "name", tblProduct.categoryId);
                    return View(tblProduct);

                }
               
                if (img != null)
                {
                    fileName = img.FileName;
                    path = Path.Combine(Server.MapPath("~/Content/image"), fileName);
                    img.SaveAs(path);
                    tblProduct.img = "/Content/image/" + fileName;
                }
                else
                {
                    tblProduct.img = null;
                }
              
                db.tblProducts.Add(tblProduct);
                db.SaveChanges();
                Session.Remove("DUPLICATEPRO");
                return RedirectToAction("Index");
            }
          
            ViewBag.categoryId = new SelectList(db.tblCategories, "categoryId", "name", tblProduct.categoryId);
            return View(tblProduct);
        }

        // GET: Admin/tblProducts/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProduct tblProduct = db.tblProducts.Find(id);
            if (tblProduct == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryId = new SelectList(db.tblCategories, "categoryId", "name", tblProduct.categoryId);
            return View(tblProduct);
        }

        // POST: Admin/tblProducts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "productId,name,quantity,price,sale,detail,categoryId")] tblProduct tblProduct,HttpPostedFileBase img)
        {
            if (ModelState.IsValid)
            {
                var fileName = "";
                var path = "";
                if (img != null)
                {
                    fileName = img.FileName;
                    path = Path.Combine(Server.MapPath("~/Content/image"), fileName);
                    img.SaveAs(path);
                    tblProduct.img = "/Content/image/" + fileName;
                }
               
                db.Entry(tblProduct).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoryId = new SelectList(db.tblCategories, "categoryId", "name", tblProduct.categoryId);
            return View(tblProduct);
        }

        // GET: Admin/tblProducts/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tblProduct tblProduct = db.tblProducts.Find(id);
            if (tblProduct == null)
            {
                return HttpNotFound();
            }
            return View(tblProduct);
        }

        // POST: Admin/tblProducts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            tblProduct tblProduct = db.tblProducts.Find(id);
            db.tblProducts.Remove(tblProduct);
           
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
