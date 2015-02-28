
Ball ball;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;
Ball ball9;
Ball ball10;
void setup()
{
  size(800, 600);
  ball = new Ball();
  ball2 = new Ball();
  ball3 = new Ball();
  ball4 = new Ball();
  ball5 = new Ball();
  ball6 = new Ball();
  ball7 = new Ball();
  ball8 = new Ball();
  ball9 = new Ball();
  ball10 = new Ball();
}
void draw()
{
  background(0, 160, 245);
  pushStyle();
  strokeWeight(1);
  stroke(0);
  //Taskbar
  fill(0, 0, 0, 30);
  rect(-1, height-50, width, height);
  stroke(255);
  pushStyle();
  stroke(0);
  ellipse(35, height-25, 45, 45);
  popStyle();
  line(-1, height-49, width, height-49);
  ellipse(35, height-25, 43, 43);
  //Desktop icon
  pushStyle();
  stroke(0);
  rect(width-20, height-50, width, height);
  stroke(255);
  rect(width-19, height-49, 17, 47);
  popStyle();
  //Start button
  pushStyle();
  noStroke();
  fill(0, 132, 229);
  ellipse(35, height-25, 42, 42);
  //Boxes
  //Red
  fill(247, 75, 17);
  rect(23, height-36, 10, 10);
  //Green
  fill(90, 219, 82);
  rect(36, height-36, 10, 10);
  //Blue
  fill(73, 172, 206);
  rect(23, height-23, 10, 10);
  //Yellow
  fill(232, 213, 63);
  rect(36, height-23, 10, 10);
  popStyle();
  ball.move();
  ball.bounce();
  ball.show();
  ball2.move();
  ball2.bounce();
  ball2.show();
  ball3.move();
  ball3.bounce();
  ball3.show();
  ball4.move();
  ball4.bounce();
  ball4.show();
  ball5.move();
  ball5.bounce();
  ball5.show();
  ball6.move();
  ball6.bounce();
  ball6.show();
  ball7.move();
  ball7.bounce();
  ball7.show();
  ball8.move();
  ball8.bounce();
  ball8.show();
  ball9.move();
  ball9.bounce();
  ball9.show();
  ball10.move();
  ball10.bounce();
  ball10.show();
}
class Ball
{
  float r = random(256);
  float g = random(256);
  float b = random(256);
  int x = int(random(width-(width-100), width-100));
  int y = int(random(height-(height-100), height-100));
  int xdir = int(random(2, 5));
  int ydir = int(random(2, 5));
  void show()
  {
    pushStyle();
    fill(255, 255, 255, 10);
    strokeWeight(3);
    stroke(r, g, b, 200);
    ellipse(x, y, 100, 100);
    fill(255);
    strokeWeight(0);
    ellipse(x-30, y-30, 10, 10);
    ellipse(x-35, y-22, 5, 5);
    noStroke();
    fill(255, 255, 255, 20);
    ellipse(x, y-10, 80, 70);
    popStyle();
  }
  void move()
  {
    x = x + xdir;
    y = y + ydir;
  }
  void bounce()
  {
    if (x <= 5 || x >= width-5)
    {
      xdir = -xdir;
    }
    if (y <= 5 || y >= height-5)
    {
      ydir = -ydir;
    }
  }
}
