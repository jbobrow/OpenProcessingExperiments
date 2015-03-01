
//by Antoine Mauron
// modified by

float l, h, d, f; //les variables de largeur, hauteur, dÃ�Â©but et fin de l'arc

void setup() {
  size(200, 200);
  background(0);
  smooth();
  noFill();
}

void draw() {
  for (int i=0; i<width+60; i++) {
    for (int j=-11; j<height+60; j+=50) {
      l = h = 60; //largeur et hauteur
      d = PI;      //dÃ�Â©but de l'arc
      f = PI+HALF_PI;  //fin de l'arc
      stroke(random(0, 255), random(0, 255), random(200, 255));
      arc(i, j, l, h, d, f);
    }
  }  
}



