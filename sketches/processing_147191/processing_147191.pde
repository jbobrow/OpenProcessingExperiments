

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
//    if (random(100)<1) {
//      spostamento = new PVector( random(-1,1), random(-1,1) );
//    }
    posizione.add(spostamento);
//    if (posizione.dist(centro) > 350) {
    if (posizione.x<0 || posizione.x>width || posizione.y<0 || posizione.y>height) {  //++
      spostamento.mult(-1);
    }
  }

  void display() {
    ellipse(posizione.x, posizione.y, 6, 6);
  }
}

// USO DELLA CLASSE Agente

// Agente[] agenti = new Agente[500];
Agente[] agenti = new Agente[200];     //++
PVector centro;

void setup()
{
  size(720, 720);
  centro = new PVector(width/2, height/2);
  
  for (int i=0;  i<agenti.length;  i++) {
    agenti[i] = new Agente( centro );
  }
  
  colorMode(HSB);   //++
  background(255);  //++
}

void draw()
{
  noStroke();                 //++
  fill(255, 15);              //++
  rect(0, 0, width, height);  //++

  for (Agente a : agenti) {
    a.update();
//    a.display();
  }
  
  for (int i=0; i < agenti.length; i+=2) {       //++
    PVector p1 = agenti[i].posizione;            //++
    PVector p2 = agenti[i+1].posizione;          //++
    float c = map( i, 0,agenti.length, 0,256 );  //++
    stroke( c, 255-c, 255 );                     //++ 
    line( p1.x,p1.y,  p2.x,p2.y );               //++ 
  }
}


