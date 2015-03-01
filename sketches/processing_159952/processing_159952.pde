


class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-0.8,0.8), random(-0.8,0.8) );
  }

  void update() {
    if (random(500)<1) {
      vel = new PVector( random(-0.8,0.8), random(-0.8,0.8) );
    }
    pos.add(vel);
    if (pos.dist( centro ) > 400) {
      vel.mult(-25);
    }
  }

  void display() {
    fill(0,0, random(150), random(100));
    noStroke();
    ellipse(pos.x, pos.y, random(20), random(12));
  }
}



Agente[] agenti = new Agente[1000];
PVector centro;

void setup()
{
  size(720, 720);
  background(255);
  centro = new PVector(width/4, height/4);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
}

void draw()
{
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}
