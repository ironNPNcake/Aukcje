using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aukcje
{
    public interface IBasePresenter<TView> where TView:IBaseView
    {
        TView View { get; set; }
    }
}
