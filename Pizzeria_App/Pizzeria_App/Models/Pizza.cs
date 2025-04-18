using System;
using System.Collections.Generic;

#nullable disable

namespace Pizzeria_App.Models
{
    public partial class Pizza
    {
        public Pizza()
        {
            Positions = new HashSet<Position>();
        }

        public int PizzaId { get; set; }
        public string PizzaName { get; set; }
        public string Ingredients { get; set; }

        public virtual ICollection<Position> Positions { get; set; }
    }
}
