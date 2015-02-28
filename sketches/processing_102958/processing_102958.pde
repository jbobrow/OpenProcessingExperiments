
void setup()
{
  size(300,300);
  background(#04B1CE);
  noFill();
}

void draw()
{
  strokeWeight(random(3,10));
  stroke(random(758),random(757),random(759));
  float rainbow_size = random(195, 765);
  ellipse(150,300,rainbow_size,rainbow_size);
}
