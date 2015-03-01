
float tam;
float R,G,B;
void setup() {
  // Si augmentem el tamany, el frameRate és motl baix, l'ordinador no aguanta la velocitat.
  size(500,500);
  // Amb un frameRate de 100 ja no es pot pujar més, no es notal a diferència.
  //frameRate(100);
  // Per a que sembli vent
  //noStroke();
}

void draw() {
  background(0);
  R = random(0,255);
  G = random(0,255);
  B = random(0,255);
  fill( R, G , B , random(0,5));

  for ( int i = 0; i < width; i++) {
    tam = random(i);
    ellipse(i,i,tam,tam);     
  }
}


