
PImage imgol, imgor, imgul, imgur;
PImage imgCursor1, imgCursor2;
boolean doGray, posterize = false;
// Werte für bewegtes Bild Oben Links
float yPos = 0;
int ySpeed = 20;
int ySpeed1 = 40;
int value = 0;

void setup () {
  size( 600, 600 );
  smooth();
  noCursor();
  // Lade Bilder
  imgol = loadImage( "w1.jpg" );
  imgor = loadImage( "w2.jpg" );
  imgul = loadImage( "k1.jpg" );
  imgur = loadImage( "c1.jpg" );
  imgCursor1 = loadImage ( "1.jpg" );
  imgCursor2 = loadImage ( "2.jpg" );
}

void draw () {
  
  background( 255 );
    
  // Zeichne die Bilder
  image( imgor, 300, 0, 300, 300 );
    if (doGray) {
      filter(GRAY);
    }
  image( imgol, 0, yPos, 300, 300 );
  image( imgul, 0, 300, 300, 300 );
  // Bild soll per mouseDragged beweglich sein
  fill( value );
  image( imgur, 300, 300, 300, 300 );

  // Wenn Maus gedrückt wird ändert sich der Bart
  if( mousePressed ) {
    image( imgCursor1, mouseX, mouseY, imgCursor1.width/2, imgCursor1.height/2 );
  }else{
    image( imgCursor2, mouseX, mouseY, imgCursor2.width/2, imgCursor2.height/2 );
  }
}
void mouseDragged() {
  value = value + 20;
  if( value > 600 ) {
    value = 0;
  }
}

void mouseClicked() {
  // Graufilter für Bild oben rechts
  if (mouseX > 300 && mouseY < 300 ) {
    doGray = !doGray;
  }
  // Bewegungseffekt für Bild oben links
  // Wenn es Deckungsgleich mit Bild unten links ist geht es wieder nach oben
  if (mouseX < 300 && mouseY < 300 ) {
    if ( yPos > 280 || yPos < 0 ) {
    ySpeed = ySpeed * -1;
  }
  yPos = yPos + ySpeed;
  if (mouseX < 300 && mouseY > 300 ) {
  }
  }
}

