

 
void setup() 
{
  size(640, 360); 
  noStroke();
  rectMode(CENTER);
}

void draw() 
{   
  background(60,126,168); 
  fill(16,17, 36);
  ellipse(mouseX, height/2, mouseY/2+10, mouseY/2+10);
  fill(162, 53, 63);
  int inverseX = width-mouseX;
  int inverseY = height-mouseY;
  rect(inverseX, height/2, (inverseY/2)+10, (inverseY/2)+10);
}

  
