
 
color Color = color(random(255),random(255),random(255));
float x = 200;
float y = 400;
float xx = 100;
float yy = 200;

 
void setup() 
{
  size(400, 400);
 
}
 
void draw() 
{
  background(0);
  pushMatrix();
  fill(Color);
  rect(x,y,xx,yy);
  rectMode(CENTER);
  noStroke();
  grow();
  popMatrix();
}

 
void grow()
{
  if (mouseButton == RIGHT) 
  {
      
      y = y-3;
      
      yy = yy-3;
  }
  if (mouseButton == LEFT)
  {
    y = y +3;
    yy = yy+3;
  }
  if(y < 0 || y > 400)
  {
    background(random(255), random(255), random(255));
  }
}
 

 
 



