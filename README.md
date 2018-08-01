# coursera-GaCD-project
### Getting-and-Cleaning-Data course project

Instructions for this project were to create a tidy dataset from an existing dataset with and R-script.

'run_analysis.R' is the R-script created and does the following:

1. It loads the reshape2 package which will be used later.
1. The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) is loaded if it does not already exist locally.
1. The data is unzipped if necessary.
1. Working directory is moved into the folder for efficiency.
1. Features are loaded and given more descriptive names.
1. Train datasets (X_train, Y_train and subject_train) are merged into a single set.
1. Test datasets (X_test, Y_test, subject_test) are merged into a single set.
1. Train and test sets are merged into a single set.
1. Appropriate labels are given to variable names.
1. Activity variables are replaced with more descriptive factor equivalents.
1. A dataset is created, storing the averages of each activity measurement for each subject.
1. The resulting data is then saved in a text file named 'tidy_data.txt' which can be found in [this repository](https://github.com/gerhardpbez/coursera-GaCD-project).

These steps are taken to meet the criteria of this project to produce the correct tidy data.
