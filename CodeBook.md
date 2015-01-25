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

- timeBodyAccelerationX                    
- timeBodyAccelerationY                    
- timeBodyAccelerationZ                    
- timeGravityAccelerationX
- timeGravityAccelerationY
- timeGravityAccelerationZ

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals.
- timeBodyAccelerationJerkX
- timeBodyAccelerationJerkY
- timeBodyAccelerationJerkZ
- timeBodyAngularVelocityX
- timeBodyAngularVelocityY
- timeBodyAngularVelocityZ
- timeBodyAngularVelocityJerkX
- timeBodyAngularVelocityJerkY
- timeBodyAngularVelocityJerkZ

The magnitude of the previous three-dimensional signals was calculated using the Euclidean norm.
- timeBodyAccelerationMagnitude
- timeGravityAccelerationMagnitude
- timeBodyAccelerationJerkMagnitude
- timeBodyAngularVelocityMagnitude
- timeBodyAngularVelocityJerkMagnitude

Frequency domain signals (frequency) were produced by applying a Fast Fourier Transform (FFT) to some of the previous time signals.
- frequencyBodyAccelerationX
- frequencyBodyAccelerationY
- frequencyBodyAccelerationZ
- frequencyBodyAccelerationJerkX
- frequencyBodyAccelerationJerkY
- frequencyBodyAccelerationJerkZ
- frequencyBodyAngularVelocityX
- frequencyBodyAngularVelocityY
- frequencyBodyAngularVelocityZ
- frequencyBodyAccelerationMagnitude
- frequencyBodyAccelerationJerkMagnitude
- frequencyBodyAngularVelocityMagnitude
- frequencyBodyAngularVelocityJerkMagnitude

##### avgmean
This column represents the average of the estimated mean for the above signal for each subject and activity.

##### avgstd
This column represents the average of the estimated standard deviation for the above signal for each subject and activity.