using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Restaurante.Models;

namespace Restaurante.ViewModel
{
    public class MenuViewModel
    {
        public List<Plato> LstPlatos { get; set; }
        public List<Plato> PlatosSeleccionados { get; set; }


        public int PedidoId { get; set; }
        public String Nombre { get; set; }
        public String Apellido { get; set; }
        public String Email { get; set; }
        public String Celular { get; set; }
        public String Direccion { get; set; }
        public String Fecha { get; set; }
        public String Hora { get; set; }


        public MenuViewModel()
        {
            Fill();
        }



        public void Fill()
        {
            RestaurantEntities context = new RestaurantEntities();           
            
            var query = context.Plato.Where(x => x.Visible == true).AsQueryable();
            LstPlatos = query.ToList();

        }



    }
}