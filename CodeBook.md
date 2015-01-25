#Code Book
##### subject
The experiments were out with a group of 30 people, age 19-48. Each is represented in this column by a number from 1 to 30.

##### activity
This column represents the activities that the subjects performed while wearing a smartphone (Samsung Galaxy S II) on the waist.
- WALKING
- WALKING_UPSTAIRS   
- WALKING_DOWNSTAIRS SITTING            
- STANDING          
- LAYING

##### feature
3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz, using the embedded accelerometer and gyroscope of the Samsung Galaxy S II worn by each subject while performing the different activities. The following features were derived from this raw information.

Time domain signals (prefixed with time) were captured at a constant rate of 50 Hz and then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was separated into body and gravity acceleration signals (BodyAcceleration, GravityAcceleration) using low pass Butterworth filter with a corner frequency of 0.3 Hz. XYZ represent the direction of the signal. 
For each signal, the mean and standard deviation were estimated for each activity and subject.

- timeBodyAccelerationMeanX                                 
- timeBodyAccelerationMeanY                                 
- timeBodyAccelerationMeanZ                                 
- timeBodyAccelerationStandardDeviationX                    
- timeBodyAccelerationStandardDeviationY                    
- timeBodyAccelerationStandardDeviationZ                    
- timeGravityAccelerationMeanX                              
- timeGravityAccelerationMeanY                              
- timeGravityAccelerationMeanZ
- timeGravityAccelerationStandardDeviationX
- timeGravityAccelerationStandardDeviationY
- timeGravityAccelerationStandardDeviationZ

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
- timeBodyAccelerationJerkMeanX
- timeBodyAccelerationJerkMeanY
- timeBodyAccelerationJerkMeanZ
- timeBodyAccelerationJerkStandardDeviationX
- timeBodyAccelerationJerkStandardDeviationY
- timeBodyAccelerationJerkStandardDeviationZ
- timeBodyAngularVelocityMeanX
- timeBodyAngularVelocityMeanY
- timeBodyAngularVelocityMeanZ
- timeBodyAngularVelocityStandardDeviationX
- timeBodyAngularVelocityStandardDeviationY
- timeBodyAngularVelocityStandardDeviationZ
- timeBodyAngularVelocityJerkMeanX
- timeBodyAngularVelocityJerkMeanY
- timeBodyAngularVelocityJerkMeanZ
- timeBodyAngularVelocityJerkStandardDeviationX
- timeBodyAngularVelocityJerkStandardDeviationY
- timeBodyAngularVelocityJerkStandardDeviationZ

The magnitude of the previous three-dimensional signals was calculated using the Euclidean norm.
- timeBodyAccelerationMagnitudeMean
- timeBodyAccelerationMagnitudeStandardDeviation
- timeGravityAccelerationMagnitudeMean
- timeGravityAccelerationMagnitudeStandardDeviation
- timeBodyAccelerationJerkMagnitudeMean
- timeBodyAccelerationJerkMagnitudeStandardDeviation
- timeBodyAngularVelocityMagnitudeMean
- timeBodyAngularVelocityMagnitudeStandardDeviation
- timeBodyAngularVelocityJerkMagnitudeMean
- timeBodyAngularVelocityJerkMagnitudeStandardDeviation

Frequency domain signals (frequency) were produced by applying a Fast Fourier Transform (FFT) to some of the previous time signals.
- frequencyBodyAccelerationMeanX
- frequencyBodyAccelerationMeanY
- frequencyBodyAccelerationMeanZ
- frequencyBodyAccelerationStandardDeviationX
- frequencyBodyAccelerationStandardDeviationY
- frequencyBodyAccelerationStandardDeviationZ
- frequencyBodyAccelerationJerkMeanX
- frequencyBodyAccelerationJerkMeanY
- frequencyBodyAccelerationJerkMeanZ
- frequencyBodyAccelerationJerkStandardDeviationX
- frequencyBodyAccelerationJerkStandardDeviationY
- frequencyBodyAccelerationJerkStandardDeviationZ
- frequencyBodyAngularVelocityMeanX
- frequencyBodyAngularVelocityMeanY
- frequencyBodyAngularVelocityMeanZ
- frequencyBodyAngularVelocityStandardDeviationX
- frequencyBodyAngularVelocityStandardDeviationY
- frequencyBodyAngularVelocityStandardDeviationZ
- frequencyBodyAccelerationMagnitudeMean
- frequencyBodyAccelerationMagnitudeStandardDeviation
- frequencyBodyAccelerationJerkMagnitudeMean
- frequencyBodyAccelerationJerkMagnitudeStandardDeviation
- frequencyBodyAngularVelocityMagnitudeMean
- frequencyBodyAngularVelocityMagnitudeStandardDeviation
- frequencyBodyAngularVelocityJerkMagnitudeMean
- frequencyBodyAngularVelocityJerkMagnitudeStandardDeviation

##### mean
This column represents the mean of the above signal for each subject and activity.
