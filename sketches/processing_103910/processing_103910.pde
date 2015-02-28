
float x, y;
color col = color(0, 255, 255);
float speed = 0;
float gravity = .5;

 
 
void setup () 
{
  size(750, 750);
  x = width/2;
  y = height/2;//random(0, height);
}
 
void draw() 
{
  background(0);
 
  ellipseMode(CENTER);
  fill(col);
  ellipse(x, y, 100,100);
  speed = speed + gravity;
  y = y + speed;
  
 
  if (y > height-50) 
  {
    speed = speed * -1;
    y=height-51;
    col = color(random(255), random(255), random(255));
  }
}


