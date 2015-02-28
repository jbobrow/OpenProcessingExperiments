
//Math 2 - Curves
//Exercise #1
/*1. Draw the curve y=1-x4 to the display window.*/

size (400,400);

for (int x =0; x<400; x++) {
  float n = norm (x,0.0, 400);
  float y = 1 - (pow(n,4));
  y *= 400;
  point(x,y);
}


