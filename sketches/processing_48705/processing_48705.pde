
class Snowflake
{
  float x; float y;
  float dx; float dy;
}

ArrayList snowflakes = new ArrayList();

void setup()
{
  size(800, 600);
}

void draw()
{
  background(0, 0, 0);
  // draw all snowflakes
  for (int i = 0; i < snowflakes.size(); i++)
  {
    Snowflake sf = (Snowflake) snowflakes.get(i);
    ellipse(sf.x, sf.y, 10, 10);
    // move all snowflakes
    sf.x += sf.dx;
    sf.y += sf.dy;
    println(sf.x + ", " + sf.y + "(" + i + ")");
    // delete all snowflakes out of bounds
    if (sf.x < 0) {
      snowflakes.remove(i);
      i--;
    }
  }
  
  // randomly generate a snowflake using a (not poisson) distribution
  if ((int) random(20) == 0)
  {
    // find a starting position
    float start = random(width + height);
    Snowflake sf = new Snowflake();
    if (start <= width) {
      sf.x = start;
      sf.y = 0;
    } else {
      sf.x = width;
      sf.y = start - width;
    }
    sf.dx = -1;
    sf.dy = 1;
    snowflakes.add(sf);
  }
  
}

