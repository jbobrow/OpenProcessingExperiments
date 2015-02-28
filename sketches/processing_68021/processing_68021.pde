
void setup()
{
  size(500,380);
  noFill();
  smooth();
  
}

void draw()
{
  float x= int(random(25, 350));
  float y= int(random(15,250));
  
  background(255,255,255);
  
  stroke(0,0,255);
  strokeWeight(5);
  ellipse(40,50,40,40);
  
  
  stroke(0,0,0);
  strokeWeight(5);
  ellipse(90, 50, 40, 40);
  
  
  stroke(255,0,0);
  strokeWeight(5);
  if((x!= 140) && (y!=50))
  {
  ellipse(x, y, 40, 40);
  }
    else
    {
      ellipse(140, 50, 40, 40);
    }
  
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(65, 70, 40, 40);
  
  stroke(0,255,0);
  strokeWeight(5);
  ellipse(115, 70, 40, 40);
}


