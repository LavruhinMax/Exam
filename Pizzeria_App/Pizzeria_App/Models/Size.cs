using System;
using System.Collections.Generic;

#nullable disable

namespace Pizzeria_App.Models
{
    public partial class Size
    {
        public Size()
        {
            Positions = new HashSet<Position>();
        }

        public int SizeId { get; set; }
        public string Size1 { get; set; }

        public virtual ICollection<Position> Positions { get; set; }
    }
}
