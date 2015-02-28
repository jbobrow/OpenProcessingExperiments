
//Homework 4

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA


// [mouse click] background changes to random color
//press [q] circle changes to random size
//press [w] eyes change to random size
//press [e] mouth changes to random size
//press [r] creature color changes to random color










//background colors
float ranclr1;
float ranclr2;
float ranclr3;
//creature color
float rancolor1;
float rancolor2;
float rancolor3;

// generates random circle size
float rancircle1;
float rancircle2;
// generates random mouth size
float ranmouth1;
float ranmouth2;
// generates random eye size
float raneye1;
float raneye2;










void setup ( )
{
  size ( 400, 400 );
  smooth ();
  frameRate (30);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
//background colors
ranclr1 = random (255);
ranclr2 = random (255);
ranclr3 = random (255);
//creature color
rancolor1 = random (0, 255);
rancolor2 = random (0, 255);
rancolor3 = random (0, 255);

// generates random circle size
rancircle1 = random(50,125) ;
rancircle2 = random(50,125) ;
// generates random mouth size
ranmouth1 = rancircle1 * random (.10, .3) ;
ranmouth2 = rancircle2 * random (.1, .3) ;
// generates random eye size
float raneye1 = rancircle1 * random (.1, .2);
float raneye2 = rancircle1 * random (.1, .2);
}










void draw ( )
{
background (ranclr1, ranclr2, ranclr3);

//stroke weight is random, changes every frame no matter what
strokeWeight (random (3));
// stroke + fill are the same random colors
stroke ( rancolor1, rancolor2, rancolor3);
fill ( rancolor1, rancolor2, rancolor3);

// ALL the random floats, put in the void draw section so that the lines change every frame no matter what
float ran2 = random(100) ;
float ran3 = random(100) ;
float ran4 = random(100) ;
float ran5 = random(100) ;
float ran6 = random(100) ;
float ran7 = random(100) ;
float ran8 = random(100) ;
float ran9 = random(100) ;
float ran10 = random(150) ;
float ran11 = random(150) ;
float ran12 = random(150) ;
float ran13 = random(150) ;
float ran14 = random(150) ;
float ran15 = random(150) ;
float ran16 = random(150) ;
float ran17 = random(150) ;

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
ellipse ( mouseX, mouseY, rancircle1 , rancircle1 );

strokeWeight (2);
stroke ( 0,0, 0 );
noFill ( );

//circles "eyes"
ellipse ( mouseX - .25*rancircle1 , mouseY, raneye1 , raneye1 );
ellipse ( mouseX + .25*rancircle1 , mouseY, raneye2 , raneye2 );

//circle "mouth"
ellipse ( mouseX , mouseY + .20*rancircle2 , ranmouth1 , ranmouth2 );
}










// key press
void keyPressed() 
{
//circle changes to random size
if (key == 'q' )
  {
    rancircle1 = random(50,125) ;
    rancircle2 = random(50,125) ;
  }
//eyes change to random size
if (key == 'w' )
  {
    raneye1 = rancircle1 * random (.10, .3) ;
    raneye2 = rancircle2 * random (.1, .3) ;
  }
//mouth changes to random size
if (key == 'e' )
  {
    ranmouth1 = rancircle1 * random (.10, .3) ;
    ranmouth2 = rancircle2 * random (.1, .3) ;
  }
//creature color changes to random color
if (key == 'r' )
  {
    rancolor1 = random (0, 255);
    rancolor2 = random (0, 255);
    rancolor3 = random (0, 255);
  }
}










// mouse click -> background changes to random color
void mousePressed( )
  {
     ranclr1 = random (255);
     ranclr2 = random (255);
     ranclr3 = random (255);
  }

