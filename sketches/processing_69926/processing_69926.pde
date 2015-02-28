
//Kelvin Pan
//Computer Programming 1
//Simon 16/17
//Functions and Animations: Bouncing Balls
//awxrus.webs.com

//variables
float x = 0;
float changeX = 10;
float y = 0;
float changeY = .5;
float R = 255;
float changeR = 1;

//setup
void setup()
{
  size(500,500);
  background(0);
}

//balls
void draw()
{
  fill(0,0,0,100);
  ellipse(x+10,y+10,30,30);
  fill(R,R,255,40);
  ellipse(x,y,30,30);
  x = x + changeX;
  y = y + changeY;
  if(x > 500)
  {
    changeX = -10;
  }
  if(x < 0)
  {
    changeX = 10;
  }
  if(y > 500)
  {
    changeY = -.5;
  }
  if(y < 0)
  {
    changeY = .5;
  }
  R = R - changeR;
  if(R < 0)
  {
    changeR = -1;
  }
  if(R > 255)
  {
    changeR = 1;
  }
}
