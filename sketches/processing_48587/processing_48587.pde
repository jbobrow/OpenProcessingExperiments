
float x = random(0,500);
float y = random(0,500);
float speedX =random(10);
float speedY= random(10);

void setup()
{
  size(500, 500);
}
void draw()
{
  background(0, 0, 0);
  ellipse(x, y, 10, 10);

  x = x +speedX;
  y = y +speedY;
  
  if(x<=5||x>=495){speedX= -speedX;}
  if(y<=5||y>=495){speedY= -speedY;}
}


