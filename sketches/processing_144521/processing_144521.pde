
float index = 0.0;

void setup()
{
  size(600, 600);
}

void draw()
{
  background(0, 0, 0, 5);
  noStroke();
  colorMode(HSB, 360, 100, 100, 5);


  float h = map(sin(index), -1, 1, 185, 245);
  background(h, 90, 35, 5);

  index += 0.003;

  translate(0, height/2);

  for (int i=35; i<575; i+=20)
  {
    fill(150, 70, 85);
    ellipse(i, sin(index+i)*125, 15, 15);
  }

  pushMatrix();

  if (mousePressed == true)
  {

    for (int i=35; i<575; i+=20)
    {
      fill(random(50, 150), 70, random(85));
      ellipse(i, sin(index+i)*125, 15, 15);
    }
    index += 0.1;
  }
  else
  {
    index += 0.01;
  }

  popMatrix();
}

