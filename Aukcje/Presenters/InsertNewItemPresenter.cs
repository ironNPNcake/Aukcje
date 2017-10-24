using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Aukcje
{
    public class InsertNewItemPresenter : BasePresenter<IBaseView>
    {
        private InsertNewItem view;
        public override IBaseView View
        {
            get
            {
                return view;
            }

            set
            {
                view = value as InsertNewItem;
            }
        }

        private void ClearLabels()
        {
            view.ControlLabel.Text = "";
            view.AuctionCategoryType = 0;
            view.AuctionColor = 0;
            view.AuctionDescrition = "";
            view.AuctionPrice = 0;
            view.AuctionName = "";
        }

        public void AddNewItem()
        {
            try
            {
                Auction currentItem = new Auction()
                {
                    Title = view.AuctionName,
                    Category = (int)view.AuctionCategoryType,
                    Color = (int)view.AuctionColor,
                    Description = view.AuctionDescrition,
                    Price = view.AuctionPrice,
                    seller = System.Web.Security.Membership.GetUser().UserName,
                    status = "otwarte",
                    Image = view.AuctionImageBytes
                };
                using (var ctx = new bazaEntities())
                {
                    ctx.Auctions.Add(currentItem);
                    ctx.SaveChanges();
                }
            }
            catch
            {
                view.ControlLabel.Visible = true;

                view.ControlLabel.Text = "Somenthing went wrong try again lter";
                view.ControlLabel.Font.Size = 32;
            }
            ClearLabels();

            view.ControlLabel.Text = "Congrats! Your Item was succesfully added";
            view.ControlLabel.Font.Size = 32;
        }
    }
}