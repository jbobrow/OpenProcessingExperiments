
int d = 25;
void setup() {
  size( 150, 150 );
  background( 255, 255, 255 );
}
/////////////////////////////////////////////////
void draw() {
  noStroke();
  fill(random( 255 ), random( 255 ), random( 255 ));
  ellipse( mouseX, mouseY, 30, 30 );
  //alles wieder löschen
  if ( keyPressed == true ) {
    background( 255 );
  }//mouseabfrage
  if (mouseY<149 && mouseY>130 ) {
    stroke(255);
  }
  // alphawert
  else {
    stroke(100, 0, 0, 0 );
  }
  //HD
  strokeWeight(15);
  line(d, d, d, 125);
  line(d, 75, 60, 75);
  line(65, d, 90, d);
  line(65, 125, 90, 125);
  line(90, d, 107, 71);
  line(90, 125, 107, 79);
  line(107, 75, 108, 75);
}
                
                
