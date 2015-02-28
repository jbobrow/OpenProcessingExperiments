
//variables
float y=5;
float c=200;

//background
void setup()
{
  size(250, 250);
  smooth();
  background(0);
}

//line animation
void draw()
{
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  stroke(random(c), random(c), random(c));
  strokeWeight(.25);
  line(0, 0, y, 100);
  line(250, 250, 100, y);
  line(y, y, y, 100);
  strokeWeight(1);
  line(-y, -y, y, 100);
  strokeWeight(.5);
  line(100, y, y, y);
  strokeWeight(.25);
  line(100, y, -y, -y);
  y+=5;
  if (y>height*1.5) {
    y=-height*1.5;
  }
}

