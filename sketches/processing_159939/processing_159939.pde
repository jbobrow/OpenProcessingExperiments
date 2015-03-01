
// DEFINIZIONE DELLA  CLASSE Agente

class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-1,1), random(-1,1) );
  }

  void update() {
    if (random(150)<5) {
      vel = new PVector( random(-1,1), random(-1,1) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 500) {
      vel.mult(-5);
    }
  }

  void display() {
   
    line(pos.x, pos.y, width/2, height/2);
  }
}

// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[50];
PVector centro;

void setup()
{
  size(720, 720);
  background( 20, 100, 100);
  colorMode(HSB, 350, 100, 100);
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
}

void draw()
{
  if(mousePressed) {
  stroke (random(40,350),random(75,100),random(75,100));
  }
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}



