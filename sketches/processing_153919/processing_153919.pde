
class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-2,2), random(-2,2) );
  }

  void update() {
    if (random (100)<2) {
     vel = new PVector( random(-2,2), random(-2,2) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 500) {
      vel.mult(-2);
    }
  }

  void display() {
    noFill ();
    stroke (random(255), random (0), random (150), random (100));
    ellipse (pos.x, pos.y, width/4, height/4);
  }
}



Agente[] agenti = new Agente[500];
PVector centro;

void setup()
{
  background(255);
  size(720, 720);
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
}

void draw()
{
  if (mousePressed) {
    background (0);
    stroke(random(150), random (255), 0, random (100));
    }
   

  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}

