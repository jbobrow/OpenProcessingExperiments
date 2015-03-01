
void setup()
{
  size(600,600);
  background(255);
}

void draw()
{
  if (mousePressed) {
    background(random(0,255),random(0,255),random(0,255));
  } else {
    background(255);
  }
}


