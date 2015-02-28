
void setup()
{
  size(600, 600) ;
  background(245, 35, 222) ;
  smooth();
  frameRate(10) ;
  
}

void draw()
{
  stroke(34, random(200), 65) ;
  strokeWeight( random(12)) ;
  fill(random(255), 0, 0, 50) ;
  
  ellipse(mouseX, mouseY, mouseX, mouseY) ;
  line(0, 0, mouseX, mouseY) ;
  
}



