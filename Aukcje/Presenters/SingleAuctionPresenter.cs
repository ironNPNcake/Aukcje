using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Aukcje
{
    public class SingleAuctionPresenter : BasePresenter<IBaseView>
    {
        private ISingleAuctionView view;
        public override IBaseView View
        {
            get
            {
                return view;
            }

            set
            {
                view = value as ISingleAuctionView;
            }
        }

        public IEnumerable<Aukcje.Auction> SelectItems()
        {
            IEnumerable<Auction> list = new List<Auction>();

            using (var ctx = new bazaEntities())
            {
                list = ctx.Auctions.ToList();
                list = list.Where(p => p.ID == Convert.ToInt32(HttpContext.Current.Request.QueryString["ID"]));
            }
            foreach (Auction auction in list)
            {
                auction.Price = CurrencyConverter.ConvertMoney(auction.Price);
            }
            return list;
        }
    }
}