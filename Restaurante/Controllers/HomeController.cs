using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Restaurante.Models;
using Restaurante.ViewModel;
using System.Web.Mvc;


namespace Restaurante.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View("Index");
        }
        
        public ActionResult Menu()
        {
            MenuViewModel objViewModel = new MenuViewModel();
            return View(objViewModel);
        }

        [HttpPost]
        public ActionResult AddPedido(MenuViewModel objViewModel)
        {
            try
            {
                Pedido objPedido = new Pedido();
                RestaurantEntities context = new RestaurantEntities();
                context.Pedido.Add(objPedido);

                objPedido.Nombre = objViewModel.Nombre;
                objPedido.Apellido = objViewModel.Apellido;
                objPedido.Celular = objViewModel.Celular;
                objPedido.Direccion = objViewModel.Direccion;
                objPedido.Email = objViewModel.Email;
                objPedido.Fecha = DateTime.Parse(objViewModel.Fecha);
                
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            catch(Exception ex)
            {
                return View(objViewModel);
            }
        }


        [HttpPost]
        public ActionResult AddPedidoPlatos(MenuViewModel objViewModel)
        {
            try
            {
                Pedido objPedido = null;
                List<Plato> lista = new List<Plato>();
                RestaurantEntities context = new RestaurantEntities();
                
                lista.Add(context.Plato.FirstOrDefault(x => x.PlatoId == 2));
                lista.Add(context.Plato.FirstOrDefault(x => x.PlatoId == 3));
                lista.Add(context.Plato.FirstOrDefault(x => x.PlatoId == 5));

                objPedido = (context.Pedido.FirstOrDefault(x => x.PedidoId == 1));

                foreach(var x in lista)
                {

                    Plato_Pedido temp = new Plato_Pedido();
                    context.Plato_Pedido.Add(temp);
                    temp.PlatoId = x.PlatoId;
                    temp.PedidoId = objPedido.PedidoId;
                    temp.Cantidad = "5";
                    context.SaveChanges();
                }
                context.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                return View(objViewModel);
            }
        }

    }
}