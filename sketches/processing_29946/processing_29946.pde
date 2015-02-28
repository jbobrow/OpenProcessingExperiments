
Ball[] myBall;
int ballAmount = 40;
int distance = 100;
int fade = 255;
int radius = 15;

void setup() 
{
  noCursor();
  size(700, 300);
  background(255);
  fill(255);
  smooth();
  noStroke();
  mouseX = width/3;
  mouseY = 240;

  //class setup
  myBall = new Ball[ballAmount];
  for (int i = 0; i < ballAmount; i++) 
  {
    myBall[i] = new Ball();
    myBall[i].setup();
  }
}

void draw() 
{
  fill(255, 20);
  rect(0, 0, 700, 300);
  drawEllipses();
  for (int i = 0; i < ballAmount; i++) 
  {
    myBall[i].step();

    for (int j = 0; j < i; j++) 
    {
      if (i != j) 
      {
        float distBalls = dist(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);

        if (distBalls <= distance) 
        {
          for (int k = 0; k < j; k++) 
          {
            if (i != j && j != k) 
            {
              float distBalls2 = dist(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y);
              if (distBalls2 < distance) 
              {
                noStroke();
                fill(0, 50);
                triangle(myBall[i].x, myBall[i].y, myBall[j].x, myBall[j].y, myBall[k].x, myBall[k].y);
                break;
              }
            }
          }
        }
      }
    }
    myBall[0].x = mouseX;
    myBall[0].y = mouseY;
  }
  noStroke();
  fill(255, 255);
  //ellipse(mouseX, mouseY, 5, 5);
  fill(255, 200);
  ellipse(mouseX, mouseY, 15, 15);
}

void mouseDragged() 
{
  myBall[0].x = mouseX;
  myBall[0].y = mouseY;
}

//change speed and direction
void mousePressed() 
{
  for (int i = 0; i < ballAmount; i++) 
  {
    myBall[i].setInc();
  }
}

void drawEllipses() {
  noStroke();
  fill(255, 255);
  ellipse(mouseX, mouseY, 5, 5);
  fill(255, 200);
  ellipse(mouseX, mouseY, 30, 30);
  fill(255, 150);
  ellipse(mouseX, mouseY, 60, 60);
  fill(255, 100);
  ellipse(mouseX, mouseY, 130, 130);
  fill(255, 50);
  ellipse(mouseX, mouseY, 280, 280);
  fill(255, 20);
  ellipse(mouseX, mouseY, 560, 560);
}

//THE CLASS
class Ball {
  float x;
  float y;
  float incX;
  float incY;

  void setup() {
    x = random(width);
    y = random(height);
    setInc();
  }

  //speed
  void setInc() {
    incX = random(-5, 5);
    incY = random(-5, 5);
  }

  //the ball
  void drawBall() {
    noStroke();
    ellipse(x, y, radius, radius);
  }

  //direction
  void step() {
    if (x > width || x < 0) {
      incX = -incX;
    }
    if (y > height || y < 0) {
      incY = -incY;
    }
    x = x + incX;
    y = y + incY;

    if (x > width) {
      x = width;
      setInc();
    }
    if (x < 0) {
      x = 0;
      setInc();
    }
    if (y > height) {
      y = height;
      setInc();
    }
    if (y < 0) {
      y = 0;
      setInc();
    }
  }
}


