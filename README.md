![Image text](https://travelfoot.com/wp-content/uploads/2020/09/airbnb-amsterdam.jpg)

# Kaggle competition

### The objective of this competition is to determine a model that can predict the price of each AirBnB apartment in Amsterdam.

### Data
train.csv

### Processing/cleaning the dataset: this should be later modularized in functions.

Train a model (fit & predict) with the data in train.csv. This file does contain a y.

Do train, test, split on train.csv if necessary.

Choose the best model regarding the metrics. In this case, the lowest RMSE (error).
2.1 Export the model: we don't want to invest time/RAM resources on training the model again in the future.

test.csv
Apply the same cleaning to test.csv. This files does NOT contain a y.
We'll apply the already trained model from step 2 to the text.csv file. With this we'lñl generate a new column with the predicted values.
my_submission.csv

Generated a files with only two columns: the ID of the apartment & the predicted price (y).

## Deliverables
Jupyter notebooks where I show the process followed to get to submissions.

### Resources:
#### Python - Pandas - H20
