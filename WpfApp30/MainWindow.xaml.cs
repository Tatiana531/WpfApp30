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
using System.Data;
using System.Data.SqlClient;
using System.ComponentModel;
using System.Runtime.Remoting.Messaging;

namespace WpfApp30
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public int pageNumber = 1;
        string tt = null;
        
        public static int end;
        static public SqlCommand com = new SqlCommand();
        static public SqlConnection con = new SqlConnection(@"Data Source = JO7; Initial Catalog = ABDTHREE; Integrated Security= true");
        SqlDataReader reader;
      
        public MainWindow()
        {
      
            InitializeComponent();
            com.Connection = con;

            con.Open();
            SqlCommand j = new SqlCommand($"select MAX(ID) From Product", con);

            end = (int)j.ExecuteScalar();
            SqlCommand tcom = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber}'", con);
            SqlDataReader treader;
            treader = tcom.ExecuteReader();
            while (treader.Read())
            {
                tt += treader["Title"] + ", ";
            }
            treader.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber}'";
            SqlCommand com1 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader;
            sreader = com1.ExecuteReader();
            while (sreader.Read())
            {
                object stoimo = sreader["stoimost"];
                stoim.Content = stoimo;
            }
            sreader.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    FirstType.Text = Convert.ToString(ProductType)+" | "+Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    FirstArticle.Text ="Артикул: "+ Convert.ToString(Article);
                    Object Material = reader["Title"];
                    FirstMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();
            
            SqlCommand tcom1 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber+1}'", con);
            SqlDataReader treader1;
            treader1 = tcom.ExecuteReader();
            while (treader1.Read())
            {
                tt += treader1["Title"] + ", ";
            }
            treader1.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber+1}'";
            SqlCommand com11 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber+1}' group by ProductMaterial.ProductID", con);
           
            sreader = com11.ExecuteReader();
            while (sreader.Read())
            {
                object stoimo = sreader["stoimost"];
                stoim1.Content = stoimo;
            }
            sreader.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    SecondType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    SecondArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    SecondMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom2 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber+2}'", con);
            SqlDataReader treader2;
            treader2 = tcom.ExecuteReader();
            while (treader2.Read())
            {
                tt += treader2["Title"] + ", ";
            }
            treader2.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber+2}'";
            SqlCommand com12 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber+2}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader2;
            sreader2 = com12.ExecuteReader();
            while (sreader2.Read())
            {
                object stoimo = sreader2["stoimost"];
                stoim2.Content = stoimo;
            }
            sreader2.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    ThirdType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    ThirdArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    ThirdMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom3 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber+3}'", con);
            SqlDataReader treader3;
            treader3 = tcom3.ExecuteReader();
            while (treader3.Read())
            {
                tt += treader3["Title"] + ", ";
            }
            treader3.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber+3}'";
            SqlCommand com13 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber+3}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader3;
            sreader3 = com13.ExecuteReader();
            while (sreader3.Read())
            {
                object stoimo = sreader3["stoimost"];
                stoim3.Content = stoimo;
            }
            sreader3.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    FourType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    FourArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    FourMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();
            pageNumber += 4;
           

            if (pageNumber == end)
                NextBtn.IsEnabled = false;
            if (pageNumber == 1)
                BackBtn.IsEnabled = false;
            else
                BackBtn.IsEnabled = true;

            con.Close();
            pageNumber += 3;

        }

        //Сортировка
        private void SearchMethod_ExecutedSuccessfully(string sortBy, ListSortDirection direction)
        {
            ICollectionView dataView = CollectionViewSource.GetDefaultView(Sort.ItemsSource);

            if (dataView != null)
            {
                dataView.SortDescriptions.Clear();
                SortDescription sd = new SortDescription(sortBy, direction);
                dataView.SortDescriptions.Add(sd);
                dataView.Refresh();
            }

        }
        private void Sort_SelectionChanged (object sender, RoutedEventArgs e)
        {

            //var Result = _ProductList;

            //switch (SortType)
            //{
            //    // сортировка по названию продукции
            //    case 1:
            //        Result = Result.OrderBy(p => p.Title);
            //        break;
            //    case 2:
            //        Result = Result.OrderByDescending(p => p.Title);
            //        break;
            //}
            //string sort = null;
            //switch (sort)
            //{
                 if (Sort.Text == "По наименованию, от А до Я")
            {
                //case  "По наименованию, от А до Я":
                //    {
                SearchMethod_ExecutedSuccessfully("Title", ListSortDirection.Ascending);
                this.Refresh();
                //break;


            }else
            if (Sort.Text == "По наименованию, от Я до А")
            {
                //case "По наименованию, от Я до А":
                //    {
                SearchMethod_ExecutedSuccessfully("Title", ListSortDirection.Descending);
                this.Refresh();
                //break;
            }

            //        SearchMethod_ExecutedSuccessfully("Title", ListSortDirection.Descending);
            //        break;
            //}
            ////case "По возрастанию номера производственного цеха":
            ////    {
            ////        SearchMethod_ExecutedSuccessfully("ProductionWorkshopNumber", ListSortDirection.Ascending);
            ////        break;
            ////    }
            ////case "По убыванию номера производственного цеха":
            ////    {
            ////        SearchMethod_ExecutedSuccessfully("ProductionWorkshopNumber", ListSortDirection.Descending);
            ////        break;
            ////    }
            //case "По возрастанию минимальной стоимости для агента":
            //    {
            //        //SearchMethod_ExecutedSuccessfully("stoimost", ListSortDirection.Ascending);
            //        break;
            //    }
            //case "По убыванию минимальной стоимости для агента":
            //    {
            //        //SearchMethod_ExecutedSuccessfully("stoimost", ListSortDirection.Descending);
            //        break;
            //    }

            //default:
            //        break;
            }

        private void Refresh()
        {
            throw new NotImplementedException();
        }

        //}




        private void NextBtn_Click(object sender, RoutedEventArgs e)
        {
            con.Open();
            SqlCommand tcom = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber}'", con);
            SqlDataReader treader;
            treader = tcom.ExecuteReader();
            while (treader.Read())
            {
                tt += treader["Title"] + ", ";
            }
            treader.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber}'";
            SqlCommand com1 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader;
            sreader = com1.ExecuteReader();
            while (sreader.Read())
            {
                object stoimo = sreader["stoimost"];
                stoim.Content = stoimo;
            }
            sreader.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    FirstType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    FirstArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    FirstMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom1 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber + 1}'", con);
            SqlDataReader treader1;
            treader1 = tcom.ExecuteReader();
            string tt1 = null;
            while (treader1.Read())
            {
                tt1 += treader1["Title"] + ", ";
            }
            treader1.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber + 1}'";
            SqlCommand com11 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber + 1}' group by ProductMaterial.ProductID", con);

            sreader = com11.ExecuteReader();
            while (sreader.Read())
            {
                object stoimo = sreader["stoimost"];
                stoim1.Content = stoimo;
            }
            sreader.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    SecondType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    SecondArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    SecondMaterial.Text = Convert.ToString(tt1);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom2 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber + 2}'", con);
            SqlDataReader treader2;
            treader2 = tcom.ExecuteReader();
            string tt2 = null;
            while (treader2.Read())
            {
                tt2 += treader2["Title"] + ", ";
            }
            treader2.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber + 2}'";
            SqlCommand com12 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber + 2}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader2;
            sreader2 = com12.ExecuteReader();
            while (sreader2.Read())
            {
                object stoimo = sreader2["stoimost"];
                stoim2.Content = stoimo;
            }
            sreader2.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    ThirdType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    ThirdArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    ThirdMaterial.Text = Convert.ToString(tt2);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom3 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber + 3}'", con);
            SqlDataReader treader3;
            treader3 = tcom3.ExecuteReader();
            string tt3 = null;
            while (treader3.Read())
            {
                tt3 += treader3["Title"] + ", ";
            }
            treader3.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber + 3}'";
            SqlCommand com13 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber + 3}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader3;
            sreader3 = com13.ExecuteReader();
            while (sreader3.Read())
            {
                object stoimo = sreader3["stoimost"];
                stoim3.Content = stoimo;
            }
            sreader3.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    FourType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    FourArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    FourMaterial.Text = Convert.ToString(tt3);
                }
            }
            if (pageNumber == end)
                NextBtn.IsEnabled = false;
            if (pageNumber == 1)
                BackBtn.IsEnabled = false;
            else
                BackBtn.IsEnabled = true;
            con.Close();
            con.Open();
            con.Close();
            pageNumber += 4;
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            con.Open();
            SqlCommand tcom = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber}'", con);
            SqlDataReader treader;
            treader = tcom.ExecuteReader();
            while (treader.Read())
            {
                tt += treader["Title"] + ", ";
            }
            treader.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber}'";
            SqlCommand com1 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader;
            sreader = com1.ExecuteReader();
            while (sreader.Read())
            {
                object stoimo = sreader["stoimost"];
                stoim.Content = stoimo;
            }
            sreader.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    FirstType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    FirstArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    FirstMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom1 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber + 1}'", con);
            SqlDataReader treader1;
            treader1 = tcom.ExecuteReader();
            while (treader1.Read())
            {
                tt += treader1["Title"] + ", ";
            }
            treader1.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber + 1}'";
            SqlCommand com11 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber + 1}' group by ProductMaterial.ProductID", con);

            sreader = com11.ExecuteReader();
            while (sreader.Read())
            {
                object stoimo = sreader["stoimost"];
                stoim1.Content = stoimo;
            }
            sreader.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    SecondType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    SecondArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    SecondMaterial.Text = Convert.ToString(tt);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom2 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber + 2}'", con);
            SqlDataReader treader2;
            treader2 = tcom.ExecuteReader();
            string tt2 = null;
            while (treader2.Read())
            {
                tt2 += treader2["Title"] + ", ";
            }
            treader2.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber + 2}'";
            SqlCommand com12 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber + 2}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader2;
            sreader2 = com12.ExecuteReader();
            while (sreader2.Read())
            {
                object stoimo = sreader2["stoimost"];
                stoim2.Content = stoimo;
            }
            sreader2.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    ThirdType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    ThirdArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    ThirdMaterial.Text = Convert.ToString(tt2);
                }
            }
            con.Close();
            con.Open();

            SqlCommand tcom3 = new SqlCommand($"Select Title from Material,ProductMaterial where ID=ProductMaterial.MaterialID and ProductMaterial.ProductID='{pageNumber + 3}'", con);
            SqlDataReader treader3;
            treader3 = tcom3.ExecuteReader();
            string tt3 = null;
            while (treader3.Read())
            {
                tt3 += treader3["Title"] + ", ";
            }
            treader3.Close();
            com.CommandText = $"Select Title, ArticleNumber, ID,ProductTypeID,(Select Title from ProductType Where ID=ProductTypeID) as ProductType from Product Where ID='{pageNumber + 3}'";
            SqlCommand com13 = new SqlCommand($"SELECT ProductMaterial.ProductID, SUM(Material.Cost * ProductMaterial.Count) AS Stoimost FROM Product, Material, ProductMaterial WHERE ProductMaterial.ProductID = Product.ID AND Material.ID = ProductMaterial.MaterialID AND Product.ID='{pageNumber + 3}' group by ProductMaterial.ProductID", con);
            SqlDataReader sreader3;
            sreader3 = com13.ExecuteReader();
            while (sreader3.Read())
            {
                object stoimo = sreader3["stoimost"];
                stoim3.Content = stoimo;
            }
            sreader3.Close();
            reader = com.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Object Product = reader["Title"];
                    Object ProductType = reader["ProductType"];
                    FourType.Text = Convert.ToString(ProductType) + " | " + Convert.ToString(Product);
                    Object Article = reader["ArticleNumber"];
                    FourArticle.Text = "Артикул: " + Convert.ToString(Article);
                    Object Material = reader["Title"];
                    FourMaterial.Text = Convert.ToString(tt3);
                }
            }
            con.Close();
            if (pageNumber == end)
                NextBtn.IsEnabled = false;
            if (pageNumber == 1)
                BackBtn.IsEnabled = false;
            else
                BackBtn.IsEnabled = true;
            pageNumber -= 4;
        }

        private void Sort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SqlCommand comm=new SqlCommand();
            comm.Connection = con;
            ComboBox combox = (ComboBox)sender;
            ComboBoxItem selecteditem = (ComboBoxItem)combox.SelectedItem;
            string si = selecteditem.Content.ToString();
            
                
            
        }
    }
    }