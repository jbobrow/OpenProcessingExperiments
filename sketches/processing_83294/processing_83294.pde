
void setup()
{
  size(400,600);
 // background(255);
  smooth();
  
}
void draw()
{
  stroke(255,255,255);
  strokeWeight(5);
  //ellipse(mouseX, mouse Y, mouseX, mouseY);
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));

fill(255,255,255);
textAlign(CENTER);
  textSize(40);
  fill(random(255), random(255), random(255));
  text("Merry Christmas",random(width),random(height));
}
