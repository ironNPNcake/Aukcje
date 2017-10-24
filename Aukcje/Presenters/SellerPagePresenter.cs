using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Aukcje
{
    public class SellerPagePresenter : BasePresenter<IBaseView>
    {
        private SellerPage view;
        public override IBaseView View
        {
            get
            {
                return view;
            }

            set
            {
                view = value as SellerPage;
            }
        }
        

        public bool ThisIsTheLoggedUser()
        {
            string UID = view.queryStringUID;

            if (!string.IsNullOrEmpty(UID))
            {
                string name = HttpContext.Current.User.Identity.Name;
                if (name == UID)
                {
                    return true;
                }
            }

            return false;
        }
    }
}