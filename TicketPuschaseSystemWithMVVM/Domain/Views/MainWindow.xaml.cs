using System.Windows;
using TicketPuschaseSystemWithMVVM.Domain.ViewModels;


namespace TicketPuschaseSystemWithMVVM
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            var vm = new MainViewModel();
            this.DataContext  = vm;

        }
    }
}