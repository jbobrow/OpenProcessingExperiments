
// P04_Var3_ModifyingVariables
// Barton Poulson uvu.edu/profpages/bart
// 18 January 2013

int wide = 600;
int high = 200;

color bg;
color c1;
color c2;
color c3;
color c4;

int x1 = 0;
float y1 = high*1/5;
int x2 = wide;
float y2 = high*2/5;
int x3 = 0;
float y3 = high*3/5;
int x4 = wide;
float y4 = high*4/5;
int d = 80;

void setup() {
//  size(wide, high);
  size(600, 200);  // OpenProcessing doesn't like variables for size
  
  noStroke();
  
//  bg = color(random(255), random(255), random(255));
  bg = 250;
  c1 = color(random(255), random(255), random(255), 100);
  c2 = color(random(255), random(255), random(255), 100);
  c3 = color(random(255), random(255), random(255), 100);
  c4 = color(random(255), random(255), random(255), 100);

  int random_0_10 = int(random(11));
  println("Random integer from 0 to 10: " + random_0_10);
  int random_1_6 = int(random(6)) + 1;
  println("Random integer from 1 to 6: " + random_1_6);

}

void draw() {
  background(bg);
  fill(c1);
  ellipse(x1, y1, d, d);
  fill(c2);
  ellipse(x2, y2, d, d);
  fill(c3);
  ellipse(x3, y3, d, d);
  fill(c4);
  ellipse(x4, y4, d, d);
  
  x1++;
  x1 = constrain(x1, d, width-d);
  x2--;
  x2 = constrain(x2, d, width-d);
  x3 += 2;
  x3 = constrain(x3, d, width-d);
  x4 -= 2;
  x4 = constrain(x4, d, width-d);
}
