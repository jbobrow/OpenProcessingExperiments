
void setup()
{
  size(300, 300);
  background(0);
  smooth();
  frameRate(60);
}

float angle;

void draw()
{
  background(0);
  translate(width/2, height/2);
  rectMode(CENTER);
  fill(255);
  for (int i = 255; i >10; i-=10)
  {
    rotate(radians(angle)/PI);
    strokeWeight(0.1);
    stroke(0);
    fill(i, 25);
    rect(0, 0, i, i);
  }
  angle += 1;
}

void keyPressed()
{
  save("file.png");
}
