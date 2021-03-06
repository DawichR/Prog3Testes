﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Prog3Final;

namespace Prog3Final.Controllers
{
    public class EmpleadosController : Controller
    {
        private DBRecursosHumanos db = new DBRecursosHumanos();


       [HttpGet]
        public ActionResult Index(string nombre, string apellido, string departamento)
        {
            ViewBag.Departamentos = new SelectList(db.Departamentos, "id", "Nombre");

            if (nombre != "" && apellido != "" && departamento == "Ninguno")
            {

                var empleados = db.Empleados.Where(d => d.Nombre == nombre && d.Apellido == apellido);

                return View(empleados.ToList());

            }
            else if (nombre == "" && apellido != "" && departamento == "Ninguno")
            {

                var empleados = db.Empleados.Where(d => d.Apellido == apellido);
                return View(empleados.ToList());

            }
            else if (nombre == "" && apellido == "" && departamento != "Ninguno")
            {
                var empleados = db.Empleados.Where(d => d.Departamento == int.Parse(departamento));
                return View(empleados.ToList());
            }
            else if (nombre != "" && apellido == "" && departamento != "Ninguno")
            {

                var empleados = db.Empleados.Where(d => d.Departamento == Convert.ToInt32(departamento) && d.Nombre == nombre);
                return View(empleados.ToList());

            }
            else if (nombre == "" && apellido != "" && departamento != "Ninguno")
            {

                var empleados = db.Empleados.Where(d => d.Departamento == Convert.ToInt32(departamento) && d.Apellido == apellido);
                return View(empleados.ToList());

            }
            else if (nombre != "" && apellido == "" && departamento == "Ninguno")
            {
                var empleados = db.Empleados.Where(d => d.Nombre == nombre);
                return View(empleados.ToList());
            }
            else
            {
                ViewBag.NoHay = "Complete los campos antes de iniciar la busqueda";


                return View(db.Empleados.ToList());
            }




        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleados.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        public ActionResult Create()
        {
            ViewBag.Cargo = new SelectList(db.Cargos, "Id", "Nombre");
            ViewBag.Departamentos = new SelectList(db.Departamentos, "Id", "Nombre");

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Codigo,Nombre,Apellido,Telefono,genero,Departamento,Cargo,FechaIngreso,Salario,estatus")] Empleado empleado)
        {
            
            if (ModelState.IsValid)
            {
                db.Empleados.Add(empleado);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Cargo = new SelectList(db.Cargos, "Id", "Codigo", empleado.Cargo);
            return View(empleado);
        }

        // GET: Empleados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleados.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            ViewBag.Cargo = new SelectList(db.Cargos, "Id", "Codigo", empleado.Cargo);
            return View(empleado);
        }

        // POST: Empleados/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Codigo,Nombre,Apellido,Telefono,genero,Departamento,Cargo,FechaIngreso,Salario,estatus")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleado).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Cargo = new SelectList(db.Cargos, "Id", "Codigo", empleado.Cargo);
            return View(empleado);
        }

        // GET: Empleados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleados.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // POST: Empleados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Empleado empleado = db.Empleados.Find(id);
            db.Empleados.Remove(empleado);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Entrada()
        {

            return View(db.Empleados.ToList());
        }


        [HttpPost]
        public ActionResult Entrada(string mes)
        {
            if (mes != "Ninguno")
            {
                int Mes = Convert.ToInt32(mes);

                return View(db.Empleados.Where(d => d.FechaIngreso.Month == Mes).ToList());
            }
            else
            {
                ViewBag.ErrorPerezGuzman = "Seleccione el mes";
                return View(db.Empleados.ToList());
            }

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
