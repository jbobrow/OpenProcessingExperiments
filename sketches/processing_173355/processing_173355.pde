
class star
{
  
  int x, y, z;
  color c;
  float size;
  float theta;

  star()
  {
    x = (int) random(0, 1000);
    y = (int) random(0, 1000);
    z = (int) random(0, -10000);
    c = color(random(255), random(255), random(255));
    size = random(1, 3);
    theta = random(-PI/2, PI/2);
  }

  void render()
  {
    stroke(c);
    strokeWeight(size);
    point(x, y, z);
  }

  void move()
  {
    rotateZ(radians(theta));
    x *= sin(radians(theta));
    y *= cos(radians(theta));
    z *= 0.99;
  }
}

star[] stars;
int MAX_STARS = 10000;

void setup()
{
  size(600,600,P3D);

  stars = new star[MAX_STARS];
  for(int i = 0; i<MAX_STARS; ++i)
  {
    stars[i] = new star();
  }
}

void draw()
{
  background(0);
  for(int i=0;i<MAX_STARS; ++i)
  {
    stars[i].render();
    if (mousePressed) stars[i].move();
    else background(0);
  }
}

