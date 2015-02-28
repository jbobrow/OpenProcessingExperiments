
void setup()
{
  size(400, 600) ;
  background(255, 255, 255) ;
  smooth() ;
  frameRate(60) ;

  fill(255) ;
  rect(50, 160, 300, 400) ;
  fill(255, 0, 0) ;
  triangle(20, 160, 380, 160, 200, 10) ;
  fill(0, 0, 255) ;
  rect(150, 360, 100, 200) ;
  fill(0) ;
  ellipse(235, 490, 20, 20) ;
  fill(100, 150, 180) ;
  quad(300, 92, 300, 25, 350, 25, 350, 135) ;
}

void draw()
{
  if (key == ' ')
  {
    fill(224,54,7);
    ellipse(random(width),random(height), 50,50);
  }
}
