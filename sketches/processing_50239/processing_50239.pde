
float nMax, n ;
float diam ;


void setup()
{
  size (400, 400 ) ; smooth() ; noStroke() ;
  noFill () ;
  nMax = 30 ;
  n = nMax ;
  
  diam = width ;
  
  
}

void draw()
{
  fill(255, 255, 30 ) ; 
  rect(0,0, width, height) ;
  cercle (n, nMax, diam ) ;
}

void cercle (float n, float nMax, float diam)
{
  n = n-1 ;
  float mx = map (nMax - n, 0, nMax, 0, mouseX) ;
  float my = map (nMax - n, 0, nMax, 0, mouseY) ;
  float sx = map (nMax - n, 0, nMax, 0, width) ;
  float sy = map (nMax - n, 0, nMax, 0, height) ;

  float px = width /2 - (sx/2  - mx )   ;
  float py = height /2 -  ( sy / 2 - my );
   


  
  fill (255, 30, 30 , 60 ) ;
  

  ellipse ( px, py , diam, diam ) ;
  
  if ( n > 0 ) {
  cercle ( n, nMax, diam / ( 1 + (1.0/3.0) ) ) ;
  }
  
  
}


