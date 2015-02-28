
ArrayList<Prtcl> particles;
color c = color(0);
void setup() {
  size(800, 500);
  background(100);
  noStroke();
  smooth();
  particles = new ArrayList<Prtcl>();
  addParticle(2);
}
void draw() {
  noStroke();
  if(frameCount%20 == 0)
  {
    c = color(random(60),10+random(10),10);
  }
  fill(c, 15);
  rect(0, 0, width, height);
  if(frameCount%50 == 0) {
    addParticle(2);
  }
  for(Prtcl p : particles) {
    p.x_vel = (p.life)*(cos(p.life*4))/p.c;
    p.y_vel = (p.life)*(sin(p.life*4))/p.c;
    p.step();
  }
}

void addParticle(int count)
{
  for(int i = 0; i < count; i++)
  {
    particles.add(new Prtcl(random(width-300), random(height-300)));
  }
}

class Prtcl {
  float x, y, x_vel, y_vel;
  float last_x, last_y;
  float life;
  float d;
  float b;
  float c;
  float a;
  float f;
  Prtcl(float _x, float _y) {
    life = random(50,170);
    x = _x;
    y = _y;
    c = random(0.2,0.29);
    d = random(0.09,1);
    b = int(random(1,5));
    a = random(100,255);
    //x_vel = random(-4,4);
    //y_vel = random(-4,4);
  }
  void step()
  {
    x += x_vel;
    y += y_vel;
    if(life >= 0) {
      stroke(a,5*(life));
      float r = (life)*0.07;
      if(b == 2)
      {
        line(x, last_y, last_x, y);
      }
      else
      {
        line(x, y, last_x, last_y);
      }
      noStroke();
      fill(70, 100);
      ellipse(x, y, r+10, r+10);
      fill(a);
      ellipse(x, y, r, r);
    }
    life -= d;
    last_x = x;
    last_y = y;
  }
}


