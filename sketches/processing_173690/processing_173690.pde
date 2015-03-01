
float counter = 0;

void setup()
{
  size(500, 500);
}

void draw()
{
  //println
  background(0);
  colorMode(HSB, 180, 60, 100);

  if (mousePressed == true)
  {
    background(110);
    translate(width/2, height/2);
    ellipse(0, sin (counter)*100, 70, 70);
    translate(-10, -10);
    ellipse(0, sin(counter)*100, 10, 10);
    translate(20, 0);
    ellipse(0, sin(counter)*100, 10, 10);
    float amplitude = map(sin(counter), -1, 1, 50, 50);
    fill(30, 50, 100);

    counter += 0.5;
  } else
  {
    translate(width/2, height/2);
    ellipse(0, sin (counter)*100, 70, 70);
    translate( -10, 10);
    ellipse (0, sin(counter)*100, 10, 10);
    translate(20, 0);
    ellipse(0, sin(counter)*100, 10, 10);
    float amplitude = map(sin(counter), -1, 1, 50, 50);
    fill(110);

    counter += 0.05;
  }
}

