
int var = 40; // 40 variables
 
// Setting variables for the array
float[] x = new float[var]; // Sets the X-coordinate
float[] y = new float[var]; // Sets the Y-coordinate
float[] speed = new float[var]; // Sets the speed
float[] drop = new float [var]; 
void setup() {
  size(300, 300);
  background(0);
  noStroke();
  
  smooth();
  
  
 

 
  // Seeding the array
  for (int i=0; i < var;i++) {
    x[i] = random(width);
    y[i] = random (height);
    speed[i] = .5;
  for (int j = 0; j < x.length; j++) {
    x[j] = random(height);
  }
  }
    }
 
void draw() {
  background(0);
  
  //test
  fill(0,200,40,5);
  for (int j = 0; j<x.length;j++) {
    rect(0,y[0], 300, 30); //placement, size and direction of movement for bar
    x[j] = x[j]+1;
    if (x[j] > height) x[j] = 0;
  }

 
  for (int i=0; i < var; i++) {
    
    fill(0,200,40,10); 
    ellipse(150, 150, x[i], y[i]);

    
    x[i] = x[i] + speed[i];
    if (x[i] > width) {
      x[i] = 0;
    }
    y[i] = y[i] + speed[i];
    if (y[i] > height) {
      y[i] = 0;
    }
  }
}



