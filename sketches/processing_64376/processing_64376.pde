
/*Erstelle ein gleichförmiges Raster mit 10 mal 10 Punkten.
 Ändere den Abstand der Punkte anhand der random-Funktion.*/

void setup() {
  size(200, 200);
  background(0);
  smooth();

  stroke(255);
  strokeWeight(15);

  for (float x = width/11; x <= 10 * width/11; x = x + width/11) {
    for (float y = height/11; y <= 10 * height/11; y = y + height/11) {
      point(x+random(-10, 10), y+random(-10, 10));
    }
  }
}

void draw() {
}

/*void mousePressed() {
 saveFrame("thumbnail.png");
 }*/

