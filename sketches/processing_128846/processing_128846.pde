
boolean illusion = true;

int r;
float rmul = 1.2;

void setup() {
  size( 500, 250 );
  
  r = width / 10;
  noStroke();
}

void draw() {

  background(127);

  if ( illusion ) {
    
    pushMatrix();
    translate( width / 4, height / 2 );
    
    for( float i = 0; i < TWO_PI; i += PI/3 ) {
     ellipse( sin( i ) * r * rmul, cos( i ) *  r * rmul, 3*r/4, 3*r/4 );  
    }
    
    popMatrix();

    pushMatrix();
    translate( 3*width / 4, height / 2 );
    
    for( float i = 0; i < TWO_PI; i += PI/3 ) {
     ellipse( sin( i ) * r * rmul, cos( i ) *  r * rmul, 9*r/8, 9*r/8 );  
    }
    
    popMatrix();
    
    
    
  }
  
  ellipse( width / 4, height / 2, r, r );
  ellipse( 3*width / 4, height / 2, r, r ); 
}


void mousePressed() {
  illusion = false;
}

void mouseReleased() {
  illusion = true;
}

  
  
