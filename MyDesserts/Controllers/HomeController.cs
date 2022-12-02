using Microsoft.AspNetCore.Mvc;
using MyDesserts.Data;
using MyDesserts.Models;
using System.Data.Common;
using System.Diagnostics;

namespace MyDesserts.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly DbContext dbContext;

        public HomeController(ILogger<HomeController> logger, DbContext dbContext)
        {
            _logger = logger;
            this.dbContext = dbContext;
        }

        public IActionResult Index()
        {
            var categoryList = dbContext.GetDessertCategories();
            return View(categoryList);
        }

        [HttpPost]
        public IActionResult Desserts([FromForm(Name = "DessertCategory")] long catId)
        {
            var categoryList = dbContext.GetDessertByCategory(catId);
            return View(categoryList);
        }
    }
}