
// DEFINIZIONE DELLA  CLASSE Agente
 
class Agente
{
  PVector posizione;
  PVector spostamento;
 
  Agente (PVector partenza) {
    posizione = partenza.get();
    spostamento = new PVector( random(-2,2), random(-2,2) );
  }
 
  void update() {
    if (random(100)<2) {
      spostamento = new PVector( random(-2,2), random(-2,2) );
    }
    posizione.add(spostamento);
    if (posizione.dist(centro) > 380) {
      spostamento.mult(-2);
    }
  }
 
  void display() {

   stroke(random(94));
   stroke (random(100,180), random(20,200), random(150,250));
    line(posizione.x, posizione.y,width/2, height/2);

  }
}
 
// USO DELLA CLASSE Agente
 
Agente[] agenti = new Agente[500];
PVector centro;
 
void setup()
{
  size(800, 800);
    background (0);

  centro = new PVector(width/.789, height/2);
   
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



