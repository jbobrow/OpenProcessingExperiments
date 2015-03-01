

// DEFINIZIONE DELLA  CLASSE Agente

class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-5,5), random(-6,6) );
  }

  void update() {
    if (random(500)<1) {
      vel = new PVector( random(-6,6), random(-6,6) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 450) {
      vel.mult(-10);                // inverte la direzione
    }
  }

  void display() {
    ellipse(pos.x, pos.y, 12, 12);
     ellipse(pos.x, pos.y, 24, 24);
  }
}

// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[700];
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
  background(random(255),random(255),random(255));
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}




