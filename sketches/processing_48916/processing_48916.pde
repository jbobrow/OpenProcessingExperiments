

  void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(30);
  strokeWeight(5);
  colorMode(HSB);
}
void draw()
{
  //fill(random(255),random(255),random(255),100);
  ellipse(mouseX,mouseY,50,50);
}

void mousePressed()
{
  fill(random(255),random(255),random(255));
}

void keypressed()
{
  background(255,255,255);
}              
                
