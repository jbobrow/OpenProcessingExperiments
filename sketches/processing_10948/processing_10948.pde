
int i = 0;
Integrator[] x;

void setup()
{
  size(200,200,P2D);
  colorMode(HSB,int(width*.9));
  background(0);
  smooth();
  x = new Integrator[3];
  for (int ii=0;ii<3;ii++)
  {
    x[ii] = new Integrator(random(width*.9),0.3,0.1);
  }
}

void draw() {
  for (int ii=0;ii<3;ii++)
  {
    x[ii].update();
  }
  if (frameCount%2==0)
  {
    x[i].target (random(width*.9));
    i = (i+1)%3;
  }
  fill(x[1].value,1000,1000);
  triangle(x[0].value,x[1].value,x[2].value,x[1].value,x[2].value,x[0].value);
  filter(BLUR, 2);
  filter(DILATE);
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


