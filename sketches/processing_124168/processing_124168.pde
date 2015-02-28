
void setup()
{
  size(400,400);
  background(0,0,0);
}

void draw()
{
  noStroke();
  fill(255,255,255);
  ellipse(100,100,40,40);
  triangle(100,100, 200,400, 800,400);
  image(loadImage("manger image.jpeg"),300,300,100,100);
}



