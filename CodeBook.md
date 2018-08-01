Code Book
===
This code book describes the variables, data and any transformations or work
that was performed to clean up the data.

Data
---
The resulting data was stored in the text file 'tidy_data.txt' in this
repository.

Variables
---
There are 180 observations of 81 variables.
The first row of 'tidy_data.txt' are just the column names.

### Identifiers

* 'Subject' - The ID of the test subject.

    ID's range between 1 and 30.
    
* 'Activity' - The corresponding activity undertaken for each measurement.

    There are 6 possible activities:
    * 'WALKING' (1)
    * 'WALKING_UPSTAIRS' (2)
    * 'WALKING_DOWNSTAIRS' (3)
    * 'SITTING' (4)
    * 'STANDING' (5)
    * 'LAYING' (6)
    each explicitly discribing the activity undertaken.
    
### Measurements

All remaining observations are averages for each of the [original measurements](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) taken for each subject in each activity.

* X,Y and Z denote the directions of each variable.
* Measurements range between [-1,1]

### Column names

#### Time Domain measurements

- `timeDomainBodyAccelerometerMeanX`
- `timeDomainBodyAccelerometerMeanY`
- `timeDomainBodyAccelerometerMeanZ`

- `timeDomainBodyAccelerometerStandardDeviationX`
- `timeDomainBodyAccelerometerStandardDeviationY`
- `timeDomainBodyAccelerometerStandardDeviationZ`

- `timeDomainGravityAccelerometerMeanX`
- `timeDomainGravityAccelerometerMeanY`
- `timeDomainGravityAccelerometerMeanZ`

- `timeDomainGravityAccelerometerStandardDeviationX`
- `timeDomainGravityAccelerometerStandardDeviationY`
- `timeDomainGravityAccelerometerStandardDeviationZ`

- `timeDomainBodyAccelerometerJerkMeanX`
- `timeDomainBodyAccelerometerJerkMeanY`
- `timeDomainBodyAccelerometerJerkMeanZ`

- `timeDomainBodyAccelerometerJerkStandardDeviationX`
- `timeDomainBodyAccelerometerJerkStandardDeviationY`
- `timeDomainBodyAccelerometerJerkStandardDeviationZ`

- `timeDomainBodyGyroscopeMeanX`
- `timeDomainBodyGyroscopeMeanY`
- `timeDomainBodyGyroscopeMeanZ`

- `timeDomainBodyGyroscopeStandardDeviationX`
- `timeDomainBodyGyroscopeStandardDeviationY`
- `timeDomainBodyGyroscopeStandardDeviationZ`

- `timeDomainBodyGyroscopeJerkMeanX`
- `timeDomainBodyGyroscopeJerkMeanY`
- `timeDomainBodyGyroscopeJerkMeanZ`

- `timeDomainBodyGyroscopeJerkStandardDeviationX`
- `timeDomainBodyGyroscopeJerkStandardDeviationY`
- `timeDomainBodyGyroscopeJerkStandardDeviationZ`

- `timeDomainBodyAccelerometerMagnitudeMean`
- `timeDomainBodyAccelerometerMagnitudeStandardDeviation`

- `timeDomainGravityAccelerometerMagnitudeMean`
- `timeDomainGravityAccelerometerMagnitudeStandardDeviation`

- `timeDomainBodyAccelerometerJerkMagnitudeMean`
- `timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation`

- `timeDomainBodyGyroscopeMagnitudeMean`
- `timeDomainBodyGyroscopeMagnitudeStandardDeviation`

- `timeDomainBodyGyroscopeJerkMagnitudeMean`
- `timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation`

#### Frequency measurements

- `frequencyDomainBodyAccelerometerMeanX`
- `frequencyDomainBodyAccelerometerMeanY`
- `frequencyDomainBodyAccelerometerMeanZ`

- `frequencyDomainBodyAccelerometerStandardDeviationX`
- `frequencyDomainBodyAccelerometerStandardDeviationY`
- `frequencyDomainBodyAccelerometerStandardDeviationZ`

- `frequencyDomainBodyAccelerometerMeanFrequencyX`
- `frequencyDomainBodyAccelerometerMeanFrequencyY`
- `frequencyDomainBodyAccelerometerMeanFrequencyZ`

- `frequencyDomainBodyAccelerometerJerkMeanX`
- `frequencyDomainBodyAccelerometerJerkMeanY`
- `frequencyDomainBodyAccelerometerJerkMeanZ`

- `frequencyDomainBodyAccelerometerJerkStandardDeviationX`
- `frequencyDomainBodyAccelerometerJerkStandardDeviationY`
- `frequencyDomainBodyAccelerometerJerkStandardDeviationZ`

- `frequencyDomainBodyAccelerometerJerkMeanFrequencyX`
- `frequencyDomainBodyAccelerometerJerkMeanFrequencyY`
- `frequencyDomainBodyAccelerometerJerkMeanFrequencyZ`

- `frequencyDomainBodyGyroscopeMeanX`
- `frequencyDomainBodyGyroscopeMeanY`
- `frequencyDomainBodyGyroscopeMeanZ`

- `frequencyDomainBodyGyroscopeStandardDeviationX`
- `frequencyDomainBodyGyroscopeStandardDeviationY`
- `frequencyDomainBodyGyroscopeStandardDeviationZ`
	
- `frequencyDomainBodyGyroscopeMeanFrequencyX`
- `frequencyDomainBodyGyroscopeMeanFrequencyY`
- `frequencyDomainBodyGyroscopeMeanFrequencyZ`

- `frequencyDomainBodyAccelerometerMagnitudeMean`
- `frequencyDomainBodyAccelerometerMagnitudeStandardDeviation`
- `frequencyDomainBodyAccelerometerMagnitudeMeanFrequency`

- `frequencyDomainBodyAccelerometerJerkMagnitudeMean`
- `frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation`
- `frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency`

- `frequencyDomainBodyGyroscopeMagnitudeMean`
- `frequencyDomainBodyGyroscopeMagnitudeStandardDeviation`
- `frequencyDomainBodyGyroscopeMagnitudeMeanFrequency`
	
- `frequencyDomainBodyGyroscopeJerkMagnitudeMean`
- `frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation`
- `frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency`

## Transformations

All the following transformations were implemented by the R script 'run_analysis.R'

1. The training and test datasets were merged into a single dataset.
2. Measurements on mean and standard deviation were extracted into a new dataset.
3. Ativity identifiers were replaced with factor variables describing the activity. (see Identifiers for factors and (original integers))
4. Column names were replaced with more desciptive titels.
5. The final tidy data set was created from the resulting set, containing the averages allocated to each subject and activity.
6. This set was saved as tidy_data.txt.