
// created by tifaine l. / modified by gilles m.
float i, j, l, h;
float decalageRondsX, decalageRondsY;
float decalageCarresX, decalageCarresY;
float angle;
int nombre;

 
void setup() {
 
  size(500, 500);
  noFill();
  smooth();
 
  background(10, 70, 90);
 
  i = 50;
  j = 50;
  l = 25;
  h = 25;
 
  //noLoop();
  nombre = 25;
  angle = PI/4;
  decalageRondsX = height/4;
  decalageRondsY = -width/2;
  decalageCarresX = height/6;
  decalageCarresY = -width/6;
}
 
void draw() {
  
  background(10, 70, 90);
 
  stroke(255,100);
  strokeWeight(4);
 
  // MOTIF 1
 
  // Rotation
  rotate(angle);
  // Déplacement d'un quart de l'image
  translate(decalageRondsX, decalageRondsY);
 
  // Répétition motifs ronds
  for (int i = 0; i < height; i = i + nombre) {
    //println(i);
    for (int j = 0; j < width; j = j + nombre) {
      ellipse(i, j, l, h);
    }
  }
 
  // MOTIF 2
 
  // Décalage par rapport au motif 1
  translate(decalageCarresX, decalageCarresY);
 
  // Répétition motifs carrés
  for (int i = 0; i < height; i = i + nombre) {
    for (int j = 0; j < width; j = j + nombre) {
      rect(i, j, l, h);
    }
  }
  
  // MOTIF ALTERNATIF
  // La position de la souris détermine la fréquence du motif
  // et ses décalages
  
  if (mousePressed) {
    nombre = round(mouseX/10 + 20);
    angle = PI/2;
    decalageRondsX = -width/4 + mouseX;
    decalageRondsY = -(width/2 + mouseY);
    decalageCarresX = mouseX + height/6 -width/2;
    decalageCarresY = mouseY - width/6-height/2;  
  }
  
}



