
void setup() {
  size( 800, 600 );
  background ( 255 );
}

int x = 8;        // Abstand zwischen den quadraten
int y = 8;
int ab = 20;      //breite X höhe des ersten quadrats / 
                  // Faktor, um den Quadrate wachsen
void draw() {
  rectMode(CENTER);
  noFill();
  translate(width/8, -height/10 );
  for( int c1 = 1; c1 < 8; c1 = c1 + 1){                // zeichne 7 x Quadrate im Quadraten -/-
    rect( 300 - x * c1, 400 - y * c1, ab * c1, ab * c1);
  }

  rectMode(CENTER);
  for( int c2 = 8; c2 < 13; c2 = c2 + 1){              // zeichne 5 x Quadrate im Quadraten +/-
    rect( 188 + x * c2, 400 - y * c2, ab * c2, ab * c2); 
  }

  rectMode(CENTER);
  for( int c3 = 13; c3 < 17; c3 = c3 + 1){          // zeichne 4 x Quadrate im Quadraten +/+
    rect( 188 + x * c3, 208 + y * c3, ab * c3, ab * c3); 
  }

  rectMode(CENTER);
  for( int c4 = 17; c4 < 20; c4 = c4 + 1){        // zeichne 3 x Quadrate im Quadraten -/+
    rect( 444 - x * c4, 208 + y * c4, ab * c4, ab * c4); 
  }

}


