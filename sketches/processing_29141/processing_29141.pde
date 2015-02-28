
p p[]; 
float globs = 0; 

void setup ( ) { 

  size ( 1280 , 720 , P2D ) ; 
  background ( 0 ) ; 
  smooth ( ) ; 
  frameRate ( 3000 ) ; 

  p = new p[2000]; 
  for ( int i = 0; i < p.length; i++ )    p [i] = new p ( i/2000.0 , 0 , 0 ) ; 
 } 

void draw ( ) { 

  stroke ( random ( 200 , 255 ) , random ( 150 )  ) ; 

  for ( int i = 0; i < p.length; i++ ) p [i].update ( ) ; 
  globs+= map ( 30 , 20 , 9 , 0.001 , 0.023 ) ; 

}

void mouseDragged ( ) {
  println ( "shit is happening" ) ; 
  int rnd = round ( random ( 1000 )  ) ; 
  p[rnd].x = 0; 
  p[rnd].y = 0; 

}

class p {
  float id , x , y , xp , yp , s , d; 

  public p ( float _id , float _x , float _y ) {
    id = _id; 
    x = xp = _x; 
    y = yp = _y; 
    s = noise ( 500 ) ; 
  } 

  void update ( ) { 

    id+= map ( 0 , 0 , 0 , 0.1 , 0.05 ) ; 
    d = noise ( 0 , 0 , globs ) * 360;  

    x+= cos ( radians ( d )  ) * s * 2; 
    y+= sin ( radians ( d )  ) * s * 3; 

    if ( x < 0 ) x = xp = width; 
    if ( x > width ) x = xp = 0; 
    if ( y < 0 ) y = yp = height; 
    if ( y > height ) y = yp = 0; 

    line ( xp , yp , x , y ) ; 
    xp = x; 
    yp = y; 

  }
 }

