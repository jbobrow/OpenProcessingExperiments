
/*********************************
 * Demo Bildschirmschoner
 * F. Dennler, 2013
 * Based on http://www.learningprocessing.com/examples/chapter-10/example-10-2/
 *********************************/
//import processing.opengl.*;

// user settings
int numballs = 3;                // amoubnt of balls
color bg = color(0,0,0);         // backgroubnd color

/*********************************
 * do not change the lines below .... 
 **************************************/
ArrayList balls;                 // list of balls
float r;                         // ellipse radius
float deltaX, deltaY;            // radius offset x,y [4:3 / 16:9]
int frameCount  = 0;             // count frames

/*********************************
 * setup sketch
 **************************************/
void setup()
{
  //size(screen.width, screen.height); // set sketch size
  size(640, 360);
  smooth();
  balls = new ArrayList();  // Create an empty ArrayList
  r = random(3, 12);        // random size of the ellipse
  setAspectRatio(r);        // adapt radius for 4:3, 16:9 and resolution
  int diff = 1;             // x/y diff vector
  float offset = random(2*r,5*r); // offset between balls
  // create ball objects
  for (int i=0; i<numballs; i++) {
    balls.add(new Ball(r, offset + i*10*deltaX, offset + i*10*deltaY, diff*deltaX, -diff*deltaY));  // Start by adding one element
    //diff *= -1;
  }
  background(bg);
  stroke(0,0,0);
  noCursor();
}

/**
 * main draw callback
 **************************************/
void draw()
{
  frameCount++;
  for (int i = balls.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing,
    Ball ball = (Ball) balls.get(i);
    ball.move(); ball.display();
  }
}

/**
 * calculate aspect ration
 * the screensaver will adapt between 4:34 and 16:9
 **************************************/
void setAspectRatio(float r) {
  float dX = (screen.width*1.0/screen.height*1.0);
  float dY = (screen.height*1.0/screen.width*1.0);
  //println(screen.width + " " + screen.height);
  deltaX = r*dX + r*dX;
  deltaY = r*dY + r*dY;
}


/**
 * for the screensaver to quit 
 **************************************/
void mouseMoved()
{
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  if ((dx > 1) || (dy > 1)) {
    if (frameCount > 9) {
      exit();
    }
  }
}

class Ball {

  float r;   // radius
  float x,y; // location
  float xspeed,yspeed; // speed
  color c;
 
  // Constructor
  Ball(float tempR, float xIn, float yIn, float speedInX, float speedInY) {
    r = tempR;
    x = xIn; //random(width);
    y = yIn;//random(height);
    xspeed = speedInX; //5 * random( - 1,1);
    yspeed = speedInY; //5 * random( - 1,1);
    c = randomColor();
  }
 
  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    // change color
    if (x > ( width - deltaX) || x < deltaX) {
      xspeed *= -1;
      c = randomColor();
    }
    //Check vertical edges
    // change color
    if (y > ( height - deltaY ) || y < deltaY) {
      yspeed *= -1;
      c = randomColor();
    }
    int t = (int)random(100,300);
    if ((frameCount % t) == 0) {
      c = bg;
    }
  }
 
  color randomColor()
  {
    color from = color(random(222), random(202), random(105, 125));
    color to = color(random(222), random(202), random(185, 245));
    color interB = lerpColor(from, to, 1);
    return interB;
  }

  // Draw the ball
  void display() {
    fill(c);
    if (c == bg) {
      ellipse(x,y, deltaX + 1, deltaY + 1);
    } else {
      ellipse(x,y, deltaX, deltaY);
    }
  }
}


