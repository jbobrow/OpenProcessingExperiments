
//homework #2 1.24.12
//copyright Victoria Adams
 
size (400, 400);
background (209, 241, 250);
smooth ();
 
float x, y, d;
x = 200.0;
y = 200.0;
d = 200.0;

stroke (88, 242, 238);
strokeWeight (.01*d);
noFill ();
ellipse (x, y, d, d);

//letter A
 
stroke (88, 242, 238);
strokeWeight (.03*d);
line (x - .05*d, y + .5*d, x + .15*d, y);
 
stroke (88, 242, 238);
strokeWeight (.05*d);
beginShape ();
curveVertex (x + .3*d, y);
curveVertex (x + .15*d, y);
curveVertex (x + .25*d, y + .15*d);
curveVertex (x + .45*d, y + .25*d);
curveVertex (x + .4*d, y + .3*d);
endShape();
 
stroke (88, 242, 238);
strokeWeight (.03*d);
line (x + .04*d, y + .30*d, x + .25*d, y + .15*d);

//letter V
 
stroke (53, 116, 131);
strokeWeight (.03*d);
line (x - .35*d, y - .35*d, x - .1*d, y);
 
stroke (53, 116, 131);
strokeWeight (.05*d);
noFill();
beginShape ();
curveVertex (x + .1*d, y + .15*d);
curveVertex (x - .1*d, y);
curveVertex (x, y - .25*d);
curveVertex (x + .2*d, y - .44*d);
curveVertex (x + .35*d, y - .5*d);
endShape();
