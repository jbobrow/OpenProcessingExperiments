
//HW 1
//© Scott Alberstein, January 2014, Pittsburgh, PA

size(400, 400) ;
background( 225, 232, 212 ) ;
smooth() ;

//Background Circles
noStroke() ;
fill( 221, 232, 186 ) ;
ellipse( 200, 200, 400, 400 ) ;
fill( 205, 226, 163 ) ;
ellipse( 200, 200, 375, 375 ) ;
fill( 193, 211, 148 ) ;
ellipse( 200, 200, 350, 350 ) ;
fill( 190, 201, 145 ) ;
ellipse( 200, 200, 325, 325 ) ;

//Letter Circles
noFill() ;
strokeWeight(1) ;
stroke(255) ;
ellipse( 140, 138, 100, 100 ) ;
ellipse( 140, 247, 118, 118 ) ;
ellipse( 259, 247, 118, 118 ) ;
ellipse( 268, 203, 100, 100 ) ;
ellipse( 331, 294, 25, 25 ) ;

//Lineweight
strokeWeight(4) ;
strokeCap(ROUND) ; 
line( 318, 203, 318, 294 ) ;
arc( 140, 138, 100, 100, HALF_PI, TWO_PI ) ;
arc( 140, 247, 118, 118, PI+HALF_PI, PI+TWO_PI) ;
ellipse( 259, 247, 118, 118 ) ;
arc( 268, 203, 100, 100, PI+QUARTER_PI, TWO_PI );
arc( 331, 294, 25, 25, HALF_PI, PI ) ;




