
/* @pjs preload="volcan.png, periclasto1.png, periclasto2.png, periclasto3.png"; */

Piroclasto[] piedra = new Piroclasto[ 5 ];
PImage volcan;

void setup() {
  size( 640, 480 );
  frameRate( 30 );
   
  for( int i = 0; i < 5; i++ ) {
    piedra[ i ] = new Piroclasto( random( 317, 369 ), 100, random( -10, 10 ), random( -30, -20 ), random( -15, 15 ), random( 0.1, 1.0 )  );
  }
  
  volcan = loadImage( "volcan.png" );
  
}

void draw() {
  background( 0 );
  
  for( int i = 0; i < 5; i++ ) {
    piedra[ i ].move();
    piedra[ i ].display();
  }
  
  image( volcan, ( ( width / 2 ) - ( volcan.width / 2 ) ), ( height - volcan.height ) );
  
}

class Piroclasto {
  PImage img;
  String[] piedras = { "periclasto1.png", "periclasto2.png", "periclasto3.png" };
  int gravedad = 2; 
  int bocaVolcan = 205;
  int suelo = 480;
  float friccion = 0.96;
  
  float x, y, xVel, yVel, rotacion, piroGiro, escala;
  
  Piroclasto( float tempX, float tempY, float tempXVel, float tempYVel, float tempRotacion, float tempEscala ) {
    img = loadImage( piedras[ int( random( piedras.length ) ) ] );
    x = tempX;
    y = tempY;
    xVel = tempXVel;
    yVel = tempYVel;  
    rotacion = tempRotacion;
    escala = tempEscala;  
  }
  
  void move() {
    x += ( xVel *= friccion );
    y += ( yVel += gravedad );
    piroGiro += rotacion;    
    
    if( ( y + yVel ) >= suelo ) {
      x = random( 317, 369 );
      y = bocaVolcan;
      xVel = random( -10, 10 );
      yVel = random( -30, -20 );
      rotacion = random( -20, 20 );
      escala = random( 0.1, 1.0 );
      
      img = loadImage( piedras[ int( random( piedras.length ) ) ] );
    }
 
  }
  
  void display() {
    imageMode( CENTER );
    pushMatrix();
    translate( x, y );
    rotate( radians( piroGiro ) );
    scale( escala );
    image( img, 0, 0 );
    popMatrix();
    imageMode( CORNER );
    
  }
}




