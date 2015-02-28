
// DEFINIZIONE DELLA  CLASSE Agente
color azzurro = color(96, 144, 170, 150);
color blu = color(0, 71, 133, 100);

class Agente
{
  PVector pos;
  PVector vel;
  color colore;

  Agente (PVector start) {
    pos = start.get();
    vel = new PVector( random(-1,1), random(-1,1) );
    colore = lerpColor (azzurro, blu, random(1));

  }

  void update() {
    if (random(150)<5) {
      vel = new PVector( random(-1,1), random(-1,1) );
    }
    pos.add(vel);
    if (pos.dist(centro) > 600) {
      vel.mult(-1);                // inverte la direzione
    }
  }

  void display() {
    noStroke();
    fill (colore);
    bezier(pos.x+25,pos.y+5,pos.x+47.5,pos.y+35,pos.x+2.5,pos.y+35,pos.x+25,pos.y+5);

    
  }
}

// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[1000];
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
  background(18, 39, 58);
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}


