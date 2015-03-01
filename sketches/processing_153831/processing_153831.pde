
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/147188*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

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
    if (posizione.dist(centro) > 300) {
      spostamento.mult(-1);
    }
  }

   void display() {                                            // METODO per la visualizzazione dell'agente
    ellipse(posizione.x, posizione.y, 5, 5);                  // disegna un cerchio di 5 pixel di diametro nella posizione corrente
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
  {
  fill(0, 7);                             // colore di riempimento grigio chiaro e con un valore di opacità molto basso fino a diventare nero
  rect(0, 0, width, height);                // copri l'intera area di visualizzazione con il grigio chiaro semitrasparente
fill(225);                                    //colore interno delle palline in questo caso bianco
  for (Agente a : agenti) {
    a.update();
    a.display();
  }
}
 
}



