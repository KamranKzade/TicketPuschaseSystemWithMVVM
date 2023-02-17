using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TicketPuschaseSystemWithMVVM.Commads;

namespace TicketPuschaseSystemWithMVVM.Domain.ViewModels
{
    public class PassengerViewModel:BaseViewModel
    {
        public RelayCommand MinimizeCommand { get; set; }
        public RelayCommand CloseCommand { get; set; }

        public PassengerViewModel()
        {
            MinimizeCommand = new RelayCommand((o) =>
            {
                var window = o as Window;
                window.WindowState= WindowState.Minimized;
            });

            CloseCommand = new RelayCommand((o) =>
            {
                Application.Current.Shutdown();
            });
        }
    }
}
