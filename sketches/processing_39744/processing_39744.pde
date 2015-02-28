
//Stephanie Pence
//paternz


int x ;
int y;
 
void setup () {
  size (666,300) ;
  smooth () ;
   
  }
   
  void draw () {
    background (random (157), random (30), random (130)) ;
    stroke (80) ;
    for (int x = 36 ; x < width ; x +=66 ) {
    for (int y = 200; y < height ; y+= 66 ) {
        if ( (x % 60 ) == 1 ) {
        line (x,y, x+66, y +700 ) ;
        } else {
          line (x,y,x+666, y +66) ;
          fill (random (61), (255), (83) ) ;
        }
      }
    }
  }

