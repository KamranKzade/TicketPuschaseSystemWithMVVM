using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using TicketPuschaseSystemWithMVVM.Commads;
using TicketPuschaseSystemWithMVVM.Domain.Entities;

namespace TicketPuschaseSystemWithMVVM.Domain.ViewModels
{
    public class PassengerViewModel : BaseViewModel
    {
        public RelayCommand MinimizeCommand { get; set; }
        public RelayCommand CloseCommand { get; set; }
        public RelayCommand BuyTicketCommand { get; set; }


        public PassengerViewModel(Ticket ticket)
        {
            MinimizeCommand = new RelayCommand((o) =>
            {
                var window = o as Window;
                window.WindowState = WindowState.Minimized;
            });

            CloseCommand = new RelayCommand((o) =>
            {
                Application.Current.Shutdown();
            });

            BuyTicketCommand = new RelayCommand((o) =>
            {
                var stackPanel = o as StackPanel;

                var name = (stackPanel.Children[2] as TextBox).Text;
                var surname = (stackPanel.Children[4] as TextBox).Text;
                var isMale = ((stackPanel.Children[5] as StackPanel).Children[1] as RadioButton).IsChecked;
                var birthday = (stackPanel.Children[7] as Calendar).SelectedDate;

                int count = 0;
                StringBuilder sb = new StringBuilder();
                if (string.IsNullOrWhiteSpace(name))
                {
                    sb.Append("Please, Enter Name\n");
                    count++;
                }
                if (string.IsNullOrWhiteSpace(surname))
                {
                    sb.Append("Please, Enter Surname\n");
                    count++;
                }
                if (birthday is null)
                {
                    sb.Append("Please, Enter Birthday\n");
                }

                if (count > 0)
                {
                    MessageBox.Show(sb.ToString(), "Information", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else
                {
                    Passenger passenger = new Passenger
                    {
                        Name = name,
                        Surname = surname,
                        Gender = isMale.Value,
                        BirthDay = birthday.Value,
                    };

                    using (var context = new TicketDBEntities())
                    {
                        Ticket ticket1 = new Ticket
                        {
                            Passenger = passenger,
                            CityId = ticket.CityId,
                            AirplaneId = ticket.AirplaneId,
                            ScheduleId = ticket.ScheduleId,
                        };

                        context.Entry(ticket1).State = EntityState.Added;
                        context.Entry(passenger).State = EntityState.Added;
                        context.SaveChanges();

                        MessageBox.Show("Successfully Buy Ticket", "Information", MessageBoxButton.OK, MessageBoxImage.Information);
                        Application.Current.Shutdown();
                    }
                }
            });
        }
    }
}
