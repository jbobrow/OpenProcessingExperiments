
float x;
float y;
float xspeed;
float yspeed;


void setup(){

smooth();  
size(600, 600);
x = 50.0;
xspeed = 313.0;

y = 50.0;
yspeed = 33.0;

}

void draw()
{
  
  background(0);
  x = x + xspeed;
  
  if( (x >= width-50) || (x <= 50) )
  {
    xspeed = xspeed * -1;
  }
  
  ellipse(x, height/2, 100,100);

  y = y + yspeed;
  
  if( (y >= height-50) || (y <= 50) )
  {
    yspeed = yspeed * -1;
  }
  
  ellipse(x + 13, y, 100,100);
  
}

