
void setup() {
  size(480, 480 );
  background (10,10,10 );
  smooth();
}

void draw() {
  //background( 200 );

  if ( mousePressed == true ) {
      fill( 255, 54, 242 ); // viola
  }
  else {
      fill( 34,20,250 ); // blu
  }

  ellipse(mouseX, mouseY, 80, 80);
}

