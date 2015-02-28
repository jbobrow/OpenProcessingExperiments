
//make a 500x500 frame
//make and ellipse centered at (150,150) and width a random # between 0-250 minus 100 and height a random # between 250-500 minus 100
//fill this ellipse blue
//make multiple yellow lines starting at 0 spaced 40 apart, the line will start at the top of the frame and end at a # between 250-500 
//make multiple light blue lines starting a 10 and spaced 40 apart, the line will start between 250-500 and will end at 100 plus the # chosen
//make an ellipse in the area less that 100 for the x value, the center is random between 0-250 and the width and height is 50
//if your # fall outside of the last rule make an ellipse with center random between 0-250 and 250-500 with width 20
//the last ellipse is centered at a # between 250-500 and 0-250 and a width that is the reverse of the two chosen #'s
//make multipe blue lines that are spaced 40 apart that all start at (0,500) and end at a random point
//make green lines that start at the blue lines end point and have them end at (500,125)



void setup() {
  size (500, 500);
  background(3, 3, 3);
  smooth();
}

int start=250;
int spacing=40;
float x=random(0, 250);
float y=random(250, 500);



void draw() {
  ellipse(150, 150, x-100, y-100);
  for (int x=0;x<=500;x+=spacing) {
    stroke (200, 214, 53);
    strokeWeight(1);
    line(x, 0, x, y);//yellow lines
  }
  for (int x=10;x<=500;x+=spacing) {
    stroke(57, 143, 213);
    line(x, y, x, y+100);//light blue lines that start where the yellow lines stop
  }
  if (x<=100) {
    noStroke();
    fill(200, 214, 53);
    ellipse(x, x, 50, 50);
  }
  else {
    noStroke();
    fill(2, 232, 16);
    ellipse(x, y, 20, 20);
  }
  if (start<=500) {
    fill(10, 7, 247);
    ellipse(y, x, x, y);//large ellipse that divides the blue and green lines
  }
  //these two for() codes will start at their own points and end up connecting
  for (int x=0;x<=500;x+=spacing) {
    stroke(10, 7, 247);
    strokeWeight(2);
    line (0, 500, y, x);//blue line
  }
  for (int x=0;x<=500;x+=spacing) {
    stroke(41, 188, 23);
    strokeWeight(1);
    line (y, x, 500, 125);//green line
  }
}



