﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Aukcje.Controls
{
    public class AccountDetailsPresenter :BasePresenter4Control<IBaseView>
    {
        private AccountDetails view;

        public override IBaseView View
        {
            get { return view; }
            set { view = value as AccountDetails; }
        }

        public IEnumerable ShowUserDetails()
        {
            IEnumerable<Aukcje.UserWithRating> list;
            string UID = view.UName;

            using (var ctx = new bazaEntities())
        {
            list = from p in ctx.aspnet_Users
                join d in ctx.aspnet_Membership
                on p.UserId equals d.UserId
                where p.UserName.Equals(UID)
                select new UserWithRating()
                {
                    currentUser = p,
                    rate = d.Rating
                };
            list = list.ToList();
        }

        return list;
        }

    }
}