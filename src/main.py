import pandas as pd
import numpy as np

def load_excel(excel_fd, csv_fd):

    df = pd.read_excel(excel_fd)
    df.to_csv(csv_fd, index=False)

    return np.genfromtxt(csv_fd, delimiter=',', skip_header=1)

print(load_excel("Dados_ML.xlsx","dados.csv"))
