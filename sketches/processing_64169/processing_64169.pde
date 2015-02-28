
PImage myImage;

void setup() { 
  size(600,600); 
  myImage = loadImage("clouds01.png");
  noStroke();
  background(255);
  for (int x = 0; x < width+10; x=x+10) {
    for (int y = 0; y < height+10; y=y+10) {
      
      // farbe des Pixels an der Stelle x,y auslesen
      color c = myImage.get(x,y);
      
      // als füllfarbe setzen
      fill(c);
      
      // ellipse zeichnen an der stelle x,y mit breite und höhe 10
      ellipse(x,y,10,10);
    }
  }
}

