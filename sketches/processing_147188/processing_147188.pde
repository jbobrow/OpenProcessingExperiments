

// DEFINIZIONE DELLA  CLASSE Agente

class Agente
{
  PVector posizione;
  PVector spostamento;

  Agente (PVector partenza) {
    posizione = partenza.get();
    spostamento = new PVector( random(-1,1), random(-1,1) );
  }

  void update() {
    if (random(100)<1) {
      spostamento = new PVector( random(-1,1), random(-1,1) );
    }
    posizione.add(spostamento);
    if (posizione.dist(centro) > 350) {
      spostamento.mult(-1);
    }
  }

  void display() {
    ellipse(posizione.x, posizione.y, 6, 6);
  }
}

// USO DELLA CLASSE Agente

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
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}




