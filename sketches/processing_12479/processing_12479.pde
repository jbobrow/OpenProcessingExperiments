
class Distribution {
  
  float[] numbers;
  float mean_error;
  float sd_error;
  
  Distribution(float target_mean, float target_std, int samples, float num_tests) {
    //generate the number of samples
    boolean good_enough = false;
    float[] test_sample = new float[samples];
    float[] best_sample = new float[samples];
    float best_error=99999;
    float best_sd=99999;
    
    int j=0;
    while (good_enough == false) {
      test_sample = new float[samples];
      for (int i = 0;i < samples; i=i+2) {
        Gaussian num = new Gaussian(target_mean, target_std);
        test_sample[i] = num.y1;
        if (i+1 < samples) test_sample[i+1] = num.y2;
      }
      float obtained_mean = mean(test_sample);
      float obtained_std = stddev(test_sample);
      mean_error = abs(obtained_mean - target_mean);
      sd_error = abs(obtained_std - target_std);
      float test_error = mean_error+sd_error;
      if (sd_error < best_sd) {
        println("improvement! " + j + " sd_error: " + sd_error );
        for (int k=0;k<test_sample.length;k++) {
          best_sample[k] = test_sample[k];
        }
        best_error = test_error;
        best_sd = sd_error;
      }
      j++;
      if (j > num_tests) good_enough = true;
    }
    float obtained_mean = mean(best_sample);
    float obtained_std = stddev(best_sample);
    mean_error = obtained_mean - target_mean;
    sd_error = abs(obtained_std - target_std);
    
    println("best of " + j + " tests! length: " + best_sample.length + " mean_error: " + mean_error + "  sd_error: " + sd_error);
    //now correct the mean error by subtracting the mean_error from every number in the distribution
    for (int k=0;k<test_sample.length;k++) {
      best_sample[k] = best_sample[k] - mean_error;
    }
    obtained_mean = mean(best_sample);
    obtained_std = stddev(best_sample);
    mean_error = obtained_mean - target_mean;
    sd_error = abs(obtained_std - target_std);
    
    println("best of " + j + " tests! length: " + best_sample.length + " mean_error: " + mean_error + "  sd_error: " + sd_error);
    
    numbers = best_sample;
  }
  
  float mean(float[] values)
  {
    float sum = 0.0f, mean = 0.0f;
    for(int i = 0; i < values.length; i++)
      sum += values[i];

    mean = sum / values.length;
    return mean;
  }
  
  float stddev(float[] values)
  {
    // Calculate the mean value
    float sum = 0.0f, mean = 0.0f;
    for(int i = 0; i < values.length; i++)
      sum += values[i];

    mean = sum / values.length;
    //println("mean is " + nf(mean, 1, 4)); 
    // find the sum of the squared deviations from the mean
    float sum2 = 0.0f;
    for(int i = 0; i < values.length; i++)
      sum2 += pow(values[i] - mean,2);
 
      // the standard deviation is the sqare root of the average of the squared deviations.
    return sqrt(sum2 / values.length);
  }

}

