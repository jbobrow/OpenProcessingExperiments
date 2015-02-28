
// P04_Var2_CreatingVariables
// Barton Poulson uvu.edu/profpages/bart
// 18 January 2013

int wide = 600;
int high = 200;

color bg;
color c1;
color c2;
color c3;
color c4;

float x1 = random(width);
float y1 = high*1/5;
float x2 = random(width);
float y2 = high*2/5;
float x3 = random(width);
float y3 = high*3/5;
float x4 = random(width);
float y4 = high*4/5;
int d = 80;

size(wide, high);
noStroke();
  
bg = color(random(255), random(255), random(255));
c1 = color(random(255), random(255), random(255), 100);
c2 = color(random(255), random(255), random(255), 100);
c3 = color(random(255), random(255), random(255), 100);
c4 = color(random(255), random(255), random(255), 100);

background(bg);
fill(c1);
ellipse(x1, y1, d, d);
fill(c2);
ellipse(x2, y2, d, d);
fill(c3);
ellipse(x3, y3, d, d);
fill(c4);
ellipse(x4, y4, d, d);
