using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TicketPuschaseSystemWithMVVM.Commads;
using TicketPuschaseSystemWithMVVM.Domain.Entities;

namespace TicketPuschaseSystemWithMVVM.Domain.ViewModels
{
    public class MainViewModel : BaseViewModel
    {

        public ObservableCollection<string> MyItemsForCities { get; set; }

        private string _mySelectedItemForCities;
        public string MySelectedItemForCities
        {
            get { return _mySelectedItemForCities; }
            set { _mySelectedItemForCities = value; OnPropertyChanged(); }
        }




        public RelayCommand Minimize_Btn { get; set; }
        public RelayCommand Close_Btn { get; set; }
        public RelayCommand CityChangedCommand { get; set; }



        public MainViewModel()
        {
            MyItemsForCities = new ObservableCollection<string>();

            using (var context = new TicketDBEntities())
            {
                var result = new ObservableCollection<City>(context.Cities.ToList());
                
                foreach (var item in result)
                {
                    MyItemsForCities.Add(item.Name);
                }

                MySelectedItemForCities = MyItemsForCities[0];
            }



            Minimize_Btn = new RelayCommand((o) =>
            {
                var window = o as Window;
                window.WindowState = WindowState.Minimized;
            });

            Close_Btn = new RelayCommand((o) =>
            {
                Application.Current.Shutdown();
            });


            CityChangedCommand = new RelayCommand((o) =>
            {
                MessageBox.Show(MySelectedItemForCities);

                //using (resource)
                //{
                //
                //}
            });
        }
    }
}