
// Kevin Hyun khyun
// Copyright 2012

size( 400, 400 );
smooth();
background( 222, 229, 21 );

float x, y, wd, ht, tot;

x = 100;
y = 100;
wd = 200;
ht = 200;
tot = 400;

//Outer Circle
fill( 69, 223, 252 ); 
strokeWeight( 0 );
ellipseMode( CENTER );
ellipse( x*2, y*2, wd*1.5, ht*1.5 );

//Inner Circle
noFill();
ellipseMode( CENTER );
ellipse( x*2, y*2, wd*1.375, ht*1.375 );


stroke( 133, 45, 211 );
strokeWeight( 5 );
beginShape();
//K - Vertical
  curveVertex( x*1.5 , y/1.375 );
  curveVertex( x*.875 , y*1.2);
  
  curveVertex( wd/3.275 , y*2 ); //middle
  
  curveVertex( x*.875 , y*2.75);
  curveVertex( x*1.5, y*3.275 );
endShape();

beginShape();
//K leg 1
stroke( 255, 124, 0 );
  curveVertex( 0 , y*2 ); // cntrl pt
  curveVertex( wd/3 , y*2 ); 
  curveVertex( wd/1.75, y*1.75 );
  curveVertex( wd/1.5, tot - ( ht*1.375) );
  curveVertex( wd/1.5, 0 ); // cntrl pt
endShape();

// MIRROR THE "K" LEG
beginShape();
//K leg 2
  curveVertex( 0 , y*2 ); // cntrl pt
  curveVertex( wd/3 , y*2 ); 
  curveVertex( wd/1.75, y*2.125 );
  curveVertex( wd/1.5, tot - ( ht/1.375) );
  curveVertex( wd/1.5, 2*ht ); // cntrl pt
endShape();

beginShape();
//H curve
stroke( 133, 45, 211 );
  curveVertex( tot - (x*1.5) , y/1.375 );
  curveVertex( tot - (x*.875) , y*1.2);
  
  curveVertex( tot - (wd/3.275) , y*2 );
  
  curveVertex( tot - (x*.875) , y*2.75);
  curveVertex( tot - (x*1.5), y*3.275 );  
  
//  point( tot - (x*1.5) , y/1.375 );
//  point( tot - (x*.875) , y*1.2);
//  
//  point( tot - (wd/3.275) , y*2 );
//  
//  point( tot - (x*.875) , y*2.75);
//  point( tot - (x*1.5), y*3.275 );  
endShape();



stroke( 255, 124, 0 );//H horizontal
line( tot - (wd/1.5), y*2, tot - (wd/3.275) , y*2 );

beginShape();
//H mirrored
//  point( tot - (x/1.625) , y/1.375 );
//  point( tot - (x/.925) , y*1.2);
//  
//  point( tot - (wd/1.5), y*2 ); //middle cntrl pt
//  
//  point( tot - (x/.925) , y*2.75);
//  point( tot - (x/1.625), y*3.275 );  
  
  
  curveVertex( tot - (x/1.625) , y/1.375 );
  curveVertex( tot - (x/.925) , y*1.2);
  
  curveVertex( tot - (wd/1.5), y*2 ); //middle cntrl pt
  
  curveVertex( tot - (x/.925) , y*2.75);
  curveVertex( tot - (x/1.65), y*3.275 );   
endShape();

saveFrame("HW_2.jpeg");

