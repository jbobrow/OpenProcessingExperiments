

void setup()
{
  size(450, 450);
  background(0, 0, 0);  
}

void draw()
{
  stroke(random(255), random(255), random(255));
  strokeWeight(2);
  if( mousePressed )
  { 
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

