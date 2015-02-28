
void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(5);
}

void draw()
{
  fill(0, 0, 0, 75);
  rect(0, 0, width, height); 

  stroke(255, 255, 255);
  strokeWeight(5);

  point (random(width), random(height));
  point (random(width), random(height));
  point (random(width), random(height));

  fill(255,255,255);
  textAlign(CENTER);
  textSize(40);
  text("Merry Christmas", random(width),random(height));
}
