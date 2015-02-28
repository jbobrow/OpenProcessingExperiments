
// Wendy Chuyi Liu, Gold Fish, Mods 16/17
// http://besttoshow.webs.com/

int diameter = 0;
int diameter2 = 100;
int diameter3 = 200;
int diameter4 = 300;
int diameter5 = 400;
int y = 0;
void setup()
{
  size(400,400);
  background(111,172,211);
  fill(255,255,0);
  stroke(255,255,0);
  ellipse (0,0,225,225);
}
void draw()
{
  fill(111,172,211,15);
  stroke(255,255,255,20);
  ellipse(200,300, diameter, 25);
  diameter = diameter + 1;
  if (diameter > 400)
  {
    diameter = 0;
  }
  ellipse (200,300,diameter2,25);
  diameter2 = diameter2 +1;
  if(diameter2 > 400)
  {
    diameter2 = 0;
  }
  ellipse (200,300,diameter3,25);
  diameter3 = diameter3 + 1;
  if (diameter3 > 400)
  {
    diameter3 = 0;
  }
  ellipse(200,300,diameter4,25);
  diameter4 = diameter4 + 1;
  if(diameter4 > 400)
  {
    diameter = 0;
  }
  ellipse(200,300,diameter5,25);
  diameter5 = diameter5 + 1;
  if (diameter5 > 400)
  {
    diameter5 = 0;
  }
  
  //water dropping
  
  fill( 112,198,188);
  stroke(225,225,225);
  ellipse (200,y,25,40);
  y = y + 15;


  if( y > 280)
  {
    y = 25;
  }
}
