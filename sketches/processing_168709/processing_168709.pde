
void setup()
{
  size(500,500);
  background(255);
  fill(0);
  noStroke();
  translate(250,250);
  
}

void draw()
{
  translate(width/2, height/2);
  
  rotate(radians(second())*100.0);
  ellipseMode(CENTER);
  ellipse(50,50,100,5);
  ellipse(40,50,100,5);
  ellipse(30,50,100,5);
  ellipse(30,40,90,5);
  
}
  
  

  
