
// virtual pickup sticks
// based on an example from the book 'algorithms for visual design'

// in this version, we will use arrays to store the information
// related to the sticks
float[] x = new float[300]; // positon (x,y)
float[] y = new float[300];
float[] r = new float[300]; // rotation

void setup() {
  size(300, 300);  
  smooth();
  rectMode(CENTER);
  
  // fill the 3 arrays with random values 
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
    r[i] = random(TWO_PI);
  }  
}

void draw() {
  background(64);
  fill(255);
  
  // draw more or less sticks based on the value of mouseY
  int numRect = int(map(mouseY, 0, height, 1, x.length));
  
  for (int i=0; i < numRect; i++) {
    pushMatrix();
      translate(x[i], y[i]);
      rotate(r[i]);
      rect(0, 0, 5, 1000);
      
      // set a fill color based on "i" -- the first ones drawn will 
      // appear darker
      //fill(map(i, 1, numRect, 100, 255));
      
      // animate the rotation (remember r[i] is in radians)
      //r[i] += 0.005;
    popMatrix();
  }
}
