
float time = 0.0;

void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  float xoff = time;
  noStroke();
  float n = noise(xoff)*height;

  fill(0,10);
  rect(0, 0, width, height);

  fill(255, 0, 0);
  rect(100, height, 50, -n);
  fill(0, 255, 0);
  rect(200, height, 50, -n);
  fill(0, 0, 255);
  rect(300, height, 50, -n);

  time+=0.01;

}
