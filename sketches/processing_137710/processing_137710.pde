
/**
 * Brownian motion, also known as the Drunkard's Walk.
 * Records random movement as a continuous line. 
 * Press 'x' to switch between uniform and Gaussian random.
 * Press 'd' to output x and y increments ot console.
 * Press UP or DOWN arrow to change Gaussian variance.
 * Press 'h' for help. 
 */
 
int num = 2000;
int range = 16;

float[] ax = new float[num];
float[] ay = new float[num]; 

boolean isUsingGauss = true;
boolean isDebug = false;

float xinc;
float yinc;
// for gaussian calculations
float mean;
float variance;

public void setup() {
  size(640, 360);
  range = range < 3 ? 3 : range;
  initVars();
  mean = range/2.0f;
  variance = floor(mean);
  frameRate(30);
}

public void initVars() {
  for(int i = 0; i < num; i++) {
    ax[i] = width/2;
    ay[i] = height/2;
  }
}

public void help() {
  println("Press 'x' to switch between uniform and Gaussian random numbers.");
  println("Press 'd' to output x and y increments to console.");
  println("Press 'r' to reset path to center.");
  println("Press UP or DOWN arrow keys to change Gaussian variance.");
  println("Press 'h' to output this help message.");
}

public void draw() {
  background(51);
  
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }

  // Put a new value at the end of the array
  if (!isUsingGauss) {
    // do it the uniform random way
    xinc = random(-range, range);
    yinc = random(-range, range);
  }
  else {
    // do it the gaussian way
    /*
    // cluster around 0
    xinc = calcGauss(0, 2 * range);
    yinc = calcGauss(0, 2 * range);
    */
    // double cluster centered on mean and -mean
    xinc = random(1) > 0.5f ? calcGauss(mean, variance) : - calcGauss(mean, variance);
    yinc = random(1) > 0.5f ? calcGauss(mean, variance) : - calcGauss(mean, variance);
  }
  
  ax[num-1] += xinc;
  ay[num-1] += yinc;
  
  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  
  if (isDebug) {
    println("xinc = "+ nf(xinc, 1, 4) +", yinc = "+ nf(yinc, 1, 4));
  }
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    stroke(val);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
}

public void keyPressed() {
  if (key == 'x' || key == 'X') {
    isUsingGauss = !isUsingGauss;
    if (isUsingGauss) {
      println("using gaussian");
    }
    else {
      println("using uniform random");
    }
  }
  else if (key == 'r' || key == 'R') {
    initVars();
  }
  else if (key == 'd' || key == 'D') {
    isDebug = !isDebug;
  }
  else if (key == 'h' || key == 'H') {
    help();
  }
  else {
    if (keyCode == UP) {
      if (variance < 100) variance += 1;
      println ("variance = "+ variance);
    }
    else if (keyCode == DOWN) {
      if (variance > 1) variance -= 1;
      println ("variance = "+ variance);
    }
  }
}


/*
 * Returns a Gaussian variable using standard algorithm from Crandall,
 * <em>Pascal Applications for the Sciences</em>
 * 
 * @param mean
 * @param variance
 * @return a Gaussian-distributed random number
 */
public float calcGauss(float mean, float variance) {
  float u, v, x;
  float gauss;
  do {
    // assign u and v the next pseudorandom, uniformly distributed float value between 0.0 and 1.0
    u = random(1);
    v = random(1);
    if (0.0 == u)
      u = 0.000000001;
    x = 2.0 * (v - 0.5) / u;
  } while (x * x > (-4 * log(u)));
  gauss = (x * sqrt(variance) + mean);
  return gauss;
}

