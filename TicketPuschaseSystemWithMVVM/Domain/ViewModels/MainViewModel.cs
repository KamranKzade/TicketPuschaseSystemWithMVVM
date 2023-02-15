﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TicketPuschaseSystemWithMVVM.Commads;

namespace TicketPuschaseSystemWithMVVM.Domain.ViewModels
{
    public class MainViewModel:BaseViewModel
    {
        public RelayCommand Minimize_Btn { get; set; }
        public RelayCommand Close_Btn { get; set; }


        public MainViewModel()
        {
            Minimize_Btn = new RelayCommand((o) =>
            {
                var window = o as Window;
                window.WindowState = WindowState.Minimized;
            });

            Close_Btn = new RelayCommand((o) =>
            {
                Application.Current.Shutdown();
            });

        }
    }
}
