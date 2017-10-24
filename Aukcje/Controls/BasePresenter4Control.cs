using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aukcje;

namespace Aukcje.Controls
{
    public abstract class BasePresenter4Control<TView> : IBasePresenter<TView> where TView : IBaseView
    {
        public abstract TView View { get; set; }
    }
}