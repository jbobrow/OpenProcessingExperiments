
// Keana Moezzi, CP1 modes 4-5, Animation Assignment
// url: http://ilovestarsandsmiles.webs.com/

float x=0;
float y=105;
float changeY=2;
float w=500;
int sunY = 10;
float a=60;
float b=105;
float c=65;
float d=106;


void setup()
{
  size(500, 500);
  smooth();
}
void draw()
{

  moon(); 
  if (x>543)
  {
    sun();
  }
}

void moon()
{
  frameRate(7);
  background(25, 25, 112);

  frameRate(8);
  background(25, 25, 112);
  stroke(255);
  fill(255);
  ellipse(a, b, 40, 40);
  ellipse(a-20, b+20, 40, 40);
  ellipse(a+25, b, 40, 40);
  ellipse(a, b+30, 40, 40);
  ellipse(a, b+10, 40, 40);
  ellipse(a+25, b+30, 40, 40);
  ellipse(a+50, b+15, 40, 40);
  a=a+5;

  stroke(25, 25, 112);
  fill(255);
  ellipse(x, y, 50, 50);
  fill(25, 25, 112);
  ellipse(x+10, y, 35, 35);
  x=x+5;
  changeY=changeY -.02;
  y=y-changeY;
  fill(0, 139, 0);
  smooth();
  quad(-10, 500, -5, 420, 510, 420, 510, 500);
  fill(139, 69, 0);
  stroke(139, 69, 0);
  rect(370, 220, 75, 210);
  stroke(0, 205, 0);
  fill(0, 205, 0);
  ellipse(380, 220, 60, 60);
  ellipse(370, 190, 60, 60);
  ellipse(400, 165, 60, 60);
  ellipse(430, 190, 60, 60);
  ellipse(415, 195, 60, 60);
  ellipse(425, 220, 60, 60);

  {
    if (x>250)
    {
      changeY=changeY+1;
      y=y+changeY;
    }
  }
}
void sun()
{ 
  frameRate(7);
  background(176, 226, 255);  
  frameRate(8);
  background(176, 226, 255);
  stroke(255);
  fill(255);
  ellipse(c, d, 40, 40);
  ellipse(c-20, d+20, 40, 40);
  ellipse(c+25, d, 40, 40);
  ellipse(c, d+30, 40, 40);
  ellipse(c, d+10, 40, 40);
  ellipse(c+25, d+30, 40, 40);
  ellipse(c+50, d+15, 40, 40);
  c=c+5;
  stroke(255, 255, 0);
  fill(255, 255, 0);
  ellipse(50, w, 80, 80);
  w=w-sunY;
  fill(0, 139, 0);
  stroke(0, 139, 0);
  smooth();
  quad(-10, 500, -5, 420, 510, 420, 510, 500);

  fill(139, 69, 0);
  stroke(139, 69, 0);
  rect(370, 220, 75, 210);
  stroke(0, 205, 0);
  fill(0, 205, 0);
  ellipse(380, 220, 60, 60);
  ellipse(370, 190, 60, 60);
  ellipse(400, 165, 60, 60);
  ellipse(430, 190, 60, 60);
  ellipse(415, 195, 60, 60);
  ellipse(425, 220, 60, 60);
  if (w<60)
  {
    sunY = 0;
  }
}
