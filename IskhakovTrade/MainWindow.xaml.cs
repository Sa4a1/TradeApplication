using IskhakovTrade.Resources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace IskhakovTrade
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            
        }

        private void AuthorBtn_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ProductPage()); ;
            AuthorBtn.Visibility = Visibility.Hidden;
            AutBtn.Visibility = Visibility.Hidden;
            LogingTxt.Visibility = Visibility.Hidden;
            PasswordTxt.Visibility = Visibility.Hidden;
        }
    }
}
