
void setup ()
{
  size (500,500);
  smooth();
  background(0);
  noStroke();
}
void draw()
{
    translate(width/2,height/2);
  for (int i=0;i<360;i+=30)
  {
    rotate(radians(20));
    fill(255,50);
    ellipse(0,0,50,200);
    
    ellipse(0,0,80,350);
    
    ellipse(0,0,100,500);
  }
  noLoop();
}

