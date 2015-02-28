
int i = 100;
size( 500, 500 );
background( 255 );
smooth();
  
  noStroke();
  fill( 56, 206, 152 ); 
  // Bedingung aufstellen für x und y Werte mit Variable i
  for( int y = 0; y <= height; y = y + i ){
      for( int x = 0; x <= width; x = x + i ){
        ellipse( x, y, 20, 20 );
      }
  }
