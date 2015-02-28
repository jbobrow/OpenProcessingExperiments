
Circle[] circles = new Circle [30];


void setup () {

  size (400, 400);
  smooth ();

  for (int i=0; i<circles.length; i++) {
    circles[i] = new Circle (200, 200, 10);
  }
}


void draw () {    

  background (84, 165, 27);

  for (int i = 0; i<circles.length; i++) {

    circles[i].update();
    circles[i].checkCollision();  
    circles[i].drawCircle ();
  }
}


class Circle {

  float x;
  float y;
  float xSpeed;
  float ySpeed;

  float circleSize;

  Circle(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;

    xSpeed = random (-5, 5);
    ySpeed = random (-5, 5);
  }

  void update () {

    x += xSpeed;
    y += ySpeed;
  }
  void checkCollision () {
    if ( (x<0) || (x>width)) {
      xSpeed = -xSpeed;
    }

    if (( y<0) || (y>height)) {
      ySpeed = -ySpeed;
    }
  }

  void drawCircle () {
    fill (0);
    ellipse (x, y, circleSize, circleSize);
  }
}
                
                                
