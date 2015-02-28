
void setup()
{
  size(600,300);
  background(0,0,0);
  smooth();
  frameRate(7);
}

void draw()
{
  fill(0,0,0,75);
  rect(0,0, width, height);  
  stroke(255,255,255);
  strokeWeight(5);  
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  point(random(width),random(height));
  
  fill(255,255,0);
  textAlign(CENTER);
  textSize(40);
  text("Star Wars VII \n A long time ago \n in a galaxy far far away...", width/2, frameCount);
  
}
