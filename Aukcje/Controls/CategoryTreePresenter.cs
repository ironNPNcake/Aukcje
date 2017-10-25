using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Aukcje.Controls
{
    public class CategoryTreePresenter : BasePresenter4Control<IBaseView>
    {
        private CategoryTree view;
        public override IBaseView View
        {
            get
            {
                return view;
            }

            set
            {
                view = value as CategoryTree;
            }
        }
        public void UpdateTree()
        {
            if (view.Menu.Items.Count > 1)
                view.Menu.Items.RemoveAt(1);


            string categoryString = view.queryString["category"];
            if (!String.IsNullOrEmpty(categoryString))
            {
                string CategoryRes;
                switch (categoryString)
                {
                    case "0":
                        CategoryRes = Resources.Resource.Electronics;
                        break;
                    case "1":
                        CategoryRes = Resources.Resource.Clothes;
                        break;
                    case "2":
                        CategoryRes = Resources.Resource.HomeAndGarden;
                        break;
                    default:
                        CategoryRes = Resources.Resource.AllCategories;
                        break;

                }

                view.Menu.Items.Add(new System.Web.UI.WebControls.MenuItem(CategoryRes, "0", null, $"~/AuctionsList.aspx?category={categoryString}"));

            }
        }
        public void UpdateTree(MenuEventArgs e)
        {
            if (view.Menu.Items.Count > 1)
                view.Menu.Items.RemoveAt(1);

            string categoryString = e.Item.Value;
            //string categoryString = view.queryString["category"];
            if (!String.IsNullOrEmpty(categoryString))
            {
                string CategoryRes;
                switch (categoryString)
                {
                    case "0":
                        CategoryRes = Resources.Resource.Electronics;
                        break;
                    case "1":
                        CategoryRes = Resources.Resource.Clothes;
                        break;
                    case "2":
                        CategoryRes = Resources.Resource.HomeAndGarden;
                        break;
                    default:
                        CategoryRes = Resources.Resource.AllCategories;
                        break;

                }

                view.Menu.Items.Add(new System.Web.UI.WebControls.MenuItem(CategoryRes, categoryString, null, $"~/AuctionsList.aspx?category={categoryString}"));
            }

        }
    }
}