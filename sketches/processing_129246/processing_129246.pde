
//HW2 Stephanie Jeong yujeongj copyright 2014

size(400,400);
background(219,109,80);

float x=0;
float y=0;
float wd=400;
float ht=400;

//face
fill(241,216,181);
noStroke();
ellipse(x+.5*wd, y+.5*ht,.5*wd,.5*ht);

//ears
ellipse(x+.25*wd, y+.5*ht,.1*wd,.15*ht);
ellipse(x+.75*wd, y+.5*ht,.1*wd,.15*ht);

//moustache
fill(194,187,168);
quad(x+.4*wd, y+.65*ht, x+.45*wd, y+.6*ht, x+.55*wd, y+.6*ht, x+.6*wd, y+.65*ht);


//nose(initial "J")
fill(241,216,181);
stroke(167,147,126);
strokeWeight(3);
beginShape();
curveVertex(x+.5*wd,y);
curveVertex(x+.5*wd,y+.45*ht);
curveVertex(x+.52*wd,y+.6*ht);
curveVertex(x+.47*wd,y+.58*ht);
curveVertex(x+.45*wd,y+.55*ht);
endShape();

//glasses
stroke(93,107,116);
strokeWeight(5);
rect(x+.3*wd, y+.45*ht, .15*wd, .1*ht);
rect(x+.55*wd, y+.45*ht, .15*wd, .1*ht);
line(x+.45*wd,y+.5*ht,x+.55*wd,y+.5*ht);

//eyes
fill(44,52,59);
noStroke();
ellipse(x+.375*wd, y+.5*ht,.03*wd,.03*ht);
ellipse(x+.625*wd, y+.5*ht,.03*wd,.03*ht);

//hair
fill(194,187,168);
beginShape();
curveVertex(x,y);
curveVertex(x+.2*wd,y+.325*ht);
curveVertex(x+.5*wd,y+.4*ht);
curveVertex(x+.72*wd,y+.32*ht);
curveVertex(x+.6*wd,y+.23*ht);
curveVertex(x+.2*wd,y+.325*ht);
curveVertex(x+.4*wd,y+.32*ht);
curveVertex(x+.2*wd,y+.325*ht);
curveVertex(x,y);
endShape();



