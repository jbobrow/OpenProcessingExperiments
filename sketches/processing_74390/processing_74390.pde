
color savedColor;
float savedX1;
float savedY1;
float savedX2;
float savedY2;

void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(10);

}

void draw()
{
  savedColor = color( random(255), random(255), random(255));
  savedX1 = random(width);
  savedY1 = random(height);
  savedX2 = random(width);
  savedY2 = random(height);
  stroke(savedColor);
  fill(savedColor);
  strokeWeight(2);
  line(savedX1, savedY1, savedX2, savedY2);
  ellipse(savedX1, savedY1, 10, 10);
  ellipse(savedX2, savedY2, 10, 10);
}





