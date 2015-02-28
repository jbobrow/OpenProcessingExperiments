
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */

//setup -----

size(800, 800);
background(0);
smooth();
noFill();
colorMode(HSB, 360, 100, 100);

//draw -----

for (int i=0; i<800; i=i+10) {
  for (int j=0; j<800; j=j+30) {
    float a = map(j, 0, width, 0, 360);
    float b = map(i, 0, width, 0, 100);
    stroke(a, 50, 100, 25);
    ellipse(width/2, width/2, i, j);
    stroke(4, b, 96, 25);
    ellipse(width/2-100, width/2+100, i, j);
    stroke(315, 48, 55, 25);
    ellipse(width/2+100, width/2+100, i, j);
  }
}



