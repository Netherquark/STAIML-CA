import pandas as pd

df_appliances = pd.read_csv('appliances_energy_prediction.csv')
print(df_appliances.describe())