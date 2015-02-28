
class  Monster {
  float x, y;
  float mx, my;
  color c; 

  Monster () {
    x= random (width);
    y=random (height);
    //how much x value will move it could be from -10 to 10= pixals per second
    mx= random (-10, 10);
    my= random (-10, 10);
    c = color (random(255), random (255), random (255));
  }

  void move () {
    x+=mx; 
    y+=my; 
    //check to see if it is past the screen 
    // || is or 
    if (x> width || x<0) {
      mx*=-1;
    }
    if (y> height || y<0) {
      my*=-1;
    }
  }

  void display () {
    fill (c);
    ellipse (x, y, 40, 50);
    noStroke ();
    triangle(x-15, y-10, x-20, y-35, x-2, y-10);
 triangle(x+15, y-10, x+20, y-35, x+2, y-10);
 fill (255);
 ellipse (x-8, y-8, 10, 10);
 ellipse (x+8, y-8, 10, 10);
 fill(0);
 ellipse (x-8, y-8, 3, 3);
 ellipse (x+8, y-8, 3, 3);
 fill (255);
 rect (x-12, y+8, 24, 3);


  }
}

