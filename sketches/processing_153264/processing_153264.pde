
class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-1,1), random(-1,1) );
  }

  void update() {
    if (random(100)<1) {
      vel = new PVector( random(-1,1), random(-1,1) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 350) {
      vel.mult(-10);               
    }
  }

  void display() {
    fill(0);
    ellipse(pos.x, pos.y, 15, 15);
    
  }
}

Agente[] agenti = new Agente[500];
PVector centro;

void setup()
{
  size(720, 720);
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
}

void draw()
{
  if(mousePressed) {
stroke (random(20,255),random(20,255),random(20,255));
  }
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}




