
void setup()
{
  size (500,500);
  smooth();
  background(0);
  noFill();
}
void draw ()
{
    translate(width/2,height/2);
  for (int i=0;i<360;i+=30)
  {
    rotate(radians(30));
    strokeWeight(50);
    stroke(255,50);
arc(50, 50, 90, 90, 0, PI);  
arc(150,150, 350, 350, HALF_PI, PI+HALF_PI);
      }
      noLoop();
}

