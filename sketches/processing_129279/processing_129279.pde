
// homework 2 51-757
// copyright eunki chung
// eunkic@andrew.cmu.edu

size (400, 400);
background (29, 89, 129);

float x, y, wd, ht;
x=0;
y=0;
wd=400;
ht=400;

//ears (inital C)
fill (255, 223, 167);
stroke (245, 106, 0);
strokeWeight(3);
ellipse (x + 0.175*wd, y + 0.45*ht, 0.2*wd, 0.2*ht);
ellipse (x + 0.815*wd, y + 0.45*ht, 0.2*wd, 0.2*ht);
strokeWeight(1.5);
ellipse (x + 0.18*wd, y + 0.45*ht, 0.15*wd, 0.15*ht);
ellipse (x + 0.82*wd, y + 0.45*ht, 0.15*wd, 0.15*ht);

//face
noStroke ();
ellipse (x + 0.5*wd, y + 0.5*ht, 0.75*wd, 0.75*ht);

//nose (rotated initial E ... more looks like W)
stroke (245, 106, 0);
strokeWeight(3);
beginShape();
  curveVertex( x + 0.25*wd, y + 0.525*ht);
  curveVertex( x + 0.4*wd, y + 0.525*ht );
  curveVertex( x + 0.45*wd , y + 0.575*ht );
  curveVertex( x + 0.5*wd , y + 0.525*ht );
  curveVertex( x + 0.55*wd , y + 0.575*ht ); 
  curveVertex( x + 0.6*wd , y + 0.525*ht );
  curveVertex( x + 0.75*wd, y + 0.525*ht);
endShape(); 

//mouth
fill (247, 108, 95);
noStroke ();
arc(x + 0.5*wd, y + 0.725*ht, 0.3*wd, 0.2*ht, 0, PI, OPEN);
 
//moustache
fill (196, 194, 194);
noStroke ();
beginShape();
  curveVertex( x + 0.3*wd, y + 0.7*ht);
    curveVertex( x + 0.35*wd, y + 0.7*ht );
      curveVertex( x + 0.4*wd , y + 0.65*ht );
        curveVertex( x + 0.5*wd , y + 0.7*ht );
      curveVertex( x + 0.6*wd , y + 0.65*ht ); 
    curveVertex( x + 0.65*wd , y + 0.7*ht );
  curveVertex( x + 0.7*wd, y + 0.7*ht);
endShape( ); 
 
//hair
beginShape();
  curveVertex( x + 0.2*wd, y + 0.9*ht);
    curveVertex( x + 0.25*wd, y + 0.25*ht );
      curveVertex( x + 0.4*wd , y + 0.1*ht );
      curveVertex( x + 0.6*wd , y + 0.1*ht );
    curveVertex( x + 0.75*wd , y + 0.25*ht );
  curveVertex( x + 0.8*wd, y + 0.9*ht);
endShape( ); 
 
//glasses
fill (196, 194, 194, 90);
stroke(99, 100, 100);
strokeWeight(3);
rect(x + 0.225*wd, y + 0.35*ht, 0.2*wd, 0.15*ht, 150);
rect(x + 0.575*wd, y + 0.35*ht, 0.2*wd, 0.15*ht, 150);
line (x + 0.425*wd, y + 0.425*ht, x + 0.575*wd, y + 0.425*ht);
 
//eyes
fill (255);
stroke (99, 100, 100);
strokeWeight(0.5);
ellipse (x + 0.325*wd, y + 0.425*ht, 0.1*wd, 0.1*ht);
ellipse (x + 0.675*wd, y + 0.425*ht, 0.1*wd, 0.1*ht);

fill (0);
noStroke ();
ellipse (x + 0.325*wd, y + 0.425*ht, 0.05*wd, 0.05*ht);
ellipse (x + 0.675*wd, y + 0.425*ht, 0.05*wd, 0.05*ht);


