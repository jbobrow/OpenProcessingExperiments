
// P04_Var4_CreatingArrays
// Barton Poulson uvu.edu/profpages/bart
// 18 January 2013

int wide = 600;
int high = 200;

float[] x = {random(0, wide), random(0, wide), random(0, wide)};
int y = high/2;
int d = 80;

color[] c = {color(random(255), random(255), random(255)),
             color(random(255), random(255), random(255)),
             color(random(255), random(255), random(255)),
             color(random(255), random(255), random(255))};

void setup() {
//  size(wide, high);
  size(600, 200);  // OpenProcessing doesn't like variables for size
  noStroke();
}

void draw() {
  background(c[3]);
  fill(c[0], 100);
  ellipse(x[0], y, d, d);
  fill(c[1], 100);
  ellipse(x[1], y, d, d);
  fill(c[2], 100);
  ellipse(x[2], y, d, d);
  
  x[0]++;
  x[0] = constrain(x[0], d, width-d);
  x[1]--;
  x[1] = constrain(x[1], d, width-d);
  x[2]++;
  x[2] = constrain(x[2], d, width-d);
}
