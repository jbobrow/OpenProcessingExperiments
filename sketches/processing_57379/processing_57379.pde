
class Wall//unused
{
  float k=10, x, y, pitch=0, xp, yp, vx, vy, w, h;
  int[] colour= {
    40, 50, 250, 200
  };
  Boolean visible=false;
  Wall(float ix, float iy, float iw, float ih)
  {
    x=ix;
    y=iy;
    w=iw;
    h=ih;
  }
}
class Collector//The thing that eats the balls
{
  float k=3, x, y, pitch=0, xp, yp, vx, vy, w, h, ax, ay, fx, fy;
  float diameter;

  Collector(float ix, float iy, float iw, float ih)
  {
    x=ix;
    y=iy;
    w=iw;
    h=ih;
  }
  void display()
  {
    fill(100, 100, 100);
    ellipse(x, y, w, h);
  }
}

class Fuel//unused
{
  float k=10, x, y, pitch=0, xp, yp, vx, vy, w, h, ax, ay;
  float energy=30;
  Boolean visible=false;
  Fuel(float ix, float iy, float iw, float ih)
  {
    x=ix;
    y=iy;
    w=iw;
    h=ih;
  }
}

class Ball { //Ball class

  float k=3, x, y, pitch=0, xp, yp, vx, vy, w, h, ax, ay, fx, fy;
  float diameter;
  float hyp;
  float f=0.03, mass;
  int id;
  Boolean exists=true;
  Ball[] others; //Adition object pointer
  Ball(float ix, float iy, float iw, int iid, Ball[] oin) {
    x = ix;
    y = iy;
    diameter = iw;
    id = iid;
    others = oin;
    mass=diameter/5;
  } 

  void collide()//collisions with other balls. I treat the balls as 2D springs.
  {
    if (exists==true)
    {
      for (int i = id + 1; i < ballCount; i++) 
      {
        if (others[i].exists==true)
        {
          float dx = others[i].x - x;
          float dy = others[i].y - y;
          float distance = dist(x, y, others[i].x, others[i].y);
          float minDist = others[i].diameter/2 + diameter/2;
          if (distance < minDist) 
          { 
            float angle = atan2(dy, dx);
            fx = (minDist-distance)*cos(angle)*k;//force vectors
            fy = (minDist-distance)*sin(angle)*k;
            ax = fx/mass;//acceleration vectors
            ay = fy/mass;//acceleration vectors
            vx =0.99*vx - ax;
            vy =0.99*vy - ay;
            others[i].vx =0.99*others[i].vx + fx/others[i].mass;//Newton's 3rd law
            others[i].vy =0.99*others[i].vy + fy/others[i].mass;
          }
        }
      }
    }
  }

  void move() //movement
  {
    vy += gravity;
    x += vx;
    y += vy;
    if (x + diameter/2 > width) {
      float temp=(x+diameter/2-width)*k/mass; 
      vx = 0.9*vx-temp;
    }
    else if (x - diameter/2 < 0) {
      float temp=(x-diameter/2)*k/mass; 
      vx = 0.9*vx-temp;
    }
    if (y + diameter/2 > height) {
      y = height - diameter/2;
      vy *= f;
    } 
    else if (y - diameter/2 < 0) {
      y = diameter/2;
      vy *= f;
    }
  }

  void display() //display
  {
    fill(51, 204, 255);
    ellipse(x, y, diameter, diameter);
  }
}


