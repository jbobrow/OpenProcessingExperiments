
int dirX ;
int dirY ;
int x ;
int y ;

void setup () {
  size (600,600) ;
  dirX = 5 ;
  dirY = 5 ;
  x = 0 ;
  y =0 ;
  
}

void draw () {
  //background (random (255), random (90), random (50) ) ;
  fill(random (30), random (120), random (77)) ;
  arc (x, x, 600, 600, 0 , PI/2) ;
  x += dirX ;
  y += dirY;
  fill (255) ;
  rect (x,y,100, 50) ;
  if (x > 600 ) {
  dirX = -5 ;
  dirY =-1 ;
  
}

if (y < 1 ) {
  dirY = 5;
  
}

if (x < 1 ) {
  dirX += 5;
}


}

                
                
