
void setup ()
{
  size (500,500);
  smooth();
  background(0);
  noFill();
}
void draw()
{
    translate(width/2,height/2);
  for (int i=0;i<360;i+=30)
  {
    rotate(radians(20));
    stroke(255);
    ellipse(0,0,50,200);
    
    ellipse(0,0,80,350);
    
    ellipse(0,0,100,500);
  }
}

