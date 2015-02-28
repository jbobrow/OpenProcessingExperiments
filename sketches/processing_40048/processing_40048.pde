
//natalia velasquez
//este programita es para que al mover el mouse, los "quad", varien y al pasarlo por la esquino superior izquierda de la pantalla aparezcan pequeños cuadros de colores.
                
                void setup () {
  size (500, 500);
  smooth ();
  background (0);
}
void draw () {
  for (int pepe =10; pepe <50; pepe++) {
    casa (mouseX, mouseY);
    techo (500, 500);
    perro (10, 10);
  }
}

void casa (int hola, int chao) { //esta es la funcion que hace los "quad" y varian con el movimiento del mouse.
  noFill();
  strokeWeight (2);
  stroke (255);
  quad (  500, hola, 400, random(500), random(500), 500, 500, chao);
}
void techo (int lola, int pancho) { // esta es la funcion que hace aparece los cuadrados de fondo que varian de color con una transparencia de 30.
  noStroke ();
  fill( random(150), random(150), random(255), 30);
  rect (random (500), random (400), lola, pancho);
}

void perro (int jaja, int jeje) { //esta es la funcion que hace aparecer los cuadritos en la parte superior izquierda
  if (mouseX < 300)
  
  fill(random (255), random (255), random(255));
  rect (random (300), random (410), jaja, jeje);
}

