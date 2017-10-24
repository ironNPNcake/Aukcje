using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Aukcje.Controls
{
    public class SearchBarPresenter : BasePresenter4Control<IBaseView>
    {
        private SearchBar view;
        public override IBaseView View
        {
            get
            {
                return view;
            }

            set
            {
                view = value as SearchBar;
            }
        }

        public string QueryString()
        {
            return $"product={view.SearchedItem}&category={(int)view.FilterCategory}";
        }
    }
}