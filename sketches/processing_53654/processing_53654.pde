
//Georgina Yeboah
//PS2-1
//My lerped loop :D
//My variables
int y = 10;
color from = color(269, 193, 255);
color to = color(48, 3, 67);
//---------------------------------------------------------------
void setup () {
  size (300, 300);
  background(51);
}

void draw () {
  // the lerpColor is the calculated increment between two colors.
  // the deciamal at the the end of the syntax ".5" is 
  //called the atm which is the amount of color is collided between
  // the two points "from and to"
  color c2 = lerpColor(from, to, .3);

  // here is where I loop the rectangle using my lerpColor
  while ( y < height) {
    stroke (255);
    fill(c2);
    rect(25, y, 250, 15);

    y = y + 25;
  }
}

//tada! :D


