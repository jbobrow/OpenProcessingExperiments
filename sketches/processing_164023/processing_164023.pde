
int x = 0;
int y = 0;


void setup() {
  size(900, 600);
  background(0);
  fill(random(0, 255), random(0, 255));
}
void draw() {
  if ( keyPressed && ( key == CODED ) ) {
    if ( keyCode == LEFT ) {
      x--;
    }
    else if ( keyCode == RIGHT ) {
      x++;
    }
    else if (keyCode == UP ) { // Need to figure out how to 
      // move it up and down on Y cordinate plane
      y++;
    }
  }

  if ( keyPressed ) {
    println(key);
    if ( (key == 'r') || (key == 'R') ) {
      fill( 247, 0, 0 );
    }
    else if ( (key == 'g') || (key == 'G') ) {
      fill( 0, 200, 0 );
    }
    else if ( (key == 'b') || (key == 'B') ) {
      fill( 7, 15, 219 );
    }

    if ( (key == 't') || (key == 'T') ) {
      fill( 5, 245, 195 );
    }
    else if ( (key == 'y') || (key == 'Y') ) {
      fill( 241, 250, 5 );
    }
    else if ( (key == 'o') || (key == 'O') ) {
      fill( 255, 95, 3 );
    }
  }

  ellipse( width/2 + x, height/2, 300, 300 );


 
}

