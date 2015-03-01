
//by Antoine Mauron
// modified by Antoine M.

float l, h, d, f; //les variables de largeur, hauteur, dÃ©but et fin de l'arc

void setup() {
  size(200, 200);
  background(0);
  smooth();
  noFill();
}

void draw() {
  background(0);
  for (int i=0; i<width+60; i++) {
    for (int j=-11; j<height+60; j+=50) {
      l = h = 60; //largeur et hauteur
      d = PI;      //dÃ©but de l'arc
      f = PI+HALF_PI;  //fin de l'arc
      stroke(random(0, 255), random(0, 255), random(200, 255));
      arc(i, j, l, h, d, f);
    }
  }  

  if (mousePressed == true) {
    background(0);
    for (int i=-60; i<width+60; i++) {
      for (int j=-11; j<height+60; j+=50) {
        l = h = 60; //largeur et hauteur
        d = PI+HALF_PI;      //dÃ©but de l'arc
        f = TWO_PI;  //fin de l'arc
        stroke(random(0, 255), random(0, 255), random(200, 255));
        arc(i, j, l, h, d, f);
      }
    }
  }

  if (keyPressed == true) {
    if (key == 'c') {
      background(0);
      for (int i=-60; i<width+60; i+=30) {
        for (int j=-11; j<height+60; j+=50) {
          l = h = 60; //largeur et hauteur
          d = PI+HALF_PI;      //dÃ©but de l'arc
          f = TWO_PI;  //fin de l'arc
          stroke(random(0, 255), random(0, 255), random(200, 255));
          arc(i, j, l, h, d, f);
        }
      }
    }
  }
}

void mouseDragged() {
  background(0);
  for (int i=-60; i<width+60; i+=mouseX/10) {
    for (int j=-11; j<height+60; j+=50) {
      l = h = 60; //largeur et hauteur
      d = PI+HALF_PI;      //dÃ©but de l'arc
      f = TWO_PI;  //fin de l'arc
      stroke(random(0, 255), random(0, 255), random(200, 255));
      arc(i, j, l, h, d, f);
    }
  }
}



