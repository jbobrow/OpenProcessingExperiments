
float x = 50;

void setup() {
  size(1000, 800);
  background(255);
  smooth();
  frameRate(1000);
  noStroke();
}
void draw()
{

  ellipse(mouseX,mouseY,random(x),random(x));
}
 
void mousePressed()
{
  fill(random(150),random(150),random(150), random(50));
}


