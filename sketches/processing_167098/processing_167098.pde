

Ball[] myBall = new Ball[200];

void setup() {
  size(400, 400);
  smooth();

  for (int i=0; i<myBall.length; i++) {
    myBall[i] = new Ball(200, 200, 10);
  }
}

void draw() {

  background(0);

  for (int i=0; i<myBall.length; i++) {

    myBall[i].update();
    myBall[i].collisions();
    myBall[i].drawBall();
    
    
  }
}





class Ball {

  float x;
  float y;
  float xSpeed;
  float ySpeed;

  float circleSize;

  Ball(float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;

    xSpeed = random(-1, 1);
    ySpeed = random(-5, 5);
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  void collisions() {

    float r = circleSize/2;

    if ( (x<r) || (x>width-r)) {
      xSpeed = -xSpeed;
    } 

    if ( (y<r) || (y>height-r)) {
      ySpeed = -ySpeed;
    }
  }

  void drawBall() {

    fill(random(0, 255), random(0, 255), random(0, 255));
    noStroke();
    ellipse(x, y, circleSize, circleSize);
  }
  
  
}




