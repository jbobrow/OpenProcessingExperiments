
void setup()
{
  size(300,300);
  background(#20FA00);
  noFill();
}

void draw()
{
  strokeWeight(random(4,10));
  stroke(random(225),random(225),random(255));
  float rainbow_size=random(100,170);
  ellipse(150,300,rainbow_size,rainbow_size);
  ellipse(150,0,rainbow_size,rainbow_size);
}


