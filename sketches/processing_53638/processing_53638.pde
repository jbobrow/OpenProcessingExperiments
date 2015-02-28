
// This class creates snowflakes by drawing lines which are rotated around the center of a circle.

class Snowflake {

  //Fields

  int steps; // this variable allows the drawing of lines rotated in steps around a circle to create the image of a snowflake
  float radius;  // this variable gives the radius of the snowflakes
  float angle; // this variable is necessary to rotate the lines around the circle in the specified amount of steps
  float x; // this keeps the ending x coordinates of the lines that create the snowflakes
  float y; // this keeps the ending y coordinates of the lines that create the snowflakes
  float sx;  // This gives the starting x coordinates of the snowflakes (which will just be mouseX)
  float sy; // This gives the starting y coordinates of the snowflakes (which will just be mouseX)
  float q; // This variable allows the snowflakes to rotate as they are falling

  //Constructor

  Snowflake () {
    steps = int(random(7, 12)); // This assures that the snowflakes will be made up of different amounts of lines (different looking snowflakes)
    radius = random(4, 8); // This allows the snowflakes to be different sizes for different mouse clicks
    angle = 2*PI/steps;
  }

  // Methods

    void draw () {
    sx = mouseX; // This assures that the snowflake will have a starting x position created where the mouse is clicked
    sy = mouseY; // This assures that the snowflake will have a starting y position created where the mouse is clicked
    q = 1;
    stroke(255); 
    strokeWeight(random(.9, 1.1));
    for (int i=0; i<steps; i++) {
      float x = cos(angle*i)*radius;
      float y = sin(angle*i)*radius;  
      line (sx, sy, sx+x, sy+y);
    }
  }

  void step () {
    sx = sx+1;
    sy = sy+2;
    stroke(255);
    q=q+.05; // This gives the speed of the rotation of the snowflakes
    strokeWeight(random(.9, 1.1));
    for (int i=0; i<steps; i++) {
      float x = cos(angle*i+q)*radius;
      float y = sin(angle*i+q)*radius;  
      line (sx, sy, sx+x, sy+y);
    }

    // The following code assures that the snow position will reset to the top of the screen once it goes past the bottom of the screen

    if (sy>height) {
      sy=0;
    }
    else {
    }

    // The following code assures that the snow position will reset to the left of the screen once it goes past the right of the screen

    if (sx>width) {
      sx=0;
    }
    else {
    }
  }
}


