
int parts=50;
Integrator[] x,y;

void setup()
{
  size(600,400,P2D);
  colorMode(HSB);
  smooth();
  strokeWeight(2);
  stroke(0);
  cursor(CROSS);
  background(0);
  x = new Integrator[parts];
  y = new Integrator[parts];
  for (int n=0; n<parts; n++)
  {
    float a = random(0.9,0.95);
    float b = random(0.8,0.9);
    x[n] = new Integrator(random(width),a,b);
    y[n] = new Integrator(random(height),a,b);
  }
}

void draw()
{
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  for (int n=0;n<parts;n++)
  {
    float oldx = x[n].value;
    float oldy = y[n].value;
    x[n].update();
    y[n].update();
    stroke(n,255,255);
    line(oldx,oldy,x[n].value,y[n].value);
  }
  //filter(BLUR,2);
}

void mouseMoved()
{
  for (int n=0;n<parts;n++)
  {
    x[n].target(mouseX);
    y[n].target(mouseY);
  }
}

class Integrator
{

  final float DAMPING = 0.4f;
  final float ATTRACTION = 0.15f;

  float value;
  float vel;
  float accel;
  float force;
  float mass = 1;

  float damping = DAMPING;
  float attraction = ATTRACTION;
  boolean targeting;
  float target;


  Integrator()
  {
  }


  Integrator(float value)
  {
    this.value = value;
  }


  Integrator(float value, float damping, float attraction)
  {
    this.value = value;
    this.damping = damping;
    this.attraction = attraction;
  }


  void set(float v)
  {
    value = v;
  }


  void update()
  {
    if (targeting)
    {
      force += attraction * (target - value);
    }

    accel = force / mass;
    vel = (vel + accel) * damping;
    value += vel;
    force = 0;
  }


  void target(float t)
  {
    targeting = true;
    if (t>0)
      target = t;
    else target = 0;
  }


  void noTarget()
  {
    targeting = false;
  }
}

