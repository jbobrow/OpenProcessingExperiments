
/* Shapes are thrown to interact with each others and bump into the walls.
 Intersecting shapes form patterns.
 */

/* Shades
 
 * #BCB8B6
 * #B6A28D
 * #C4A380
 * #A1A1A5
 
 */

// Classes 


// Shapes 

Circles circles1;
Circles circles2;
Circles circles3;
Circles circles4;

Circle circle1;
Circle circle2;
Circle circle3;
Circle circle4;

void setup () {

  // Setup for stage.
  size (1280, 720);
  frameRate (30);

  //  Circles (int tempRadius, float tempXpos, float tempYpos)
  circles1 = new Circles (100, 800, 100);
  circles2 = new Circles (180, 500, 400);
  circles3 = new Circles (50, 200, 100);
  circles4 = new Circles (160, 700, 200);

  //  Circle (float tempXpos, float tempYpos, float tempRadius, color tempShade )
  circle1 = new Circle (800, 400, 100, color (#B6A28D, 200));
  circle2 = new Circle (180, 500, 90, color (#BCB8B6, 200));
  circle3 = new Circle (250, 500, 200, color (#A1A1A5, 200));
  circle4 = new Circle (200, 600, 25, color (#C4A380, 150));
}

void draw () {

  background (200);

  circle4.display ();
  circle2.display ();
  circle3.display ();
  circles2.display ();
  circle1.display ();
  circles1.display ();
  circle2.display ();
  circles3.display ();
  circles4.display ();
    
}

//Name
class Circle {

  //Data
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;
  float xpos;
  float ypos;
  color shade;
  float radius;

  //Constructor
  Circle (float tempXpos, float tempYpos, float tempRadius, color tempShade ) {

    shade = tempShade;

    radius = tempRadius;

    xspeed = 3.2;
    yspeed = 2.3;

    xdirection = random (-1, 1);
    ydirection = 1;

    xpos = tempXpos; // Value  center x.
    ypos = tempYpos; // Value  center y.
  }

  //Functionality

  void display () {
    noStroke();
    fill (shade);
    smooth ();
    ellipseMode (RADIUS);

    // Update  coordinates
    xpos = xpos + (xspeed * xdirection); // Change of distance over time.
    ypos = ypos + (yspeed * ydirection);

    // Bump  walls
    // Change  x direction, left and right.
    if (xpos > (width - radius) || xpos < radius) {
      xdirection *= -1;
    }
    //Change  y direction up and down.
    if (ypos > (height - radius) || ypos < radius) {
      ydirection *= -1;
    }

    //Create shape
    ellipse (xpos, ypos, radius, radius);
  }
}

// Name
class Circles {

  // Data
  int radius;
  float xspeed;
  float yspeed;
  float xdirection;
  float ydirection;
  float xpos;
  float ypos;

  // Constructor
  Circles (int tempRadius, float tempXpos, float tempYpos) {

    radius = tempRadius;

    xspeed = 3.2;
    yspeed = 2.3;

    xdirection = random (-1, 1);
    ydirection = 1;

    xpos = tempXpos; // Value  center x.
    ypos = tempYpos; // Value  center y.
  }

  // Functionality

  void display () {

    // Setup for concentric circles.
    noFill ();
    smooth ();
    stroke (255);
    ellipseMode (RADIUS);

    // Update  coordinates.
    // Multiplied by the direction it should bounce.
    xpos = xpos + (xspeed * xdirection);
    ypos = ypos + (yspeed * ydirection);

    // Bump  walls
    // Change  x direction, left and right.
    // For perimeter to bounce, substract maxium size (radius).
    if (xpos > (width - radius) || xpos < radius) {
      xdirection *= -1;
    }
    //Change  y direction up and down.
    if (ypos > (height - radius) || ypos < radius) {
      ydirection *= -1;
    }

    //Create shape
    // Replace variable so it is controlled by radius.
    for (int i = 0; i < radius; i += 5) {  
      ellipse (xpos, ypos, i, i);
    }
  }
}










