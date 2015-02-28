
size ( 500 , 500 );

background (0) ;


int x = 0 ;
noStroke () ;
for ( int i = 0; i <= 255; i += 50) {
fill (250, 250, 250, i) ;
triangle (x , 500, x + 15 , 0, 400, 500 + x) ;
rect (x, 0, 50, 400 ) ;
fill (104, 47, x, i) ;
ellipse (400, x , 100, 100) ;
x += 50 ;


}
