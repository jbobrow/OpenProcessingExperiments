
//Hyun Woo Jo  HW5
//Copyrighted 2013 Jan, Hyun Woo Jo

float x, y, theta, sx, sy, stheta;
void setup( )
{
  background(194,252,242);
  size( 400, 400 );
  smooth();
  x = 100;
  y =300;
  theta = 4.7;
  fill(0);
  textSize(20);
  text("A : Left,        D: Right",10,30);
  text("W: Point Up, S: Point Down",10,50);
  fill(200,0,0);
  text("F : FIRE!",10,70);
}

void draw( )
{
  fill(194,252,242);
  rect(0,90,400,310);
  fill(113,73,34);
  rect(0,300,400,100);
  shell();
  tank( x, y,theta);
}
void shell()
{
 fill(216,0,4);
 sx=sx+sin(stheta)*3;
 sy = sy-sin(stheta+PI/2)*3;
 ellipse(sx,sy,4,4); 
  
}
void tank( float fx, float fy, float ang)
{ 
  strokeWeight(5);
  stroke(0,0,0);
  line(fx+35,y-36, fx+35+sin(theta)*50 , y-36-sin(theta+PI/2)*50);
  strokeWeight(1);
  fill (17,103,21);
  quad(fx,y,fx+90,y,fx+110,y-30,fx-20,y-30);
  quad(fx+10,y-30,fx+25,y-45,fx+65,y-45,fx+80,y-30);
  fill (40);
  stroke(40,40,40);
  arc(fx+5, y-7, 20, 20, PI/2, 3*PI/2);
  arc(fx+85, y-7, 20, 20, -PI/2, PI/2);
  rect(fx+5, y-17,80,20);
}

void keyPressed()
{
  if (key == 'd')
  {
    if (x<450)
    {
      x++;
    }
  }
  if (key == 'a')
  {
    if (x>65)
    {
      x--;
    }
  }
  if (key == 's')
  {
    if (theta>4.66)
    {
      theta= theta-0.02;
    }
  }
  if (key == 'w')
  {
    if (theta<5.1)
    {
      theta= theta+0.02;
    }
  }
if (key == 'f')
  {
    sx= x+35;
    sy= y-36;
    stheta = theta;
  }
}



