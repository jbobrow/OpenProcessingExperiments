
//Math 1 - Arithmetic, Functions
//Exercise #2
/*1. Use one variable to set the position and size for three ellipses.*/
//Math 1 - Arithmetic, Functions
//Exercise #2
/*1. 2. Use multiplication to create a series of lines with increasing 
 space between each.*/

float x = 10;
float y = 30;
float s = 1;

void setup() {
  size (400, 400);
}

void draw () {
  background (255);
  strokeCap(SQUARE);
  strokeWeight(s);
  line (x, y, y, x);

  //s= s+s;
  x = 1.02*x;
  y= 1.02*y;
  println(x, y);
  if (x >400) {
    x = 10;
  }

  if (y > 1200) {
    y = 30;
  }
}



