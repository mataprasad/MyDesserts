namespace MyDesserts.Data
{
    using Dapper;
    using System.Data;
    using System.Data.SqlClient;

    public class DbContext
    {
        private string _connectionString;
        public DbContext(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("Db");
        }

        private IDbConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }


        public List<DessertCategory> GetDessertCategories()
        {
            using (var db = GetConnection())
            {
                return db.Query<DessertCategory>("SELECT * FROM DessertCategory;").ToList();
            }
        }

        public List<Dessert> GetDessertByCategory(long categoryId)
        {
            using (var db = GetConnection())
            {
                return db.Query<Dessert>("SELECT * FROM Dessert WHERE Category = @P1 ;", new { P1 = categoryId }).ToList();
            }
        }
    }
}
