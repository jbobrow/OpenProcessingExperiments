
// Snowflakes
// draw 500 points at random, but this time we store their position using
// arrays so that they are consistent from frame to frame

// we also animate the snow flake by increasing all the 'y' variables over 
// time 

// create the arrays -- we have 500 points 
float[] x = new float[500];
float[] y = new float[500];

//----------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  
  // fill the arrays with random values 
  // better to use "x.length" than 500, in case we change the size later
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);  
  }
}

//----------------------------------------------------------
void draw() {
  background(0, 0, 64);
  stroke(255);
  strokeWeight(4);
  
  for (int i=0; i < x.length; i++) {
    point(x[i], y[i]);    

    // "moves" the snow flakes by increasing the y values 
    y[i]++;
    
    // wrap around when we reach the bottom, creating the illusion 
    // of infinite snow flakes 
    if (y[i] > height) y[i] = 0; 
  }
}
