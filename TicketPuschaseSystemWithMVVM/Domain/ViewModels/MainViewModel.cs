using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    public class MainViewModel : BaseViewModel
    {

        public ObservableCollection<string> MyItemsForCities { get; set; }
        public ObservableCollection<string> MyItemsForSchedules { get; set; }
        public ObservableCollection<string> MyItemsForAirplanes { get; set; }



        private string _mySelectedItemForSchedules;

        public string MySelectedItemForSchedules
        {
            get { return _mySelectedItemForSchedules; }
            set { _mySelectedItemForSchedules = value; OnPropertyChanged(); }
        }


        private string _mySelectedItemForCities;
        public string MySelectedItemForCities
        {
            get { return _mySelectedItemForCities; }
            set { _mySelectedItemForCities = value; OnPropertyChanged(); }
        }

        private string _mySelectedItemForAirplanes;

        public string MySelectedItemForAirplanes
        {
            get { return _mySelectedItemForAirplanes; }
            set { _mySelectedItemForAirplanes = value; OnPropertyChanged(); }
        }





        public RelayCommand Minimize_Btn { get; set; }
        public RelayCommand Close_Btn { get; set; }
        public RelayCommand CityChangedCommand { get; set; }
        public RelayCommand ScheduleChangedCommand { get; set; }
        public RelayCommand AirplaneChangedCommand { get; set; }



        public MainViewModel()
        {
            MyItemsForCities = new ObservableCollection<string>();
            MyItemsForSchedules = new ObservableCollection<string>();
            MyItemsForAirplanes = new ObservableCollection<string>();

            using (var context = new TicketDBEntities())
            {
                var result = new ObservableCollection<City>(context.Cities.ToList());

                foreach (var item in result)
                {
                    MyItemsForCities.Add(item.Name);
                }

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
                var btn = o as Button;
                using (var context = new TicketDBEntities())
                {
                    var city = context.Cities.FirstOrDefault(c => c.Name == MySelectedItemForCities);
                    var cityid = city.Id;


                    var schedules = context.ShowAllScheduleForCity(cityid).ToList();


                    if (MyItemsForSchedules.Count > 0)
                    {
                        MyItemsForSchedules.Clear();
                        MySelectedItemForSchedules = string.Empty;
                    }

                    if (MyItemsForAirplanes.Count > 0)
                    {
                        MyItemsForAirplanes.Clear();
                        MySelectedItemForAirplanes = string.Empty;
                    }

                    foreach (var item in schedules)
                    {
                        MyItemsForSchedules.Add(item.Value.ToShortDateString());
                    }

                    if (MyItemsForAirplanes.Count == 0)
                    {
                        btn.IsEnabled = false;
                    }
                }
            });


            ScheduleChangedCommand = new RelayCommand((o) =>
            {
                using (var context = new TicketDBEntities())
                {
                    if (MySelectedItemForSchedules != null)
                    {
                        var date = DateTime.Parse(MySelectedItemForSchedules);
                        var schedule = context.Schedules.FirstOrDefault(s => s.StartDateTime == date);
                        var scheduleId = schedule.Id;

                        var airplanes = context.ShowAllAirplaneForSchedule(scheduleId).ToList();

                        if (MyItemsForAirplanes.Count > 0)
                        {
                            MyItemsForAirplanes.Clear();
                            MySelectedItemForSchedules = string.Empty;
                        }

                        foreach (var item in airplanes)
                        {
                            MyItemsForAirplanes.Add(item);
                        }

                    }
                }
            });


            AirplaneChangedCommand = new RelayCommand((o) =>
            {
                var btn = o as Button;

                if (MyItemsForAirplanes != null)
                    btn.IsEnabled = true;
                else
                    btn.IsEnabled = false;

            });

        }
    }
}