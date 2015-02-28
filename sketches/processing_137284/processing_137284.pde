
final int NB_CIRCLES = 200;
final float FIRST_DIAMETER = 8;
final float CIRCLE_GROWTH  = .6;
final float FRICTION       = .625;
myPVector[] circles = new myPVector[NB_CIRCLES];

void setup()
{
  size(400, 400, P3D);
  noStroke();
  for (int i = 0; i < NB_CIRCLES; i++)
  {
    circles[i] = new myPVector(width/2, height/2, FIRST_DIAMETER * CIRCLE_GROWTH * (i+1), i%2 == 0 ? #6B035B : #eb009e);
  }
}

void draw()
{
  background(#6B035B);
smooth();
  circles[0].x = mouseX;
  circles[0].y = mouseY;

  for (int i = 1; i < NB_CIRCLES; i++)
  {
    float deltaX = circles[i].x - circles[i-1].x;
    float deltaY = circles[i].y - circles[i-1].y;

    circles[i].x -= deltaX * FRICTION;
    circles[i].y -= deltaY * FRICTION;
  }

  for (int i = 0; i < NB_CIRCLES; i++)
  {
    fill(circles[i].col);
    ellipse(circles[i].x, circles[i].y, circles[i].radius, circles[i].radius);
  }
}


class myPVector extends PVector
{
  float radius;
  color col;
  myPVector(float p_x, float p_y, float p_radius, color p_color)
  {
    super(p_x, p_y);
    radius = p_radius;
    col = p_color;
  }
}
