
void setup()
{
  size(640, 400);
  background(255, 255, 255); 
  smooth();
  strokeWeight(5);
  image( loadImage("soccer.jpg"), 0, 0, width, height);
  
}

void draw()
{

}
void mousePressed()
{
//  fill((255), (255), (255));
  ellipse(mouseX, mouseY, 30, 30);
}

void keyPressed()
{
  fill (random(255), random(255), random(255));
//  ellipse(mouseX, mouseY, 50, 50);
}

