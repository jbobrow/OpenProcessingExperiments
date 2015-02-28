
//Cristina Mele
// Computing for the Arts with Processing
// 51-257
// Copyright © Cristina Mele
// September 6, 2011


size(400,400);
background (140,160,190);
noFill();
smooth();


float x,y,wd,ht;

x=200; 
y=200;
wd=375;
ht=375;

//circle
fill(250,200,140);
noStroke();
ellipse (x,y,wd+(.025*wd),ht+(.025*ht));

strokeWeight(2);
stroke(140,160,190);
ellipse (x,y,wd,ht);



strokeWeight(2);
stroke(240,90,50);

//C
beginShape();
curveVertex( x-(.1*wd),y-(.3*ht));
curveVertex( x-(.1*wd),y-(.3*ht));
curveVertex(x-(.32*wd), y-(.3*ht));
curveVertex(x-(.32*wd), y-(.3*ht));
curveVertex( x-(.32*wd), y+(.3*ht));
curveVertex(x-(.32*wd), y + (.3*ht));
curveVertex(x-(.1*wd), y+(.3*ht));
curveVertex(x-(.1*wd), y + (.3*ht));
endShape( );

//L
beginShape();
curveVertex(x,y-(.4*ht) );
curveVertex(x,y-(.4*ht) );
curveVertex(x,y+(.4*ht) );
curveVertex(x,y+(.4*ht) );
curveVertex(x+(.2*wd),y+(.4*ht) );
curveVertex(x+(.2*wd),y+(.4*ht) );
endShape();

//M
beginShape();
curveVertex(x+(.15*wd),y+(.3*ht) );
curveVertex(x+(.15*wd), y+(.3*ht) );
curveVertex(x+(.15*wd),y-(.25*ht) );
curveVertex(x+(.15*wd),y-(.25*ht) );
curveVertex(x+(.25*wd),y+(.1*ht) );
curveVertex(x+(.25*wd),y+(.1*ht) );
curveVertex(x+(.35*wd),y-(.25*ht) );
curveVertex(x+(.35*wd),y-(.25*ht) );
curveVertex(x+(.35*wd),y+(.3*ht) );
curveVertex(x+(.35*wd),y+(.3*ht) );
endShape();


