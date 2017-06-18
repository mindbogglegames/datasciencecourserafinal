# Introduction

The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* First, all data is loaded and merged. 
* All columns are given descriptive names.
* The columns with the mean and standard deviation measures are taken from the whole dataset. 
* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and add corresponding labels to 
* Finally, we generate a new dataset with all means for each subject and activity type. The output file is called `tidy_data.txt`, and uploaded to this repository.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
* `x_combined`, `y_combined` and `subject_combined` merge the previous datasets to further analysis.
* `all_combined` merges `x_data`, `y_data` and `subject_data` in a big dataset.
* final_tidy_data contains the means for each subject and activity type
* Finally, `averages_data` contains the relevant averages which will be later stored in a `.txt` file. 