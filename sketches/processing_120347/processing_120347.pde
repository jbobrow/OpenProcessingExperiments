
float counter = 0;

void setup()
{
  size(400, 400);
}

void draw()
{
  background(200);

  translate(width/2, height/2);

  pushMatrix();
  translate(0, sin(counter)*100);
  ellipse(0, 0, 40, 40);
  popMatrix();

  counter += 0.05;
}

