
//Jennifer Kang
//jmkang
// © Jennifer Kang 


size ( 400, 400 );
background ( 255, 157, 72 ); 

//float
float x, y, wd, ht;

x = 100;
y = 100; 
wd = 200; 
ht = 200;

//left eye
noStroke( );
fill( 244, 88, 27 );
ellipse( x + ( wd / 4 ), y + (ht/5.4), wd / 2.5, ht / 2.5 );
 
//left eye inside
noStroke( );
fill( 226, 227, 222 );
ellipse( x + ( wd / 4 ), y + (ht/5.4), wd / 3.08, ht / 3.08 );

 
//left eye inside dot
noStroke( );
fill( 76, 192, 168 );
ellipse( x + ( wd / 4 ), y + (ht/5.4), wd / 13.3, ht / 13.3 );

// right eye 
noStroke( );
fill( 244, 88, 27 );
ellipse( x + ( wd / 1.33 ), y + (ht/5.4), wd / 2.5, ht / 2.5 );

//right eye inside
noStroke( );
fill( 226, 227, 222 );
ellipse( x + ( wd / 1.33 ), y + (ht/5.4), wd / 3.08, ht / 3.08 );

//right eye inside dot
noStroke( );
fill( 76, 192, 168 );
ellipse( x + ( wd / 1.33 ), y + (ht/5.4), wd / 13.3, ht / 13.3 );

//J
noStroke (  );
fill ( 255, 255, 255 );
rect ( x + (wd/2), y + (ht/3.08), wd / 40, ht / 3.64 );
ellipse ( x + (wd/2.15), y + (ht/1.64), wd / 8, ht / 8 );
fill( 255, 157, 72 );
ellipse ( x + (wd/2.20), y + (ht/1.67), wd / 10.53, ht / 11.1 );


fill( 255, 157, 72 );
rect ( x + (wd/2.5), y + (ht/1.91), wd / 10.53, ht / 28.57);
rect ( x + (wd/2.45), y + (ht/1.83), wd / 10.53, ht / 28.57);
rect ( x + (wd/2.5), y + (ht/1.74), wd / 10.53, ht / 28.57);
rect ( x + (wd/2.5), y + (ht/ 1.69), wd / 10.53, ht / 28.57);


// Mustache
fill ( 92, 77, 54 );
triangle (x+(wd/2.08),y+(ht/1.21),x+(wd/1.18),y+(ht/1.18),x+(wd/2.08),y+(ht/1.43)) ;
triangle (x+(wd/2.22),y+(ht/1.43),x+(wd/8),y+(ht/1.18),x+(wd/2.25),y+(ht/1.21)) ;



//left eyebrow
noFill();
stroke(92,67,54);
beginShape();
strokeWeight(2);


curveVertex(x-(wd/20), y-(ht/40)) ;

curveVertex(x-(wd/20), y-(ht/40)) ;
curveVertex(x, y-(ht/10)) ;
curveVertex (x+(wd/18.18), y-(ht/10)) ;
curveVertex (x+(wd/10), y-(ht/13.3)); 

curveVertex (x+(wd/10), y-(ht/13.3)) ;


endShape ();



//right
noFill();
stroke(92,67,54);
beginShape();
strokeWeight(2);

curveVertex( 260, 85 );
curveVertex (x+(wd/1.25), y-(ht/13.3)) ; 

curveVertex (x+(wd/1.25), y-(ht/13.3)) ; 
curveVertex (x+(wd/1.17), y-(ht/7.7)) ;
curveVertex (x+(wd/1.11), y-(ht/7.7)) ; 
curveVertex (x+(wd/1.05), y-(ht/13.3)) ; 

curveVertex (x+(wd/1.05), y-(ht/13.3)) ; 


endShape ();








