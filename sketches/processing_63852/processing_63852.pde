
/*Erstelle ein gleichförmiges Raster mit 10 mal 10 Punkten. 
 Verwende dafür zwei for-Schleifen, die ineinander geschachtelt 
 sind. Verwende nur schwarz und weiß.*/

void setup() {
  size(200, 200);
  background(0);
  smooth();
}

void draw() {
  stroke(255);
  strokeWeight(15);

  for (float x = width/11; x <= 10 * width/11; x = x + width/11) {
    for (float y = height/11; y <= 10 * height/11; y = y + height/11) {
      point(x, y);
    }
  }
}

/*void mousePressed() {
  saveFrame("thumbnail.png");
}*/


