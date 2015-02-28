
void setup()
{
  size(400,600);
  background(255,255,255);
  smooth();
  frameRate(20);
}
void draw()

{
  line(0,0, mouseX, mouseY);
  fill(255,0,0);
  stroke(255,0,255,50);
  rect(random(300),random(400),random(width),random(height));
  fill(0,255,255,100);
ellipse(random(300),random(400),random(width),random(height));
strokeWeight(random(20));
triangle(random(width),random(height),random(width),random(height),random(width),random(height));
ellipse(0,0,pmouseX,pmouseY);
fill(random(255),random(255),random(0));
fill(random(255),random(255),random(255));
rect(random(300),random(200),random(width),random(height));

}
