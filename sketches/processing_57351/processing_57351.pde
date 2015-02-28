
//Heart
int x = 370;
int y = 263;
int radius = 13;

void setup()  {
  size(400, 400);
  noStroke();
  fill(250,35,68);
  ellipseMode(RADIUS);
}

void draw()   {
    float d = dist(mouseX, mouseY, x, y);
    if (d > radius) {
      radius++;
    } else {
      radius--;
    }
      ellipse(x, y, radius, radius);
}  


