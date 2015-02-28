
// Allison Etheredge
// Lecture 6.1
// 28 September 2011

// set [minimum] of two arrays with 100 variables
// is this right??

int num = 100; // 100 variables

// set the arrays
float[] x = new float[num]; // sets x-coordinate
float[] y = new float[num]; // sets y-coordinate
float[] speed = new float[num]; // sets speed

void setup() {
  size(300, 300);
  smooth();

  // seed the arrays
  for (int i = 0; i < num; i++) {
    x[i] = random(width);
    y[i] = i * (height/num);
    speed[i] = random(0.25, 5); // utilizes a random speed for the bubbles // what does 0.25 do? can't figure it out by playing with the numbers...
    
    // speed[i] = 1; // alternative speed: utilizes a set speed for the bubbles
  }
}

void draw() {
  background(0);
  
  // draws the ellipse
  for (int i = 0; i < num; i++) {
    stroke(255); 
    fill(x[i], x[i], 255); 
    //fill(70, 120, 198, 90); 
    ellipse(x[i], y[i], i, i);
    stroke(255, 100); 
    ellipse(x[i], y[i], 3, i); 
    
    // sets motion
    x[i] = x[i] + speed[i];
    
    // sets the loop along the x-axis
    if (x[i] > width) {
      x[i] = 0;
    }
  }
}


