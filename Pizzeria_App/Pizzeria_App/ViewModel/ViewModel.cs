using Pizzeria_App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Pizzeria_App.ViewModel
{
    public class ViewModel
    {
        public Lavruhin_ExamContext DbContext = new Lavruhin_ExamContext();
        public List<Client> clients = new List<Client>();
        public List<Order> orders = new List<Order>();
        public List<Position> positions = new List<Position>();
        public List<Pizza> pizzas = new List<Pizza>();

        public Position position = new Position();
        public int price = 0;

        public async Task InitializeAsync()
        {
            clients = DbContext.Clients.ToList();
            orders = DbContext.Orders.ToList();
            positions = DbContext.Positions.ToList();
            pizzas = DbContext.Pizzas.ToList();
        }

        public double CalculateDiscount(int id)
        {
            // находим стоимость заказа, выбрав нужную строку в ассортименте
            position = positions.FirstOrDefault(p => p.PositionId == id);
            if (position.Price > 2000) return (double)position.Price * 0.95;
            else if (position.Price > 4000) return (double)position.Price * 0.93;
            else return (double)position.Price;
        }
        
        public string GetPizzaName(int id)
        {
            // находим в ассортименте заказанную позицию
            position = positions.FirstOrDefault(p => p.PositionId == id);
            var pizza = pizzas.FirstOrDefault(p => p.PizzaId == position.PizzaId);
            // возвращаем наименование выбранной пиццы
            return pizza.PizzaName;
        }
    }
}
