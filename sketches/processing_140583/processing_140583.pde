

/**
 * 
 * does a line drawing based on two arrays of points (x and y),
 * then after drawing, loops over those arrays and changes those values
 * (in this case by adding a random value to each point, making it "fall")
 *
 */

float[] x;
float[] y;

// TODO: if you wanted to have the shape drawn in a better way, you could add other 
// arrays here ... for example for line thickness ... set each value in setup() as with x and y
// and then use each value inside the first while() loop, as in draw()

void setup() {
  size(800,800);  
  x = new float[100];
  y = new float[100];

  x[0] = 400;
  y[0] = 400;

  x[1] = 500;
  y[1] = 400;  

  x[2] = 500;
  y[2] = 500;  

  x[3] = 400;
  y[3] = 500;  

  // You could add more points here.
  // etc ....

}

void draw() {
  
  background(0);
  stroke(255);
  
  int i = 1;
  while ( i < 4 ) { // TODO: change 4 to the number of points you have
    
    // TODO: could also play around with how you draw each point or line here:
    
    line( x[i-1],y[i-1], x[i],y[i] );
    
    i = i + 1;
  }
  
  i = 0;
  while ( i < 4 ) { // TODO: change 4 to the number of points you have
  
    // TODO: maybe mess around with this to make it more sophisticated motion
    
    x[i] = x[i] + random(-10,10);
    y[i] = y[i] + random(-1,10);

    // TODO: add if statements to make the point "bounce"
    // ie, if the point is greater than the edge of the window, change the value somehow

    i = i + 1;
  }
  
}

