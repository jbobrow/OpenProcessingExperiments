
//6.1) Create a 300x300px sketch that uses an array to manage at least 20 variables in a composition. If pressed for ideas, you may extend an older sketch by modifying it to use arrays.
//Graduate Challenge: Use two arrays (or more) to manage at least 100 variables.


int num = 1000; // how many thingys

// create the arrays
float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
color[] c = new color[num]; // thingy color


void setup() {
  size(300, 300);
  smooth();
}


void draw() {
}


void mousePressed() {
  background(0);

  // seed the array
  for (int s=0; s<num; s++) {
    x[s] = random(width);
    y[s] = random(height);
    c[s] = color(int(random(255)), 30, 70); 

    // draw the thingys
    ellipseMode(CENTER);
    strokeWeight(1);
    stroke(c[s]);
    fill(0);
    ellipse(x[s], y[s], 5, 5);
  }
}


