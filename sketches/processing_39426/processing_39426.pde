
int x ;
int y;

void setup () {
  size (600,600) ;
  smooth () ;
  
  }
  
  void draw () {
    background (random (255), random (30), random (130)) ;
    stroke (80) ;
    for (int x = 10 ; x < width ; x +=15 ) {
    for (int y = 0; y < height ; y+= 10 ) {
        if ( (x % 40 ) == 1 ) {
       line (x,y, x+4, y +5 ) ;
        } else {
          line (x,y,x+50, y +10) ;
          fill (random (40), (255), (70) ) ;
        }
      }
    }
  }
                
