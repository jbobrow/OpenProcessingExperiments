
//variables
float distance=100;
float radius=3;
float rotation=1;

void setup()
{
  size(600, 600);
  background(0);
  frameRate(60);
}
void mousePressed()
{
  if (mouseButton==LEFT)
  {
    distance=distance+10;
  }
  else
  {
    distance=distance-10;
  }
}

void draw()
{
  fill(0, 0, 0, 10);
  rectMode(CENTER);
  rect(300, 300, 600, 600);
  fill(random(255), random(255), random(255));
  translate(mouseX, mouseY);
  rotate(5-radius);
  ellipse(distance, 0, 50, 50);
  //aditions
  distance=distance-.1;
  rotation=rotation+.01;
  radius=radius+10;
}
