
// Homework 2
//Cristina Shin cshin1 Copyright Cristina Shin 1/21/13
size( 400, 400 );
background( 238, 231, 222 );
smooth( );

float x, y, wd, ht;


x = 100;
y = 100;
wd = 200;
ht = 200;


//nose
stroke ( 90, 90, 90 );
strokeWeight( 2.5 );
line( x + ( wd / 1.85 ), y + ( ht / 19.63 ), x + ( wd / 3.91 ), y +( ht / 1.35) );
line ( x + ( wd / 3.91 ), y +( ht / 1.35), x + ( wd / 1.56 ), y + ( ht / 1.35 ) );


//glasses
fill( 217, 218, 218 );
strokeWeight( 4 );
stroke( 0, 82, 132 );

ellipse( x + ( wd / 9.3 ) , y +( ht / 5.92 ) , wd / 1.82, ht / 1.82 );
ellipse( x + ( wd / 1.12 ) , y +( ht / 5.92 ) , wd / 1.82, ht / 1.82 );

strokeWeight( 3 );
stroke( 0, 82, 132 );
line( x + ( wd / 2.61 ), y + ( ht / 5.92 ), x + ( wd / 1.62 ), y + ( ht / 5.92 ));

//mustache
fill( 190, 190, 190 );
stroke( 50, 50, 50 );
strokeWeight( 1.75 );
quad( x + ( wd / 3.74 ) , y + ( ht / 1.17 ), x + ( wd / 13.89 ) , y + ( ht * 1.06 ), x + ( wd / 1.07 ), y + ( ht * 1.06 ), x + ( wd / 1.37 ), y + ( ht / 1.17 ) );

//mouth
stroke ( 90, 90, 90 );
strokeWeight( 2 );
line( x + ( wd / 2.42 ), y + ( ht * 1.15 ), x + ( wd / 1.57 ), y +( ht * 1.15 ) );

//leftear
strokeWeight( 2.5 );
stroke( 234, 146, 78 );
noFill( );

beginShape( );

curveVertex( x - ( wd / 50 ), y + ( ht / 6.75 ));

curveVertex( x - ( wd / 2.64 ), y + ( ht / 6.75 ));
curveVertex( x - ( wd / 2 ), y + ( ht / 3.71 ));
curveVertex( x - ( wd / 2.64 ), y + ( ht / 2.56 ));

curveVertex( x - ( wd / 50 ), y + ( ht / 2.56 ));

endShape( );

//rightear
strokeWeight( 2.5 );
stroke( 90, 90, 90 );
noFill( );
beginShape( );

curveVertex( x + ( wd * 1 ), y + ( ht / 6.75 ));

curveVertex( x + ( wd * 1.38 ), y + ( ht / 6.75 ));
curveVertex( x + ( wd * 1.5 ), y + ( ht / 3.71 ));
curveVertex( x + ( wd * 1.38 ), y + ( ht / 2.56 ));

curveVertex( x + ( wd * 1 ), y + ( ht / 2.56 ));


endShape( );

//eyes
strokeWeight( 1.5 );
stroke(  50, 50, 50  );
noFill( );
beginShape( );

curveVertex( x - ( wd / 16.65 ), y + ( ht / 7 ));

curveVertex( x - ( wd / 16.65 ), y + ( ht / 5.91 ));
curveVertex( x + ( wd / 9.29 ), y + ( ht / 4.7 ));
curveVertex( x + ( wd / 3.63 ), y + ( ht / 5.91 ));

curveVertex( x + ( wd / 3.63 ), y + ( ht / 7 ));


endShape( );

//righteye
strokeWeight( 1.5 );
stroke(  50, 50, 50  );
noFill( );
beginShape( );

curveVertex( x + ( wd / 1.38 ), y + ( ht / 7 ));

curveVertex( x + ( wd / 1.38 ), y + ( ht / 5.91 ));
curveVertex( x + ( wd / 1.13 ), y + ( ht / 4.7 ));
curveVertex( x + ( wd * 1.05 ), y + ( ht / 5.91 ));

curveVertex( x + ( wd * 1.05 ), y + ( ht / 7 ));


endShape( );

//saveFrame("hw2.jpg");





