
int X;
int Y;

void setup () {
  size (600, 600) ;
  stroke (150) ;
  smooth () ;
}

void draw () {
 if (mousePressed ) {
   background (255);
 }else{
   background (0) ;
   
 }
 for (int x = 10 ; x < width ; x +=15 ) {
    for (int y = 0; y < height ; y+= 10 ) {
        if ( (x % 40 ) == 1 ) {
       line (x,y, x+4, y +5 ) ;
        } else {
          rect (x,y,x%16, y +10) ;
          fill (random (40), (255), (70) ) ;
        }
      }
    }
  }
