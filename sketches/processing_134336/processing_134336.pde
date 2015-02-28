
int xpos = 300;
int ypos = 200;
int speed = 1;
int score = 0;
int lives = 5;
int xdir = 1;
int ydir = 1;
float r = 255;
float g = 255;
float b = 255;
boolean lost = false;
void setup()
{
  size(600, 400);
  smooth();
  textSize(20);
}
void draw()
{
  background(0);
  fill(0, 255, 0);
  text("score = " + score, 10, 20);
  text("lives = " + lives, width - 100, 20);
  xpos = xpos + (speed * xdir);
  ypos = ypos + (speed * ydir);
  if (xpos > width-25 || xpos < 25)
  {
    xdir = -xdir;
  }
  if (ypos > height-25 || ypos < 25)
  {
    ydir = -ydir;
  }
  fill(r, g, b);
  ellipse(xpos, ypos, 50, 50);
  if (lives <= 0)
  {
    textSize(40);
    fill(0, 255, 0);
    text("click to restart", 150, 150);
    noLoop();
    lost = true;
    textSize(20);
  }
}
void mousePressed()
{
  if (dist(mouseX, mouseY, xpos, ypos) <= 25)
  {
    score = score + speed;
    speed = speed + 1;
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
  }
  else
  {
    lives = lives - 1;
  }
  if (lost == true)
  {
    score = 0;
    lives = 5;
    speed = 1;
    xpos = 300;
    ypos = 200;
    xdir = 1;
    ydir = 1;
    lost = false;
    r = 255;
    g = 255;
    b = 255;
    loop();
  }
}



