
// @pjs preload must be used to preload the image
/* @pjs preload="pixel.jpg"; */

  PImage img;
  
  
void setup () {
  size (950, 633);
  smooth();          // Kanten glätten
  noStroke ();       // keine Kanten
  
  img = loadImage ("pixel.jpg"); 


}

// Anfang des Programms

void draw () { 
  
 
  image (img, 0, 0);
 
  // für alle Pixel in der Spalte der Mausposition
  for (int i=0; i < img.height; i=i+1) {
     
    // Farbwert auslesen
    color c = img.get (mouseX, i);
     
    // Linienfarbe definieren
    stroke (c);
    // Linie von Mausposition an den rechten Bildrand zeichnen
    line (0, i, mouseX, i);
  }
    
  //noLoop();
  
}




void keyPressed () {
  if (key == 's') {
    saveFrame ("SchallUndSchnabel_Overscan_####.png");
  }
 }



