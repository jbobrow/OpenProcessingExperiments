
// P04_Var5_ModifyingArrays
// Barton Poulson uvu.edu/profpages/bart
// 18 January 2013

int wide = 600;
int high = 200;

float[] x = {random(0, wide), random(0, wide), random(0, wide)};
float[] x2 = new float[x.length];
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
  arrayCopy(x, x2);
  x2 = append(x2, random(0, wide));
  c = append(c, color(random(255), random(255), random(255)));
}

void draw() {
  background(c[4]);
  fill(c[0], 100);
  ellipse(x2[0], y, d, d);
  fill(c[1], 100);
  ellipse(x2[1], y, d, d);
  fill(c[2], 100);
  ellipse(x2[2], y, d, d);
  fill(c[3], 100);
  ellipse(x2[3], y, d, d);
  
  x2[0]++;
  x2[0] = constrain(x2[0], d, width-d);
  x2[1]--;
  x2[1] = constrain(x2[1], d, width-d);
  x2[2]++;
  x2[2] = constrain(x2[2], d, width-d);
  x2[3]++;
  x2[3] = constrain(x2[3], d, width-d);
}
