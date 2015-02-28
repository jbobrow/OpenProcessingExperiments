
class Arrows {

  //Stating variables: color, x and y position
  color c;
  color c2;
  color c3;
  float x;
  float y;

  //Defining and renaming variables to make it work; fill in these spaces in actual program
  Arrows (float xposition, float yposition) {
    background (149, 255, 234);
    c = color (146, 77, 79);
    c2 = color (228);
    c3 = color (255, 218, 53);
    x = xposition;
    y = yposition;
  }

  //Display function, defining xposition and yposition variables
  void display () {

    //How to make arrows - stick
    fill (c);
    smooth ();
    rectMode (CENTER);
    rect (x, y, 70, 5);

    //How to make arrows - arrowhead
    fill (c2);
    triangle (x + 35, y - 5, x + 35, y + 5, x + 45, y + 2.5);

    //How to make arrows - end
    fill (c3);
    quad (x - 35, y - 2.5, x - 35, y + 2.5, x - 50, y - 10, x - 50, y + 10);
  }

  void shoot () {

    //Speed Variables
    x = x + 3;

    // xposition = xposition + xspeed;
    if (x > width) {
      x = 0;
    }
  }
}


