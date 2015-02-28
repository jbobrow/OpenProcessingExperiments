
// hw2  11:30
// copyright Harris Mazur

size (400,400);
background(108,210,255);
strokeWeight ( 3);


float x= 150;
float y= 150;
float wd= 400;
float ht= 400;

fill(255,236,219);

ellipse (x, y-10, wd *.45, ht *.5);

fill (0);
strokeWeight ( 4);
stroke (0);

//glasses
beginShape ( LINES);
  vertex (x-.019*wd, y-.05*ht);
  vertex (x-.019*wd, y-.13*ht);
  vertex (x-.019*wd, y-.1*ht);
  vertex (x+.019*wd, y-.1*ht);
  vertex (x+.019*wd, y-.05*ht);
  vertex (x+.019*wd, y-.13*ht);
  
endShape ( );
stroke (224,185,25);
strokeWeight (3);
fill (229,252,252);
ellipse (x-.09*wd,y-.09*ht,wd*.12,ht*.12);
ellipse (x+.09*wd,y-.09*ht,wd*.12,ht*.12);
strokeWeight (15);
stroke (0);
beginShape (POINTS);
  vertex (x-.09*wd,y-.09*ht);
  vertex (x+.09*wd,y-.09*ht);
endShape ( );
  
//nose
fill (232,202,164);
strokeWeight (3);
beginShape ( );
  curveVertex (x-.01*wd, y-.05*ht);
  curveVertex (x, y-.03*ht);
  curveVertex (x+.05*wd, y+.08*wd);
  curveVertex (x-.05*wd, y+.08*wd);
  curveVertex (x,y-.03*ht);
  curveVertex (x+.01*wd, y-.05*ht);
endShape ();

//mustache
fill (255);
beginShape (TRIANGLES);
  vertex (x-.1*wd, y+.13*ht);
  vertex (x, y+.1*ht);
  vertex (x+.1*wd, y+.13*ht);
endShape ();

//mouth
noFill ( );
stroke (250,185,159);
strokeWeight (6);
beginShape ( );
  vertex (x-.075*wd, y+.16*ht);
  vertex (x-.03*wd, y+.145*ht);
  vertex (x, y+.16*ht);
  vertex (x+.03*wd, y+.145*ht);
  vertex (x+.075*wd, y+.16*ht);
endShape ();

//hair
stroke (0);
strokeWeight (3);
beginShape ( );
fill (255);

beginShape ( );
  curveVertex (x-.18*wd, y-.08*ht);
  curveVertex (x-.15*wd, y-.21*ht);
  curveVertex (x, y-.28*ht);
  curveVertex (x+.15*wd, y-.21*ht);
  curveVertex (x+.18*wd, y-.07*ht);
 endShape ( );
 


  

  







