
double p;
double q;
int scale = 5;
void setup() {
  size(400, 400);
  frameRate(20);
  strokeWeight(5);
  colorMode(RGB,width);
}

void draw() {
  background(width);
  double p = (double) mouseX/width; //Maus-Position normieren, also zwischen 0 und 1
  double q = (double) mouseY/height;
  drawBurgessShale(p*2, q*2);
}

void drawBurgessShale(double p, double q) {  
  double x = 0;
  double y = 0;
  double oldX = 0;
  double oldY = 0;
  double theta = 0;
  stroke(mouseX,mouseY,width); //Linie bunt machen

  for (int i = 0; i<= 200; i++) { //wenn man diese Schleife zu gross macht wird alles sehr langsam
    x += Math.cos(theta/10); //x anpassen
    y += Math.sin(theta/10);
    // diese Formel ergibt sogenannte Burgess-Shales, habe ich im Internet gefunden
    theta += ( Math.pow((x*x*q), p) + Math.pow((y*y/q), p) ) / 20;
    // (Teil-)Linie zeichnen von der alten zur neuen Position, skaliert (vergrössert) und zentriert
    line((int)(oldX*scale+width/2), (int)(oldY*scale+height/2), 
         (int)(x*scale+width/2), (int)(y*scale+height/2));
    oldX = x; //aus neu mach alt -> für die nächste Linie
    oldY = y;
  }
}



