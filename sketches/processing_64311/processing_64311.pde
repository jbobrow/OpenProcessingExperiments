
float x_value;

void setup()
{
  size(400,200);
  background(0);
  stroke(255);
  frameRate(2);
  noFill();
}

void draw()
{
  noFill();
  x_value = (x_value+61) % 400;
  rect(x_value, 100, 50, 50);
  fill(0,50);
  rect(0,0,width,height);
}



