
void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
  background(0);
  translate(mouseX,mouseY);
  
  pushMatrix();
  float my_angle = map(millis()/5, 0, width, 0, -2*PI);

  for(int i = 0; i < width; i = i + 20) 
  {
    fill(mouseY,mouseY,mouseY);
    rotate(my_angle);
    stroke(255);
    rectMode(CENTER);
    
    if(i>10) 
    {
      rect(i,0,10,10); 
    }
    else 
    {
     rect(i,0,10,10);  
    }
  }
  popMatrix();
}
