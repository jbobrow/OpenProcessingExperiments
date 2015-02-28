

float x;
float y;
int offset = 10;
float max_distance;

void setup()
{
  size(480,240);
  smooth();
  x = width/2;
  y = height/2;
    max_distance = dist(0, 0, width, height);
  frameRate(60);
  
}
void draw()
{
  background(200);
  if (mouseX > x)
  {
    x += 1;
    offset = -10;
  }
  if (mouseY > y)
  {
    y += 1;
    offset = -10;
  }
  if(mouseX < x)
  {
   x -= 1;
   offset = 10;
  }
    if (mouseY < y)
  {
    y -= 1;
    offset = 10;
  }
   noStroke();
    for(int i = 0; i <= width; i += 20) {
    for(int j = 0; j <= height; j += 20) {
      float size = dist(mouseX, mouseY, i, j);
      size = size/max_distance * 66;
      fill(255);
      ellipse(i, j, size, size);
    }
    }
    fill(0);
  rectMode(CENTER);
  stroke(150);
  strokeWeight(3);
  fill(50);
  rect(mouseX, mouseY, 15, 15);
  noStroke();
  fill(0);
  ellipse(x, y, 10, 10);
}

