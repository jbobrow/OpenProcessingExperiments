
Circle myCircle = new Circle(250, 250, 50);
Circle myCircle2 = new Circle(150, 150, 100);
Circle myCircle3 = new Circle(250, 250, 70);


void setup () {

  size (400, 400);
  smooth ();
}

void draw () {
  background (50, 150, 250);
  myCircle.update();
  myCircle2.update();
  myCircle3.update();

  myCircle.checkCollision();  
  myCircle2.checkCollision();
  myCircle3.checkCollision();


  myCircle.drawCircle ();
  myCircle2.drawCircle ();
  myCircle3.drawCircle ();
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

    xSpeed = random (-10, 10);
    ySpeed = random (-10, 10);
  }

  void update () {

    x += xSpeed;
    y += ySpeed;
  }
  void checkCollision () {
    if ( (x<circleSize/2) || (x>width-circleSize/2)) {
      xSpeed = -xSpeed;
      
    }

    if (( y<circleSize/2) || (y>height-circleSize/2)) {
      ySpeed = -ySpeed;
    }
  }

    void drawCircle () {
      fill (225);
      ellipse (x, y, circleSize, circleSize);
    }
  }

                
                                
