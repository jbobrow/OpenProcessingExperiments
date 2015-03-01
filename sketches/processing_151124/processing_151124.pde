
// DEFINIZIONE DELLA  CLASSE Agente

class Agente
{
  PVector pos;
  PVector vel;
  color col;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-1,1), random(-1,1) );
    col =color(random (255),random (255),random (255));
  }

  void update() {
    if (random(100)<1) {
      vel = new PVector( random(-1,1), random(-1,1) );
    }
    pos.add(vel);
    float dx = pos.x - centro.x;
    float dy =pos.y -centro.y;
    if (abs(dx)> 200 || abs (dy)>200) {
      vel.mult(-1);
    }
  }

  void display() {
    stroke(col);
    strokeWeight (2);
    point(pos.x, pos.y);
    
    fill(0,116,120,70);
    noStroke();
    ellipse (pos.x+10,pos.y+10, 9,9);
    
    fill(0,120,130,70);
    ellipse (pos.x+13,pos.y+13,3,3);
    
  }
}

// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[600];
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
  background (7);
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}

