

import processing.opengl.*;

Organico org1, org2; // inicializo 2 objetos de la clase Organico
//Mecanico mec1; // un objeto de la clase Mecanico

int stroki = 255;
int alphaS = 30;

void setup() {
  size(800, 600, OPENGL);
  //tamaño, velocidad, posx, posy, rot, direccion inicial, limite de cubo
  // limite de cubo sería hasta donde llega a agrandarse antes de volver
  // a achicarse
  org1 = new Organico(1, 5, 300, 600, 1, -1, 50);
  org2 = new Organico(1, 5, 300, 300, 1, 1, 200);
  //tamaño, velo, posx, posy
 // mec1 = new Mecanico(50, 10, 400, 0);
}





void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
 

//org1.mostrar();
//org1.mover();
org2.mostrar();
org2.mover();
//mec1.ejecutarCirculo();
}


