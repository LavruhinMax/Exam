using System;
using System.Collections.Generic;

#nullable disable

namespace Pizzeria_App.Models
{
    public partial class Order
    {
        public int OrderId { get; set; }
        public int? PositionId { get; set; }
        public int? ClientId { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal? OrderPrice { get; set; }

        public virtual Client Client { get; set; }
        public virtual Position Position { get; set; }
    }
}
