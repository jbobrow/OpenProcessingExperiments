
/*Erstelle ein gleichförmiges Raster mit 10 mal 10 Punkten.
 Ändere den Abstand der Punkte mit Wahrscheinlichkeitsrechnung.*/

float abstandX;
float abstandY;

void setup() {
  size(200, 200);
  background(0);
  smooth();

  stroke(255);
  strokeWeight(15);

  for (float x = 0; x <= width; x = x + abstandX) {
    for (float y = 0; y <= height; y = y + abstandY) {
      point(x, y);
      if (random(200) < 100) {
        abstandX = 30;
      } 
      else {
        abstandX = 60;
      }
      if (random(200) < 150) {
        abstandY = 10;
      } 
      else {
        abstandY = 30;
      }
    }
  }
}

void draw() {
}

/*void mousePressed() {
 saveFrame("thumbnail.png");
 }*/

