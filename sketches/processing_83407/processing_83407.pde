
int counter = 1;

void setup()
{
  size(400, 600);
  background(0, 0, 0);
  smooth();
  frameRate(5);
}

void draw()
{
  if (counter > 0)
  {
    fill(0, 0, 0,175);
  }
    if (counter < 0)
  {
    fill(255, 255, 255, 75);
  }
  rect(0, 0, width, height);
  fill(255, 255, 0);
  stroke(255, 255, 0);
  strokeWeight(5);
  point(random(width), random(height));
  ellipse(random(width), random(height), 25, 25);
  fill(0, 255, 0);
  stroke(0, 255, 0);
  strokeWeight(5);
  point(random(width), random(height));
  ellipse(random(width), random(height), 25, 25);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  strokeWeight(5);
  point(random(width), random(height));
  ellipse(random(width), random(height), 25, 25);
  fill(0, 0, 255);
  stroke(0, 0, 255);
  strokeWeight(5);
  point(random(width), random(height));
  ellipse(random(width), random(height), 25, 25);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  strokeWeight(5);
  ellipse(mouseX, mouseY, 15, 15);
  
  counter *= -1;
}


