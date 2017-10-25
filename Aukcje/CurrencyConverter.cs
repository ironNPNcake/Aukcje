using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Aukcje
{
    public class CurrencyConverter
    {
        private decimal amountOfMoney;
        //HttpResponseMessage response;
        System.Threading.Tasks.Task<HttpResponseMessage> response;
        static string URI = @"GET / webservices / CurrencyServer4.asmx / ConvertToNum ? licenseKey = string & fromCurrency = string & toCurrency = string & amount = string & rounding = string & date = string & type = string HTTP / 1.1
Host: fx.currencysystem.com";

        static async public void ConvertMoney(int amount, string destinationCurrency)
        {
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://fx.currencysystem.com/webservices/CurrencyServer4.asmx");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpResponseMessage response =  await client.GetAsync(URI);


            //    response = client.GetAsync(URI);
            }

            //return 5m;
        }
    }
}