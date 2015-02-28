
class Circle {
  float x;
  float y;
  float r;
  float label;

  Circle(float _x, float _y, float _r, String _label)
  {
    this.x = _x;
    this.y = _y;
    this.r = _r;
    this.label = label;
  }

  float distance(float _x1, float _y1, float _x2, float _y2)
  {
    return sqrt((_x1-_x2)*(_x1-_x2)+(_y1-_y2)*(_y1-_y2));
  }

  float getOffset(float _x, float _y)
  {
    return distance(this.x, this.y, _x, _y);
  }

  boolean contains(float _x, float _y)
  {
    return distance(this.x, this.y, _x, _y) <= this.r;
  }

  boolean intersect(Circle _circle)
  {
    float d = distance(this.x, this.y, _circle.x, _circle.y);
    return d <= (this.r + _circle.r);
  }

  void draw()
  {
    ellipse(x, y, r*2, r*2);
  }
}


//circle packing

class CirclePacking {

  float width, height, padding, xcenter, ycenter;
  ArrayList circles;
  float damping, iterations;

  CirclePacking(float _width, float _height)
  {
    width = _width;
    height = _height;
    xcenter = width/2;
    ycenter = height/2;
    circles = new ArrayList();
    padding = 20;
    damping = 0.01;
    iterations = 1;
  }

  float fast_distance(float _x1, float _y1, float _x2, float _y2)
  {
    return (_x1 - _x2) * (_x1 - _x2) + (_y1 - _y2) * (_y1 - _y2);
  }

  void pack()
  {

    for (int i = 0; i < circles.size(); i++)
    {
      Circle c1 = (Circle) circles.get(i);

      for (int j = i+1; j < circles.size(); j++)
      {
        Circle c2 = (Circle) circles.get(j);

        float d = fast_distance(c1.x, c1.y, c2.x, c2.y);
        float r = c1.r + c2.r + padding;

        if (d < (r*r))
        {
          float dx = c2.x - c1.x;
          float dy = c2.y - c1.y;
          float droot = sqrt(d);

          // proviamo a dare un peso rispetto al centro
          float cd1 = fast_distance(c1.x, c1.y, xcenter, ycenter);
          float cd2 = fast_distance(c1.x, c1.y, xcenter, ycenter);

          float total = dx + dy;

          float vx = (dx/droot) * (r-droot);
          float vy = (dy/droot) * (r-droot);

          c1.x -= vx * cd1/(cd1+cd2);
          c1.y -= vy * cd1/(cd1+cd2);
          c2.x += vx * cd2/(cd1+cd2);
          c2.y += vy * cd2/(cd1+cd2);
        }
      }
    }

    // contraction...
    //
    for (int i = 0; i < circles.size(); i++)
    {
      Circle c = (Circle) circles.get(i);
      float vx = (c.x - xcenter) * damping;
      float vy = (c.y - ycenter) * damping;
      c.x -= vx;
      c.y -= vy;
    }
    //
  }

  void update() {
    for (int w=0; w<iterations; w++)
    {
      this.pack();
    }
  }
  /**
   * Draw all the circles
   */

  void draw()
  {
    for (int i = 0; i < circles.size(); i++)
    {
      Circle c = (Circle) circles.get(i);
      if (c.r < 1)
      {
        circles.remove(c);
      }
      else
      {
        c.draw();
      }
    }
  }
}

