
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
    if (random(100)<1) {
      vel = new PVector( random(-1,1), random(-1,1) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 200) {
      vel.mult(-1);                // inverte la direzione
    }
  }

  void display() {
    
   rect(pos.x, pos.y, 10, 10);
   fill (255);
  }
}

// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[500];
PVector centro;

void setup()
{
  size(720, 720);
  background (255);
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
}

void draw()
{
  if(mousePressed) {

   stroke (random(0),random(0,255),random(0,255));
   fill (0, 200);
  }
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}

