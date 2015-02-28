
float row;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}

void draw()
{
  row = random(height);

  stroke( random(255), random(255), random(255) );

  line(0, row, width, row);
}
