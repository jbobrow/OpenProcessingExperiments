
// Esercizio 8.1 Batteri
// Davide Mannarelli
// Accademia di Belle Arti di Brera - NTA1

// DEFINIZIONE DELLA  CLASSE Agente
 
class Agente
{
  PVector posizione;
  PVector spostamento;
  int     dimensione;
 
  Agente (PVector partenza, int dim) {
    posizione = partenza.get();
    dimensione = dim;
    spostamento = new PVector( random(-8,8), random(-8,8) );
  }
 
  void update() {
    if (random(100)<1) {
      spostamento = new PVector( random(-4,4), random(-4,4) );
    }
    posizione.add(spostamento);
    if (posizione.dist(centro) > 500) {
      spostamento.mult(-1);
    }
  }
 
  void display() {
    noStroke();
    fill(random(55,255));
    ellipse(posizione.x, posizione.y, dimensione, dimensione);
  }
}
 
// USO DELLA CLASSE Agente
 
Agente[] agenti = new Agente[100];
PVector centro;
 
void setup()
{
  size(720, 720);
  centro = new PVector(width/2, height/2);
   
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro, int(random(5,15)) );
  }
}
 
void draw()
{
  background(0);
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}


