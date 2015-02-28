
// homework 2 
// Samantha Chiu Copyright 2014

size (400,400);
background (245, 198, 198);

//floats
float x=0;
float y=0;
float w=400;
float h=400;

//head
noStroke ();
fill (239, 215, 180);
ellipse (x+.5*w, y+.5*h, .5*w, .5*h);

//ears
ellipse (x+.3*w, y+.5*h, .15*w, .15*h);
ellipse (x+.7*w, y+.5*h, .15*w, .15*h);

//eyes
fill (156, 103, 209);
strokeWeight (2); 
stroke (209, 170, 255);
ellipse (x+.4*w, y+.55*h, .07*w, .08*h);
ellipse (x+.6*w, y+.55*h, .07*w, .08*h);

 //moustashe "S"
 stroke(142, 155, 122) ;
strokeWeight(7) ;
noFill();
beginShape() ;

  curveVertex(x+.5*w, y+.7*h) ;
  curveVertex(x+.45*w, y+.7*h) ;
  curveVertex(x+.49*w, y+.65*h) ;
  curveVertex(x+.53*w, y+.7*h) ;
  curveVertex(x+.57*w, y+.65*h) ;
  //curveVertex(x+.56*w, y+.75*h) ;
  curveVertex(x+.6*w, y+.5*h) ;
endShape() ;

//glasses
noFill();
stroke (255,255, 170);
strokeWeight (5);
rectMode (CENTER);
rect (x+.4*w, y+.55*h, .15*w, .13*h);
rect (x+.6*w, y+.55*h, .15*w, .13*h);




 

//hair
fill(148, 229, 227 );
noStroke();
beginShape();
curveVertex(x,y);
curveVertex(x+.2*w,y+.3*h);
curveVertex(x+.5*w,y+.4*h);
curveVertex(x+.7*w,y+.3*h);
curveVertex(x+.6*w,y+.2*h);
curveVertex(x+.2*w,y+.3*h);
curveVertex(x,y);
endShape();

 



