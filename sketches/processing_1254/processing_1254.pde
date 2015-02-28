
void setup()
{
  size(400,400);
  background(0);
  colorMode(RGB, 255);
  stroke(255,255,255);  
  noLoop();
}

void draw()
{
  int padding = 10;
  int numBins = width - (2 * padding);
  int numSamples = 1000000; 
  float numDeviations = 3.0f;
  line( width/2, padding, width/2, height-padding );
  line( padding, height-padding, width-padding, height-padding);
  
  float[] values = new float[numSamples];
  int[] counts = new int[numSamples];
  int bin;
  
  float x, y;
  
  for(int i = 0; i < numSamples; i++)
  {
    values[i] = randomNormal();
    bin = int(map(values[i],-numDeviations, numDeviations, 0, numBins));// try to fit 3 standard deviations into the bins
    // squash the tails of the distribution into the first and last buckets, respectively.
    if(bin < 0)
      bin = 0;
    if(bin >= numBins)
      bin = numBins-1;
    counts[bin]++;
  }
  
  // draw the results
  stroke(255,255,255);
  float k = gauss(0,1) / ((float)counts[int(numBins / 2)] / numSamples); // figure out what value scales the counts up to the same level as the reference curve.
  for(int i = 0; i < numBins; i++)
  {
    x = map(i, 0, numBins, padding, width-padding);
    y = map(k * (float)counts[i] / numSamples, 0, 1, height-padding, padding);
    point(x,y);
  }
  
  // draw a reference gaussian.
  stroke(0,255,0);
  for(int h = 0; h < width-2*padding; h++) {
    y = (height-padding) - (height-(2*padding)) * gauss(map(h, 0, width-2*padding, -numDeviations, numDeviations), 1.0f);
    point(h + padding, y);
  }
  // and reference 1 standard deviation lines:
  x = map(1, -numDeviations, numDeviations, padding, width-padding);
  line(x, padding, x, height-padding);
  x = map(-1, -numDeviations, numDeviations, padding, width-padding);
  line(x, padding, x, height-padding);

  // calculate std. deviation in the actual data and draw those lines.
  float phi = stddev(values, numSamples);
  stroke(255,128,128);
  x = map(phi, -numDeviations, numDeviations, padding, width-padding);
  line(x, padding, x, height-padding);
  x = map(-phi, -numDeviations, numDeviations, padding, width-padding);
  line(x, padding, x, height-padding);
  
  println("std dev is " + nf(phi, 1, 4));
  
  int countUnderOne = 0, countUnderTwo = 0, countUnderThree = 0;
  for(int i = 0; i < numSamples; i++)
  {
    if(abs(values[i]) < phi)
      countUnderOne++;
    if(abs(values[i]) < phi*2.0f)
      countUnderTwo++;
    if(abs(values[i]) < phi*3.0f)
      countUnderThree++;
  }
  println("Samples within 1 * phi: " + nf((float)countUnderOne / numSamples, 1, 4));
  println("Samples within 2 * phi: " + nf((float)countUnderTwo / numSamples, 1, 4));
  println("Samples within 3 * phi: " + nf((float)countUnderThree / numSamples, 1, 4));  
}

// calculate the gaussian probability of v given a distribution with mean of zero and standard deviation of phi.
// gauss(v) = exp(-v^2 / (2 * phi^2) ) / (phi*sqrt(2PI))
float SQRT2PI = sqrt(2*PI); // an efficiency constant.
float gauss(float v, float phi)
{
  return exp(-v*v / (2*phi*phi) ) / (phi*SQRT2PI);
}

// Given an array of values, calculate the standard deviation of them.
float stddev(float[] values, int len)
{
  // Calculate the mean value
  float sum = 0.0f, mean = 0.0f;
  for(int i = 0; i < len; i++)
    sum += values[i];
  mean = sum / len;
println("mean is " + nf(mean, 1, 4));  
  // find the sum of the squared deviations from the mean
  float sum2 = 0.0f;
  for(int i = 0; i < len; i++)
    sum2 += pow(values[i] - mean,2);

  // the standard deviation is the sqare root of the average of the squared deviations.
  return sqrt(sum2 / len);
}

// return a random value in the range [0..1] with normal distribution around 0.
// Implements the Marsaglia Polar Method, as described in wikipedia, but only returns one of the values.
float randomNormal()
{
  float x = 1.0, y = 1.0, 
        s = 2.0; // s = x^2 + y^2
  while(s >= 1.0)
  {
    x = random(-1.0f, 1.0f);
    y = random(-1.0f, 1.0f);
    s = x*x + y*y;
  }
  return x * sqrt(-2.0f * log(s)/s);
}


