
void setup() {
  size( 500, 500 );
  fill( 245, 67, 94 );
  background( 255 );
  noStroke();
 
}

void draw() {
  if(mousePressed) {
  fill( 245, 198, 67 );
  } else {
  ellipse( mouseX+1, mouseY, 20, 20 );
  }
}

