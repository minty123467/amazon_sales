import pandas as pd
from sqlalchemy import create_engine
import seaborn as sns
import matplotlib.pyplot as plt

# Define the connection details
server = 'LAPTOP-81HDQ7QP'  # Your SQL Server
database = 'master'  # Your database name
schema = 'amazon_sales'

# Create a connection string
connection_string = (
    f'mssql+pyodbc://{server}/{database}?'
    f'driver=ODBC+Driver+18+for+SQL+Server;'
    f'Trusted_Connection=yes;'
)

# Create an engine
engine = create_engine(connection_string)

# Load data from DBT models
query_popular_products = 'SELECT * FROM agg_popular_products_mumbai'
query_sales_trend = 'SELECT * FROM agg_sales_trend_seasons'

df_popular_products = pd.read_sql(query_popular_products, engine)
df_sales_trend = pd.read_sql(query_sales_trend, engine)




# Bar Chart
plt.figure(figsize=(10, 6))
sns.barplot(data=df_popular_products, x='style', y='total_quantity', hue='category')
plt.title('Most Popular Product Styles and Categories in Mumbai')
plt.xlabel('Style')
plt.ylabel('Total Quantity')
plt.legend(title='Category')
plt.show()


# Line Chart
plt.figure(figsize=(10, 6))
sns.lineplot(data=df_sales_trend, x='quarter', y='total_sales', hue='year', marker='o')
plt.title('Sales Trend Over Different Seasons')
plt.xlabel('Quarter')
plt.ylabel('Total Sales')
plt.legend(title='Year')
plt.show()
