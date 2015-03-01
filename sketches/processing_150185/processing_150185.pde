
// @pjs preload must be used to preload the image
/* @pjs preload="pixel02.jpg"; */

PImage img;

void setup () {
  size (422, 633);
  smooth();          // Kanten glätten
  noStroke ();       // keine Kanten
  
  
  img = loadImage ("pixel02.jpg");  
  image (img, 0, 0);

}

// Anfang des Programms

void draw () { 

 

     
    // Farbwert auslesen
    color c = img.get (mouseX, mouseY);
     
    // Linienfarbe und Füllfarbe definieren
    stroke (c);
    fill (c);
    // Linie von Mausposition an den rechten Bildrand zeichnen
    rect (mouseX-10, mouseY-10, 20, 20);
    

  
}

void keyPressed () {
  if (key == 's') {
    saveFrame ("SchallUndSchnabel_Overscan_####.png");
  }

}

void mousePressed() 
{
  image (img, 0, 0);; 
}



