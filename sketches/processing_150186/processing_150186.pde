
// @pjs preload must be used to preload the image
/* @pjs preload="pixel03.jpg"; */

PImage img;

void setup () {
  size (950, 633);
  smooth();          // Kanten glätten
  noStroke ();       // keine Kanten
  
  
  img = loadImage ("pixel03.jpg");  
  image (img, 0, 0);

}


void draw () {  
  if (mousePressed) {  
    // Farbwert auslesen
    color c = img.get (mouseX, mouseY);
     
    // Linienfarbe und Füllfarbe definieren
    stroke (c);
    fill (c);
    // Linie von Mausposition an den rechten Bildrand zeichnen
    rect (mouseX, mouseY, 60, 60);
   // noLoop(); 
   }
}

void keyPressed () {
  if (key == 's') {
    saveFrame ("SchallUndSchnabel_Overscan_####.png");
  }

}




