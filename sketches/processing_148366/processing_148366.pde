
void setup()
{
  size(600,400);
  background(91,109,205); 
  fill(random(255),random(255),random(255));
}

void draw()
{
  triangle(mouseX,mouseY,  random(100),random(100), 0,0);
  frameRate(100);
}  
void mousePressed()
{
  background(random(255),random(255),random(255));  
}
void keyPressed()
{
 fill(random(255),random(255),random(255));
}

