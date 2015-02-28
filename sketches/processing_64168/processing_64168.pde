
// Variable mit dem Namen myImage vom Typ PImage für Bilder
PImage myImage;

void setup() {
  size(600,600);
  background(255);
  
  // laden des Bildes in setup 
  // (Bild muss im data Folder des Sketches liegen
  myImage = loadImage("clouds01.png");
  
  // Anzeigen des Bildes an der Stelle x=0, y=0
  image(myImage, 0, 0);
}

void draw() {
  
}

