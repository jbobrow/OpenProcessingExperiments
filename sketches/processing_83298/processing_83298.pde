
void setup()
{
  size(400,600);
  background(0,0,0);
  smooth();
  frameRate(5);
}
void draw()
{
  fill(0,0,0,75);
  rect(0,0,width,height);
  //noStroke();
  stroke(255,255,255);
  strokeWeight(5);
  //fill(255,0,0);
  //ellipse(mouseX,mouse Y,mouseX,mouseY);
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  fill(random(255),random(255),random(255));
  textAlign(CENTER);
  textSize(40);
  text("Happy Birthday",random(width),random(height));
}
