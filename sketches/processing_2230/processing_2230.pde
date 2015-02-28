
// por Mariana L. Torres 
//poema 13 de Alenjandra Pizarnik (en "Arbol de Diana" - 1962)

PFont font;
int transparencia = 0;
int invisibilidad = 1;

void setup() {
  size(600, 400);
  font = loadFont("ArialMT-20.vlw");
  textFont(font);
  noStroke ();

}
void draw() {
  frameRate (6);
  fill(204, 24);
  rect(0, 0, width, height);
  fill(0);
  text("explicar con palabras de este mundo... ", random(-600, 600), random(-20, 420));
  fill(204, 24);
  rect(0, 0, width, height);
  fill(0);
  text("...que partió de mí un barco", random(-600, 600), random(-20, 420));
  transparencia += 6 * invisibilidad;
  if ((transparencia < 0) || (transparencia > 255)) {
    invisibilidad = -invisibilidad;
  }
  fill(0, transparencia);
  text("LLEVÁNDOME", width/2, height/2);
}



