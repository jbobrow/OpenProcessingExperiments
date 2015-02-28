

PImage img;

//A8_1 is Jules
//A8_2 is Vincent
//Hold mouse down to draw Jules
//Hold any key + mouse down to draw Vincent

void setup() {
  size( 386, 518);
  img = loadImage( "A8_1.png" );
  img.loadPixels();
  frameRate(15);
  background( 120 );
}


void drawSquares() {
  float x = random( width );
  float y = random( height );
  float z = random( 5, 12 );
  int loc = (int)x + (int)y * width;
  color kolor = img.pixels[loc];
  fill( kolor );
  rect( x, y, z, z );
}


void draw() {
  if (mousePressed == true) {
    for (int i = 0; i < 100; i++) {
      drawSquares();
    }
  }
  if (keyPressed == true) {
    img = loadImage( "A8_2.png" );
  }
  else {
    img = loadImage( "A8_1.png" );
  }
}



