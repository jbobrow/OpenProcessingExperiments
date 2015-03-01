
void setup()
{
  size(500,500);
  background(0);
  stroke(255,1);
  smooth();
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  
  float zeit1 = map(millis()/2,0,59,0,2*PI);
  
  for (int i = 0;i < 360;i += 6) 
  {
    pushMatrix();
    rotate(radians(i));
    rotate(zeit1);
    translate(0,i);
    fill(random(0),random(255),(255),5);
    scale(frameCount/2);
    ellipse(0,0,10,10);
    popMatrix();
  }

  if( frameCount > 150)
  {
     frameCount = 0;
  }  
}
