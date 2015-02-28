
//// adam ben-dror 810161656
// Copyright Adam Ben-Dror 2013
// HW2 

size(400,400);
smooth ();

float x, y, wd, ht ; 
x = 33;
y = 35 ;
wd = 320;
ht = 320; 

//RGB backround color 
int br, bg, bb ;
br = 245;
bg = 245;
bb = 247;

background (br,bg,bb) ;


//ears 
noStroke();
fill(244, 201, 164);
ellipse ( x+wd/1.45 , y+ht/1.7 , wd/4, ht/6); 
ellipse ( x+wd/3.21 , y+ht/1.7 , wd/4, ht/6); 


//face
noStroke();
fill( 244, 201, 164 );
ellipse ( x+wd/2 , y+ht/1.8 , wd/1.8, ht/1.8);  


//overall glasses frame
strokeWeight ( 5 );
stroke ( 1, 1, 1 );
noFill ();

beginShape( );
curveTightness ( - .1 );
curveVertex(x+(.15*wd ), y );

curveVertex(x+(.15*wd ), y+(.25*ht) );
curveVertex(x+(.15*wd) , y+(.50*ht) );
curveVertex(x+(.30*wd) , y+(.60*ht) );
curveVertex(x+(.45*wd) , y+(.50*ht) );
curveVertex(x+(.50*wd) , y+(.45*ht) );
curveVertex(x+(.55*wd) , y+(.50*ht) );
curveVertex(x+(.70*wd) , y+(.60*ht) );
curveVertex(x+(.85*wd) , y+(.50*ht) );
curveVertex(x+(.85*wd ), y+(.25*ht) );

curveVertex(x+( .85*wd) , y );
endShape();

//line on frame

//left
beginShape(); 
curveVertex(x+(.15*wd) , y+(.50*ht) );

curveVertex(x+(.15*wd) , y+(.50*ht) );
curveVertex(x+(.30*wd) , y+(.44*ht) );
curveVertex(x+(.45*wd) , y+(.50*ht) );

curveVertex(x+(.70*wd) , y+(.60*ht) );
endShape();

//right
beginShape(); 
curveVertex(x+(.35*wd) , y+(.50*ht) );

curveVertex(x+(.55*wd) , y+(.50*ht) );
curveVertex(x+(.70*wd) , y+(.44*ht) );
curveVertex(x+(.85*wd) , y+(.50*ht) );

curveVertex(x+(.70*wd) , y+(.60*ht) );
endShape();


//nose
fill ( 72, 65, 59);
noStroke ( );
 
ellipse (x + .47 * wd, y + ht*.60, 10, 7); 
ellipse (x+ .55*wd, y+ht*.60, 10, 7);


//moustache
noStroke ();
fill (114, 84, 58) ; 
ellipse ( x+wd/2, y+ht*.90, wd/2.3, ht/2);
fill (br,bg,bb) ;
ellipse ( x+wd/2, y+ht*1, wd/2.3, ht/2.4);

//eyebrow
noFill();
stroke (114, 84, 58); 
strokeWeight (3.8);

//left
beginShape(); 
curveVertex(x+(.60*wd) , y+(.5*ht) );
curveVertex(x+(.60*wd) , y+(.50*ht) );
curveVertex(x+(.64*wd) , y+(.49*ht) );
curveVertex(x+(.70*wd) , y+(.48*ht) );
curveVertex(x+(.70*wd) , y+(.48*ht) );
endShape();

//right
beginShape();
curveVertex(x+(.30*wd) , y+(.48*ht) );
curveVertex(x+(.30*wd) , y+(.48*ht) );
curveVertex(x+(.37*wd) , y+(.49*ht) );
curveVertex(x+(.40*wd) , y+(.50*ht) );
curveVertex(x+(.40*wd) , y+(.50*ht) );
endShape();

//hair
noFill();
stroke (114, 84, 58); 
strokeWeight (.4);

//1
beginShape(); 
curveVertex(x+(.52*wd) , y+(.30*ht) );
curveVertex(x+(.52*wd) , y+(.30*ht) );
curveVertex(x+(.51*wd) , y+(.25*ht) );
curveVertex(x+(.54*wd) , y+(.28*ht) );
curveVertex(x+(.54*wd) , y+(.28*ht) );
endShape();

//2
beginShape();
curveVertex(x+(.46*wd) , y+(.31*ht) );
curveVertex(x+(.46*wd) , y+(.31*ht) );
curveVertex(x+(.43*wd) , y+(.25*ht) );
curveVertex(x+(.40*wd) , y+(.26*ht) );
curveVertex(x+(.40*wd) , y+(.26*ht) );
endShape();

//3
beginShape();
curveVertex(x+(.50*wd) , y+(.33*ht) );
curveVertex(x+(.50*wd) , y+(.33*ht) );
curveVertex(x+(.48*wd) , y+(.25*ht) );
curveVertex(x+(.46*wd) , y+(.27*ht) );
curveVertex(x+(.46*wd) , y+(.27*ht) );
endShape();




//eyes
fill (98, 130, 171, 150); 
noStroke ();
ellipse(x+wd/2.9, y+ht/1.9, wd/22, ht/22);
ellipse(x+wd/1.54, y+ht/1.9, wd/22, ht/22);

fill (0, 0, 0, 180); 
noStroke ();
ellipse(x+wd/2.9, y+ht/1.9, wd/50, ht/50);
ellipse(x+wd/1.54, y+ht/1.9, wd/50, ht/50);

fill (255, 255, 255); 
noStroke ();
ellipse(x+wd/2.9, y+ht/1.9, wd/190, ht/190);
ellipse(x+wd/1.54, y+ht/1.9, wd/190, ht/190);





