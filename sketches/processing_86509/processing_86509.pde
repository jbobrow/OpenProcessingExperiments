
//Written by Keith Joseph 
//kejoseph@andrew.cmu.edu
//51-257 Computing for the Arts with Processing HW2
//copyright Keith Joseph January 2013 Pittsburgh, Pa 15213 All rights reserved

size (400, 400);

smooth (); 

background (170, 207, 234);

float x, y, wd, ht;
   x = 200;
   y = 200;
  wd = 100;
  ht = 100;

//glasses
noFill ();
stroke (255);
rect (x - (.5 * wd), y - ht, (.5 * wd), (.25 * ht) );
rect (x + (.5 * wd), y - ht, (.5 * wd), (.25 * ht) );

//eye iris
strokeWeight (15);
fill (66, 153, 227);
stroke (66, 153, 227);
point ( x - (.25 * wd), y - (.85 * ht) );
point ( x + (.75 * wd), y - (.85 * ht) );

//mustache
  strokeWeight (2);  
  stroke( 234, 187, 97); 
  point (x,   y + (  .5 * ht) );
  point (x + (.25 * wd), y + (.40 * ht) );  
  point (x + (.5 * wd), y + (.5 * ht) );  
  point (x + (.75 * wd), y + (.60 * ht) );
  
  point (x - (.25 * wd), y + (.40 * ht) );
  point (x - (.5 * wd), y + (.5 * ht) ); 
  point (x - (.5 * wd), y + (.5 * ht) );  
  point (x - (.75 * wd), y + (.60 * ht) );
  
strokeWeight (15);
noFill ();
  beginShape ();
    
    curveVertex( x - ( .25 * wd),   y + ( .75 * ht) );
    
    curveVertex (x,   y + (  .5 * ht) );
    curveVertex (x + (.25 * wd), y + (.40 * ht) ); 
    curveVertex (x + (.5 * wd), y + (.5 * ht) );
    curveVertex(x + (.75 * wd), y + (.60 * ht) );
    
    curveVertex(x - (.25 * wd), y + (.40 * ht) );
    curveVertex (x - (.5 * wd), y + (.5 * ht) );
    curveVertex (x - (.5 * wd), y + (.5 * ht) );
    curveVertex (x - (.75 * wd), y + (.60 * ht) );
    
    curveVertex( x + (1.25 * wd), y + ( .25 * ht) ); 
    
  endShape ();

//nose 'J'
strokeWeight (2);
stroke (245, 143, 47);
noFill ();
arc (x, y, x - 125, x - 125, x * 0, PI);

beginShape ();
  vertex (x + 37, y - 75 );
  vertex (x + 37, y - 50);
  vertex (x + 37, y);
endShape ();

//facial outline
strokeWeight (185);
stroke ( 234, 187, 97); 
noFill ();
ellipse (x + 15, x - 10, x + 230, x + 240);

//saveFrame ("hw2.jpg");



