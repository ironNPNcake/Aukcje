using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aukcje
{
    public partial class AuctoinPresenter : BaseView<SingleAuctionPresenter>, ISingleAuctionView
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IEnumerable<Auction> Select()
        {
            AttachPresenter();
            return Presenter.SelectItems();
        }
    }
}