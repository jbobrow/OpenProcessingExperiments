
//Michael Tristan Importico
//Homework 2 - "Variable Jim"
//© 2013 by Michael Tristan Importico. All rights reserved

size(400, 400); //sets canvas size
smooth( ); //smooth ON
background(94,58,44  ); //sets background color to blue

//sets up variables
float x, y, wd, ht; //declaring the variables used in the sketch
x = 100;  
y = 100;
wd = 200;
ht = 200;

fill(173,70,89);
ellipse( x + (  .5 * wd), y + (  .5 * ht), wd, ht ); //bounding circle

//head
fill(237,208,196);
ellipse( x + (  .6 * wd), y + (  .7 * ht), .7 * wd,  1.2 * ht );

//Bill's mustache and my inital M
noFill();
strokeWeight(20);
beginShape();
curveVertex( x + (  .1 * wd), y + (  .98 * ht) );
curveVertex( x + (  .1 * wd), y + (  .98 * ht) );
curveVertex( x + (  .2 * wd), y + (  .8 * ht) );
curveVertex( x + (  .3 * wd), y + (  .99 * ht) );
curveVertex( x + (  .4 * wd), y + (  .8 * ht) );
curveVertex( x + (  .5 * wd), y + (  .99 * ht) );
curveVertex( x + (  .5 * wd), y + (  .99 * ht) );
endShape();


strokeWeight(5);

//hair
beginShape();
curveVertex( x + (  .6 * wd), y + (  .08 * ht) );
curveVertex( x + (  .6 * wd), y + (  .08 * ht) );
curveVertex( x + (  .9 * wd), y + (  .5  * ht) );
curveVertex( x + (  .75 * wd), y + (  .7 * ht) );
curveVertex( x + (  .75 * wd), y + (  .7 * ht) );
endShape();

//nose
strokeWeight(5);
fill(94,163,87,100);

beginShape();
vertex( x + (  .5 * wd), y + (  .1 * ht) ); //top of nose
vertex( x + (  .5 * wd), y + (  .1 * ht) ); //top of nose
vertex( x + (  .2 * wd), y + (  .7 * ht) ); //point of nose
vertex( x + (  .6 * wd), y + (  .7 * ht) ); //bottom right of nose
vertex( x + (  .6 * wd), y + (  .7 * ht) ); //bottom right of nose
endShape();


//eyes
fill(255);//sets fill color to white
ellipse(x + (  .5 * wd), y + (  .5 * ht), wd/3.5, ht/3);//right ""
fill(48, 23, 25); //Jim has brown eyes?  now he does
ellipse(x+(  .5 * wd), y + (  .5 * ht), wd/6, ht/6); 
fill(0);// sets fill to black
ellipse(x+(  .5 * wd), y + (  .5 * ht), wd/10, ht/10); 


//glasses
strokeWeight(3);
rectMode(CENTER);
fill(230, 145, 155, 100); //sets fill color to transparent rose
rect(x + (  .5 * wd), y + (  .5 * ht), wd/3, ht/3);
strokeWeight(8);
line(x + (  .68 * wd), y + (  .45 * ht),x + (  .93 * wd), y + (  .45 * ht));

//ear
beginShape();
curveVertex(x + (  .7 * wd), y + (  .48 * ht));
curveVertex(x + (  .78 * wd), y + (  .43 * ht));
curveVertex(x + (  .82 * wd), y + (  .51 * ht));
curveVertex(x + (  .77 * wd), y + (  .55 * ht));
curveVertex(x + (  .84 * wd), y + (  .7 * ht));
curveVertex( x + (  .7 * wd), y + (  .8 * ht) );
curveVertex( x + (  .68 * wd), y + (  .78 * ht) );
endShape();

//ear ring
strokeWeight(20);
point( x + (  .7 * wd), y + (  .8 * ht) );
line( x + (  .7 * wd), y + (  .9 * ht) ,x + (  .7 * wd), y + (  .98 * ht) );

//saveFrame( "jim.jpg" );
