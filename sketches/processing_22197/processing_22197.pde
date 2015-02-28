
// Snowflakes

// We can also give each snowflake a different speed, creating the illusion
// of depth!

// all we need 500 speed variables! easy to do with arrays!

// create the arrays -- we have 500 points 
float[] x = new float[500];
float[] y = new float[500];
float[] speed = new float[500];

//----------------------------------------------------------
void setup() {
  size(300, 300);
  smooth();
  
  // fill the arrays with random values 
  // better to use "x.length" than 500, in case we change the size later
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);  
    speed[i] = random(0.1, 2);
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
    y[i] += speed[i];
    
    // wrap around when we reach the bottom, creating the illusion 
    // of infinite snow flakes 
    if (y[i] > height) y[i] = 0; 
  }
}
