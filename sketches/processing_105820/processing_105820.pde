
float y = 300.0;
float x = 20.0;
int j= 0;
void setup()
{
   
  size (300,300);
  smooth();
}
void draw()
{
   
  noStroke();
  background(0,0,255-x);
  fill(#FFE200);
  frameRate(10);
  ellipse(150,y,100,100);
   
  y -= 8;
  x += 5;
   
  if (y <= -100)
  {
      stroke(255);
      for (int i = 0; i <= j; i++)
      {
        strokeWeight(random(5));
        point(random(300),random(300));
      }
      if (j> 50)
        j=50;
      else
        j++;
  }
}
