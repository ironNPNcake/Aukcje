using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Aukcje
{
    public class AuctionsListPresenter : BasePresenter<IBaseView>
    {
        private AuctionsList view;
        public override IBaseView View
        {
            get
            {
                return view;
            }

            set
            {
                view = value as AuctionsList;
            }
        }

        public IEnumerable SelectAuctionsList()
        {
            IEnumerable<Auction> list;
            using (var ctx = new bazaEntities())
            {
                list = ctx.Auctions.ToList();
            }
            list = list.Where(p => p.status == "otwarte");
            //catgory filtering
            if ((int)view.FilterCategory < 3)
            {
                list = list.Where(p => p.Category == (int)view.FilterCategory);
                //     ((Aukcje.Site)this.Page.Master).changeValueInDropDowCategoryList((int)category);
            }

            if (!String.IsNullOrEmpty(view.SearchedItem))
            {
                list = list.Where(p => (p.Title.IndexOf(view.SearchedItem, StringComparison.OrdinalIgnoreCase) >= 0));
                //     ((Aukcje.Site)this.Page.Master).changeValueInTextSearchBar(SearchedItem);
            }


            list = list.Where(p => p.Price >= view.FilterLowPrice && p.Price <= view.FilterHighPrice);
            //color filtering
            foreach (ListItem listItem in view.FilterColorCheckBoxList.Items)
            {
                if (listItem.Selected)
                {
                    list = list.Where(p =>
                        (view.FilterColorCheckBoxList.Items[0].Selected ? p.Color == 0 : false) ||
                        (view.FilterColorCheckBoxList.Items[1].Selected ? p.Color == 1 : false) ||
                        (view.FilterColorCheckBoxList.Items[2].Selected ? p.Color == 2 : false)
                    );
                    break;
                }
            }
            foreach (Auction auction in list)
            {
                auction.Price = CurrencyConverter.ConvertMoney(auction.Price);
            }
            return list;
        }

    }
}