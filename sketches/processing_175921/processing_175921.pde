
float x=0;
float y=0;
float w,h;

void setup() 
{
  size(500, 500);
  noStroke();
 x = random(width);
 y = random(height);
 w = random(50,500);
 h = random(50,500);
}
 
void draw() 
{
  int count = 0;
  x = x+5;
  y = y+5;
  if(x>width )
  {
    w = random(50,500);
    x = -w;
  }
  if(y>height )
  {
    h = random(50,500);
   y = -h; 
    
  }
  background(0);
  //pushMatrix();
  //translate(width/2, height/2);
  rect(y, x, h, w, 7);
  //popMatrix();
  if(x<width )
  {
    w = random(50,500);
    x = w;
  }
  if(y<height )
  {
    h = random(50,500);
   y = h; 
    
  }
  triangle(x, y, w, h, 86, 75);
}
 

