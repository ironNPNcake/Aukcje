using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Aukcje.Controls
{
    public class BaseView4Control<TPresenter> : System.Web.UI.UserControl, IBaseView where TPresenter : IBasePresenter<IBaseView>, new()
    {
        protected TPresenter Presenter;
        public void AttachPresenter()
        {
            Presenter = new TPresenter();
            Presenter.View = this;
        }
    }
}