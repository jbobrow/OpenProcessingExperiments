
//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA

size(400, 400); 
smooth();
background(232,198,148);


//circle center @ center of canvas
float x1=width*.5;
float y1=height*.5;



//circle height, width

float h1 = .75 * width;
float w1 = .75 * width;

//actual circle geometry
fill (245, 216, 175);
noStroke ( );

ellipse(x1,y1, h1,w1);










//stroke for Ds
strokeWeight(10);
stroke( 200, 100, 100 );
noFill();

// left D values
float arc1x = x1*.45 ;
float arc1y = y1 ;

//left d, arc
beginShape( );
curveVertex( arc1x * 3 , arc1y * .25 );
curveVertex( arc1x * 1.50 , arc1y * .5 );
curveVertex( arc1x , arc1y );
curveVertex( arc1x * 1.50 , arc1y * 1.5 );
curveVertex( arc1x * 3 , arc1y * 1.75 );
endShape( );

//left d, side
beginShape( );
curveVertex( arc1x * 1.50 , arc1y * .25 );
curveVertex( arc1x * 1.50 , arc1y * .5 );
curveVertex( arc1x * 1.45 , arc1y );
curveVertex( arc1x * 1.50 , arc1y * 1.5 );
curveVertex( arc1x * 1.50 , arc1y * 1.75 );
endShape( );


// right D values
float arc2x = x1*1.55 ;
float arc2y = y1 ;

//right d, arc
beginShape( );
curveVertex ( arc2x * .3 , arc2y * .25 );
curveVertex ( arc2x * .85 , arc2y * .5 );
curveVertex ( arc2x , arc2y );
curveVertex ( arc2x * .85 , arc2y * 1.5 );
curveVertex ( arc2x * .3 , arc2y * 1.75 );
endShape( );

// right d, side
noFill();
beginShape( );
curveVertex( arc2x * .85 , arc2y * .25 );
curveVertex( arc2x * .85 , arc2y * .5 );
curveVertex( arc2x * .87 , arc2y );
curveVertex( arc2x * .85 , arc2y * 1.5 );
curveVertex( arc2x * .85 , arc2y * 1.75 );
endShape( );









//points that I can copy paste into the curve for the m later, no stroke so that it's invisible
noStroke();
point ( x1 - .2*w1 , y1 + .75*h1 );
point ( x1 - .15*w1 , y1 + .25*h1 );
point ( x1 - .08*w1 , y1 -.25*h1 );
point ( x1 , y1 - .15*h1 );
point ( x1 + .08*w1 , y1 -.25*h1 );
point ( x1 + .15*w1 , y1 + .25*h1 );
point ( x1 + .2*w1 , y1 + .75*h1 ); 


//actual line for M
strokeWeight(10);
stroke( 203, 0, 99 );
noFill();

beginShape( );
curveVertex(x1 - .15*w1 , y1 + .75*h1 );
curveVertex( x1 - .15*w1 , y1 + .3*h1 );
curveVertex( x1 - .13*w1 , y1 -.25*h1 );
curveVertex( x1 , y1 - .22*h1 );
curveVertex( x1 + .13*w1 , y1 -.25*h1 );
curveVertex( x1 + .15*w1 , y1 + .3*h1 );
curveVertex( x1 + .15*w1 , y1 + .75*h1 );
endShape( );





//saveFrame( "dmdonginitial2.jpg" );

