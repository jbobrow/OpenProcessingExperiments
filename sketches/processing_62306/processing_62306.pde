

void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}
 
void draw()
{
  fill(255,255,255,50);
  rect(0,0,width,height);
  fill(random(255),random(255),random(255),155);
  ellipse(height/2,width/2, mouseX, mouseY);
} 



