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

        private void LogingTxt_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            LogingTxt.Text = "";
        }

        private void PasswordTxt_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            PasswordTxt.Text = "";
        }

        private async void AutBtn_Click(object sender, RoutedEventArgs e)
        {
            User user = IskhakovTradeEntities.GetContext().User.ToList().Find(p => (p.UserLogin == LogingTxt.Text && p.UserPassword == PasswordTxt.Text));
            if (user != null) MainFrame.Navigate(new ProductPage());
            else if (String.IsNullOrWhiteSpace(PasswordTxt.Text) && String.IsNullOrWhiteSpace(LogingTxt.Text)) MessageBox.Show("Логин или пароль не введены");
            else
            {
                MessageBox.Show("Неверные логин или пароль!!!");
                AutBtn.IsEnabled = false;
                await Task.Delay(TimeSpan.FromSeconds(5));
                AutBtn.IsEnabled = true;
            }
        }
    }
}
