
// DEFINIZIONE DELLA  CLASSE Agente

class Agente
{
  PVector posizione;
  PVector spostamento;

  Agente (PVector partenza) {
    posizione = partenza.get();
    spostamento = new PVector( random(-5,5), random(-5,5) );
  }

  void update() {
    if (random(100)<5) {
      spostamento = new PVector( random(-5,5), random(-5,5) );
    }
    posizione.add(spostamento);
    if (posizione.dist(centro) > 250) {
      spostamento.mult(10);
    }
  }

  void display() {
    fill(random(0,255), random(0,255), random(0,100));
noStroke();
    rect(posizione.x, posizione.y, 7, 7);
  }
}

// USO DELLA CLASSE Agente

Agente[] agenti = new Agente[500];
PVector centro;

void setup()
{
  size(800, 800);
  background(0);
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


