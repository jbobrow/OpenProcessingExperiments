
// DEFINIZIONE DELLA  CLASSE Agente
 
class Agente
{
  PVector posizione;
  PVector spostamento;
  float sterzata; 
 
  Agente (PVector partenza) {
    posizione = partenza.get();
    spostamento = new PVector( random(-1,1), random(-1,1) );
    sterzata = random(-0.015, 0.015); 
  }
 
  void update() {
    spostamento.rotate(sterzata); 
    posizione.add(spostamento);
    if (posizione.dist(centro) > 300) { 
    spostamento.rotate(PI); 
    }
  }
 
  void display() {
    ellipse(posizione.x, posizione.y, 5, 5);
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
  if(mousePressed) {
stroke (random(20,255),random(20,255),random(20,255));
  }
  fill(0, 7);                             // colore di riempimento grigio chiaro e con un valore di opacità molto basso fino a diventare nero
  rect(0, 0, width, height);                // copri l'intera area di visualizzazione con il grigio chiaro semitrasparente
fill(225);                                    //colore interno delle palline in questo caso bianco
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}
 


