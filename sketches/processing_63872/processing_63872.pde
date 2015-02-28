
/*Verwende Deine Lösung von Aufgabe 3.2 und erstelle 3 
 Variationen. Ändere dabei a) Farbe b) Größe c) Art der Form*/

void setup() {
  size(200, 200);
  background(0);
  smooth();
}

void draw() {
  background(0);
  stroke(255);
  for (float x = width/11; x <= 10 * width/11; x = x + width/11) {
    for (float y = height/11; y <= 10 * height/11; y = y + height/11) {
      point(x, y);
      strokeWeight(random(5, 20));
    }
  }
}

/*void mousePressed() {
 saveFrame("thumbnail.png");
 }*/

