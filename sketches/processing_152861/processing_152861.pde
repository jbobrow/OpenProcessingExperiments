

class Agente
{
  PVector pos;
  PVector vel;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-2,2), random(-2,2) );
  }

  void update() {
    if (random(100)<2) {
      vel = new PVector( random(-2,2), random(-2,2) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 350) {
      vel.mult(-2);               
    }
  }

  void display() {
    triangle (pos.x, pos.y, width/2, height/2, 300,300 );
  }
}



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
  if (mousePressed) {
stroke( random(255),random(255),random(255), random (200));
 }
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}




