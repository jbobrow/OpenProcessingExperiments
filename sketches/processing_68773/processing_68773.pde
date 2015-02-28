
//Homework 3

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA



float x, y, wd, ht;

void setup ( )
{
  size ( 400, 400 );
  smooth ();
  frameRate (4);
  ellipseMode(CENTER);
  rectMode(CENTER);
}










void draw ( )
{
strokeWeight (random (3));
stroke ( random (255), random (255), random (255));
fill ( random (255), random (255), random (255));

// ALL the random floats, put in the void draw section so that they change every frame
float ran1 = random(50) ;

float ran2 = random(100) ;
float ran3 = random(100) ;
float ran4 = random(100) ;
float ran5 = random(100) ;
float ran6 = random(100) ;
float ran7 = random(100) ;
float ran8 = random(100) ;
float ran9 = random(100) ;
float ran10 = random(75) ;
float ran11 = random(75) ;
float ran12 = random(75) ;
float ran13 = random(75) ;
float ran14 = random(75) ;
float ran15 = random(75) ;
float ran16 = random(75) ;
float ran17 = random(75) ;


//random lines about center
line (mouseX, mouseY, pmouseX + ran2 , pmouseY + ran3 );
line (mouseX, mouseY, pmouseX - ran4 , pmouseY + ran5 );
line (mouseX, mouseY, pmouseX - ran6 , pmouseY - ran7 );
line (mouseX, mouseY, pmouseX + ran8 , pmouseY - ran9 );
line (mouseX, mouseY, pmouseX + ran10 , pmouseY + ran11 );
line (mouseX, mouseY, pmouseX - ran12 , pmouseY + ran13 );
line (mouseX, mouseY, pmouseX - ran14 , pmouseY - ran15 );
line (mouseX, mouseY, pmouseX + ran16 , pmouseY - ran17 );

//circle centered on mouse "body"
ellipse ( mouseX, mouseY, ran1 , ran1 );

//circles "eyes"
ellipse ( mouseX - .25*ran1 , mouseY, ran1 * random (.2) , ran1 * random (.2) );
ellipse ( mouseX + .25*ran1 , mouseY, ran1 * random (.2) , ran1 * random (.2) );

//circle "mouth"
ellipse ( mouseX , mouseY + .25*ran1 , ran1 * random (.4) , ran1 * random (.3) );
}

