using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Aukcje.Models
{
    public class Auctions0
    {
        [Key, Display(Name = "ID")]
        [ScaffoldColumn(false)]
        public int AuctionId { get; set; }

        public  string AuctionImage { get; set; }

        [Required, StringLength(40), Display(Name = "Title")]
        public string AuctionName { get; set; }

        public int Category { get; internal set; }
        public string Description { get; internal set; }
        [Required, Display(Name = "Price")]
        public decimal Price{ get; set; }
    }

}