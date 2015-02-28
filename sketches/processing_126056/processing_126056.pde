
import g4p_controls.*;

void setup() {
  size( 900, 600 );
  background( 255 );
  smooth();
  
  println( displayWidth + " " + displayHeight );
  
  stroke( 0 );
  noFill();
  
  createGUI();
}

float xoff = 0.0;
int dia = 400;
int r = (int) ( noise( xoff ) * 255 ); 
int g = (int) ( noise( xoff + 100 ) * 255 ); 
int b = (int) ( noise( xoff + 10000 ) * 255 );

int bck = 255 - ( (r + g + b)/3 );

float angle = 0;

void draw() {
  background( 0 );
  pushMatrix();
  translate( width/2, height/2 );
  rotate( PI/4 + radians( angle ) );
  recCircle( dia, 0, 0 );
  //xoff += 0.01;
  popMatrix();
  r = (int) ( noise( xoff ) * 255 ); 
  g = (int) ( noise( xoff + 100 ) * 255 ); 
  b = (int) ( noise( xoff + 10000 ) * 255 );

  //bck =( (r + g + b)/3 ) + 125;
}

void recCircle( int dia, int x, int y ) {
  if( dia >= 4 ) {
    xoff += 0.00001;
    stroke( noise( xoff ) * 255, noise( xoff + 100 ) * 255, noise( xoff + 10000 ) * 255 );
    ellipse( x, y, dia, dia );
    int newDia = dia/2;
    int newXPlus = x + newDia;
    int newXMinus = x - newDia;
    int newYPlus = y + newDia;
    int newYMinus = y - newDia;
    
    recCircle( newDia, newXMinus, y );
    recCircle( newDia, newXPlus, y );
    recCircle( newDia, x, newYMinus );
    recCircle( newDia, x, newYPlus );
  }
}

