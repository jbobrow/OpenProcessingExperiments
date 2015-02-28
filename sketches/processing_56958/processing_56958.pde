
int option = 1; // variable entera x igual a 1

void setup() {
  size (600, 600); // tamaño del sketch
  background(255); // fondo blanco
  smooth(); // dibuja figuras "suaves" (bordes)
}

void draw() {
  //background(255);
  if  (option == 1) { // si valor de option es igual a 1

    for (int x = 70; x <= width-50; x+=30) { // variable x igual a 70, variablex menor o igual a ancho menos 50, x aumenta en 30
      for ( int y = 70; y<=width-50; y+=30) {
      
        stroke(0, 20); // color de la linea negro, transparencia 20
        line (x, y, width-50, height-50); // linea
      }
    }
  }

  else if (option ==2) {

    for (int x = 70; x <= width-50; x+=20) {
      for (int y = 70; y <= width-50; y+=20) { // variable y igual a 70, y igual o menor al ancho menos 50, y aumenta en 20
        //stroke(0,20);

        line (x, y, width-50, height-50); // linea
        line (x, y, width, height); // linea
      }
    }
  }

  else if (option ==3) {
    for (int x = 70; x <= width-50; x+=20) {
      for (int y = 70; y <= width-50; y+=20) {
        fill(255, 2); // color circulo blanco, transparencia 2
        ellipse (x, y, 20, 20); // circulo
      }
    }
  }
}


void mousePressed () { // si mouse es presionado valor de option aumenta en 1
  option++;

  if (option > 3) option = 1; // si valor de option es mayor que 3, vuelve a 1
}


