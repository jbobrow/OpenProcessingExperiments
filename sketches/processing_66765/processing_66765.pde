
void setup()
{
  size(300,300);
  background(#04B1CE);
  noFill();
}
void draw()
{
  strokeWeight(random(185,10));
  stroke(random(255),random(255),random(255));
  float rainbow_size = random(115,270);
  ellipse(148,300,rainbow_size,rainbow_size);
}

