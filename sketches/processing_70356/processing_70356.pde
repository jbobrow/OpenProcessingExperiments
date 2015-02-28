
//Justin Lee, CP1 mods 14/15
//URL: http://programsofjustin.webs.com/AnimationPong.html
void setup()
{
  size (300, 300);
  frameRate(60);
  stroke(255);
}
float x=28;
float changeX=2.25;
float y=10;
float changeY=1.5;

void draw()
{
  background(0);
  text1();
  bars();
  rectangles();
  ball();
}

void text1()
{
  textSize(35);
  noFill();
  stroke(255);
  text("PONG", 130, 160);
}
void bars()
{
  stroke(255);
  fill(255);
  rect (10, y, 10, 40);
  rect (280, y, 10, 40);
  y=y+changeY;
  if (y>260)
  {
    changeY=-changeY;
  }
  if (y<1)
  {
    changeY=-changeY;
  }
}
void rectangles()
{
  stroke(255);
  fill(255);
  rect (0, 0, 299, 13);
  rect (0, 287, 299, 15);
}
void ball()
{
  noStroke();
  ellipse(x, y+20, 15, 15);
  x=x+changeX;
  if (x>273)
  {
    changeX=-changeX;
  } 
  if (x<29)
  {
    changeX=-changeX;
  }
}
