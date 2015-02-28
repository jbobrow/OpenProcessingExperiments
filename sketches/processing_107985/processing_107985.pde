
//hw 2
//Stephanie Park
//seohyunp@andrew.cmu.edu
//© Stephanie Park, 2013


size ( 400, 400 );
background ( 5 , 5, 5 , 20);
rectMode ( CENTER );

float x = 100;
float y = 100;

float wd = 100;
float ht = 100;


//background
noStroke ();
fill ( 85,85,85,100);
ellipse ( x-wd*3 , y , wd , ht );
ellipse ( x-wd*2 , y , wd , ht ); 
ellipse ( x-wd , y , wd , ht ); 
ellipse ( x+wd , y , wd , ht ); 
ellipse ( x+wd*2 , y , wd , ht ); 
ellipse ( x+wd*3 , y , wd , ht ); 

ellipse ( x-wd*3 , y+ht*2.5 , wd , ht );
ellipse ( x-wd*2 , y+ht*2.5 , wd , ht ); 
ellipse ( x-wd , y+ht*2.5 , wd , ht ); 
ellipse ( x+wd , y+ht*2.5 , wd , ht ); 
ellipse ( x , y+ht*2.5 , wd , ht ); 
ellipse ( x+wd*2 , y+ht*2.5 , wd , ht ); 
ellipse ( x+wd*3 , y+ht*2.5 , wd , ht ); 

ellipse ( x-wd*3, y + ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x-wd*2, y + ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x-wd, y + ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x+wd, y + ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x+wd*2, y + ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x+wd*3, y + ht*1.25 , wd*1.2 , ht *1.5 );

ellipse ( x-wd*3, y - ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x-wd*2, y - ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x-wd, y - ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x, y - ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x+wd, y - ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x+wd*2, y - ht*1.25 , wd*1.2 , ht *1.5 );
ellipse ( x+wd*3, y - ht*1.25 , wd*1.2 , ht *1.5 );


//face
noStroke ();
fill ( 149 , 149, 149, 50 );
ellipse ( x, y, wd, ht );

//body
fill ( 142, 50);
ellipse ( x, y + ht*1.25 , wd*1.2 , ht *1.5 );

//s
noFill ();
stroke ( 147 , 21, 24);
strokeWeight ( 3 ) ;
arc( x, y, wd, ht, radians(-270) , radians (-90) );

arc ( x, y + ht*1.25 , wd*1.2 , ht *1.5 , radians (-90), radians (180) );


//eyes
noStroke () ;
fill ( 5, 7, 3, 50 ) ;
ellipse ( x - wd*.2 , y - ht*.11 , wd * .3 , wd * .22 );
ellipse ( x + wd*.2 , y - ht*.11 , wd * .3 , wd * .22 );
stroke (5, 7, 3, 50) ;
line ( x - wd*.48 , y - ht*.14 , x + wd*.48 , y - ht*.14 );
noStroke () ;
fill ( 131 ) ;
ellipse ( x - wd*.2 , y - ht*.11 , wd * .25 , wd * .15 );
ellipse ( x + wd*.2 , y - ht*.11 , wd * .25 , wd * .15 );

//mustache
noFill ();
stroke ( 100, 100, 100, 100 );
arc ( x - wd*.2, y + ht*.16 , wd * .4 , ht * .25 , radians (-360) , radians (-180) );
arc ( x + wd*.2, y + ht*.16 , wd * .4 , ht * .25 , radians (-360) , radians (-180) );

//p
fill ( 149 );
stroke ( 147 , 21, 24);
strokeWeight ( 3 ) ;
beginShape();
curveVertex ( x , y - ht*.1 );
curveVertex( x + wd*.5 , y - ht*.1 );
curveVertex( x + wd*0.6 ,  y );
curveVertex( x + wd*.5 , y + ht*.12);
curveVertex ( x , y + ht*.12);
endShape();

stroke ( 147 , 21, 24);
line ( x + wd*.5 , y - ht*.14 , x+ wd*.5 , y + 500 );

//shirt_collar
fill (131);
noStroke ();
triangle ( x - wd*.2 , y + ht*.55, x , y + ht*.57 , x - wd*.2 , y + ht*.68 );
triangle ( x + wd*.2 , y + ht*.55, x , y + ht*.57 , x + wd*.2 , y + ht*.68 );

//shirt_buttons
stroke (131);
strokeWeight (1);
line ( x , y + ht*.55 , x , y + ht*2 );
fill (131 );
ellipse ( x + wd*.05, y + ht*.8, wd*.03 , ht*.03 );
ellipse ( x + wd*.05, y + ht*.95, wd*.03 , ht*.03 );
ellipse ( x + wd*.05, y + ht*1.1, wd*.03 , ht*.03 );
ellipse ( x + wd*.05, y + ht*1.25, wd*.03 , ht*.03 );
ellipse ( x + wd*.05, y + ht*1.4, wd*.03 , ht*.03 );

//eyes
noStroke () ;
fill ( 5, 7, 3, 50 ) ;
ellipse ( x - wd*.2 , y - ht*.11 , wd * .3 , wd * .22 );
ellipse ( x + wd*.2 , y - ht*.11 , wd * .3 , wd * .22 );
stroke (5, 7, 3, 50) ;
line ( x - wd*.48 , y - ht*.14 , x + wd*.48 , y - ht*.14 );
noStroke () ;
fill ( 131 ) ;
ellipse ( x - wd*.2 , y - ht*.11 , wd * .25 , ht * .15 );
ellipse ( x + wd*.2 , y - ht*.11 , wd * .25 , ht * .15 );

//hair
noStroke ();
fill (152, 152, 152, 60);
arc ( x, y - ht*.3 , wd * .8, ht*.4 , radians (-180) , radians (0) );


