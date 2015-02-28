
// Implementation of a simplified 2d rigid body,
// written by Jakob Thomsen

// Click and drag to manipulate object

// position [-1,+1] -> [0, width]
float toScrX(float x)
{
  return float(width) * (x + 1.0) / 2.0;
}

// position [-1,+1] -> [0, height]
float toScrY(float y)
{
  return float(height) * (y + 1.0) / 2.0;
}

// scale
float toScrSX(float vx)
{
  return float(width) * vx / 2.0;
}

// scale
float toScrSY(float vy)
{
  return float(height) * vy / 2.0;
}

// pixel coordinates to normalized device coordinates
float byScrX(float x)
{
  return 2.0 * x / float(width) - 1.0;
}

// pixel coordinates to normalized device coordinates
float byScrY(float y)
{
  return 2.0 * y / float(height) - 1.0;
}

class obj2d
{
  // mass
  float m = 1;
  // center
  float x = 0;
  float y = 0;
  // linear velocity
  float vx = 0;
  float vy = 0;
  // orientation
  float orientation = 0;
  // angular velocity
  float angvel = 0;
  // inertia(tensor)
  float I = 1;
  
  obj2d()
  {
  }
  
  void update(float dt)
  {
    x += vx * dt;
    y += vy * dt;
    
    orientation += angvel * dt;
    
    if(x < -1.0)
    {
      x += 2.0;
    }

    if(x > 1.0)
    {
      x -= 2.0;
    }

    if(y < -1.0)
    {
      y += 2.0;
    }

    if(y > 1.0)
    {
      y -= 2.0;
    }
  }
  
  void display()
  {
    float d = 0.1;
    float c = cos(orientation * 2.0 * PI);
    float s = sin(orientation * 2.0 * PI);
    float x0 = x + d * c;
    float y0 = y + d * s;
    float x1 = x + d * s;
    float y1 = y - d * c;
    float x2 = x - d * c;
    float y2 = y - d * s;
    float x3 = x - d * s;
    float y3 = y + d * c;

    // quad(toScrX(x0), toScrY(y0), toScrX(x1), toScrY(y1), toScrX(x2), toScrY(y2), toScrX(x3), toScrY(y3));   
    line(toScrX(x0), toScrY(y0), toScrX(x2), toScrY(y2));
    line(toScrX(x1), toScrY(y1), toScrX(x3), toScrY(y3));
  }
}

obj2d o;

void setup()
{
  size(512, 512);
  colorMode(RGB, 1);
  o = new obj2d();
}

void draw()
{
  background(0);
  float dt = 1.0 / frameRate;
  o.update(dt);
  stroke(1);
  strokeWeight(5);
  o.display();
  
  if(mousePressed)
  {
    if(mouseButton == LEFT)
    {
      if(mouseX != pmouseX || mouseY != pmouseY)
      {
        float x0 = byScrX(pmouseX);
        float y0 = byScrY(pmouseY);
        float x1 = byScrX(mouseX);
        float y1 = byScrY(mouseY);
        float dx = x1 - x0;
        float dy = y1 - y0;
        // point(toScrX(x), toScrY(y));
        line(toScrX(x0), toScrY(y0), toScrX(x1), toScrY(y1));
        
        // vector from object center to grab-point
        float gx = x1 - o.x;
        float gy = y1 - o.y;
        
        // force
        float F = 100.0;
        float Fx = dx * F;
        float Fy = dy * F;
        
        float torque = (-gy * Fx + gx * Fy);
        
        // angular acceleration
        float aa = torque / o.I;
  
        o.angvel += aa * dt;
        
        // linear acceleration
        float ax = Fx / o.m;
        float ay = Fy / o.m;
        
        o.vx += ax * dt;
        o.vy += ay * dt;
      }
    }
    
    if(mouseButton == RIGHT)
    {
      o.x = 0.0;
      o.y = 0.0;
      o.vx = 0.0;
      o.vy = 0.0;
      o.orientation = 0.0;
      o.angvel = 0.0;
    }
  }
}
