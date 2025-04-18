using System;
using System.Collections.Generic;

#nullable disable

namespace Pizzeria_App.Models
{
    public partial class Position
    {
        public Position()
        {
            Orders = new HashSet<Order>();
        }

        public int PositionId { get; set; }
        public int? PizzaId { get; set; }
        public int? SizeId { get; set; }
        public int? Weight { get; set; }
        public decimal? Price { get; set; }

        public virtual Pizza Pizza { get; set; }
        public virtual Size Size { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
    }
}
