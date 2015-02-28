
float x = 300;
float y = 300;
float z = 300;
float q = 300;
PGraphics pg;
float xMove = random(5, 6);
float yMove = random(5, 6);
float targetY;
PImage img;
PImage img2;

void setup() {
  background(255);//white
  size(600, 600);// bounderies
  stroke(255);//white
  smooth();
  img = loadImage ("Charlie-Sheen-Winning.jpg");
  img2 = loadImage ("epic-fail.jpg");
}

void draw()
{
  background(255);//white
  fill(0);//black
  stroke(0);//black
  rect(25, 25, 550, 550);//field
  fill(255);//white
  ellipse(300, 300, 100, 100);//center circle

  //respawn line
  stroke(255);
  line(500, 0, 500, 600);
  line(500, 25, 500, 575);

  //our ball
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(x, y, 30, 30);
  x = x + xMove;
  y = y + yMove;

  fill(0);//black
  rect(width/2, 24, 275, 552);//right white field

  noFill();
  stroke(255);
  ellipse(x, y, 30, 30);

  //ball perameters
  if (x>width+16) xMove = xMove * -1.05;
  if (y>height) yMove = yMove * -1.01;
  if (x<0) xMove = xMove * -1.05;
  if (y<0) yMove = yMove * -1.01;


  fill(0);
  stroke(255);
  targetY = y;
  float dy = targetY - z;
  if (abs(dy) > 1) {
    z += dy * random(.01, .14);
  }
  rect(520, z-60, 30, 120);

  fill(255);
  stroke(0);
  rect(50, q-60, 30, 120);

  // HITTEST!!! (left paddle)
  if (x < 95 && x > 35) {
    if (y < q+75 && y > q-75) {
      //BOUNCE!!
      xMove = xMove * -1.04;
    }
  }
  // HITTEST!!! (right paddle)
  if (x < 550 && x > 520) {
    if (y < z+75 && y > z-75) {
      xMove = xMove * -1.04;
    }
  }

  //Respawn   if (x < 16) x = 500;

  //Points
  if (keyPressed) {
    if (key == 'w') {
      q-=10;
    }
    if (key == 's') {
      q+=10;
    }
  }

  if (x > width) {
    fill(0);
    rect(0, 0, 600, 600);
    image (img, 100, 100);
    noLoop();
  }
  if (x < 15) {
    fill(0);
    rect(0, 0, 600, 600);
    image (img2, 0, 0);
    noLoop();
  }
}


