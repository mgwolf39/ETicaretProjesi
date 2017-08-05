using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ETicaretProjesi.Models
{
    public class ProductModel
    {
        public string ID { get; set; }
        public string CategoryID { get; set; }
        public string Title { get; set; }
        public string SubTitle { get; set; }
        public string Price { get; set; }
        public string Description { get; set; }
        public string ShippingInfo { get; set; }
        public string ReviewCount { get; set; }
        public string Rating { get; set; }
    }
}