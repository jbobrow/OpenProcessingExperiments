
PVector window;
final float MARGIN = 100;
PVector rootn;
final float xstep = 4;
final float ystep = 3;

void setup()
{
  size(400, 400, P2D);
  window = new PVector(0, 0);
  mousePressed();
  noFill();
}

void draw()
{
  background(220);
  float dx = map(mouseX, 0, width, -5, 5);
  float dy = map(mouseY, 0, height, 5, -5);
  if (abs(dx) < .3) dx = 0;
  if (abs(dy) < .3) dy = 0;
  window.sub(new PVector(dx, dy));
  rootn.add(new PVector(.019*dx, .02*dy));
  for (int j = 0; j < height; j += ystep)
  {
    beginShape();//QUAD LINES
    for (int i = 0; i < width; i += xstep)
    {
      float n = noise(rootn.x + .019*i, rootn.y + .02*j);///ystep);
      float tmpy = MARGIN * (n - 1) + j;
      stroke(map(n, 0, .6, 0, 155));
      vertex(i, height - tmpy);
    }
    endShape();
  }
}

void mousePressed()
{
  rootn = new PVector(random(123456), random(123456));
}

