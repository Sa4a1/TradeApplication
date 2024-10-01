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
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage(User user)
        {
            InitializeComponent();
            var currentProduct = IskhakovTradeEntities.GetContext().Product.ToList();
            ProductListView.ItemsSource = currentProduct;
            CostSortBox.SelectedIndex = 0;
            FilterBox.SelectedIndex = 0;
            if (user == null)
            {

            }
            ;
        }

        private void UpdatePage()
        {
            var currentProduct = IskhakovTradeEntities.GetContext().Product.ToList();
            if (CostSortBox.SelectedIndex == 1) currentProduct = currentProduct.OrderBy(p => p.ProductCost).ToList();
            if (CostSortBox.SelectedIndex == 2) currentProduct = currentProduct.OrderByDescending(p => p.ProductCost).ToList();
            if (FilterBox.SelectedIndex == 1) currentProduct = currentProduct.Where(p => (p.ProductDiscountAmount <= 9.9)).ToList();
            if (FilterBox.SelectedIndex == 2)currentProduct = currentProduct.Where(p => (p.ProductDiscountAmount <= 14.99 && p.ProductDiscountAmount >= 10)).ToList();
            if (FilterBox.SelectedIndex == 3) currentProduct = currentProduct.Where(p => p.ProductDiscountAmount >= 15).ToList();

            currentProduct = currentProduct.Where(p => p.ProductName.ToLower().Contains(SearchTxt.Text.ToLower())).ToList();

            ProductListView.ItemsSource = currentProduct;
        }

        private void SearchTxt_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdatePage();
        }

        private void CostSortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdatePage();
        }

        private void FilterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdatePage();
        }
    }
}
