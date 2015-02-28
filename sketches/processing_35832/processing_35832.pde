
//homework 2, CFA 257
//copyright Jessica Schafer Sept. 2011, Pittsburgh PA

size(400,400);
smooth();
background (255,250,162);

float x, y, d;
x=200;
y=200;
d=350;

//CIRCLE
noStroke();
//fill(252,162,71);
fill(217,0,94);
ellipse (x, y, d, d);
noFill();

//HIGHLIGHT
strokeWeight (.05*d);

//S highlight
stroke (255,213,107); 
beginShape();
//first anchor point
vertex (x+.35*d, y-.15*d);
//beziers (control, control, anchor);
  bezierVertex (x+.425*d, y-.4*d,  x, y-.4*d,  x, y-.2*d);
  bezierVertex (x,y, x+.4*d,y, x+.4*d, y+.2*d);
  bezierVertex (x+.4*d, y+.4*d, x-.025*d, y+.4*d, x+.05*d, y+.15*d);
endShape();

//J highlight
beginShape();
  vertex (x-.35*d, y-.15*d);
  bezierVertex (x-.365*d, y-.275*d, x-.15*d, y-.375*d, x-.15*d, y-.32*d);
  vertex (x-.05*d, y+.2*d);
  bezierVertex (x-.05*d, y+.4*d, x-.45*d, y+.4*d, x-.4*d, y+.15*d);
endShape();

//H highlight
beginShape();
  vertex (x-.02*d, y-.05*d);
  bezierVertex (x-.05*d, y-.04*d, x-.05*d, y+.04*d, x-.02*d, y+.05*d);
endShape();
beginShape();
  vertex (x+.025*d, y-.05*d);
  bezierVertex (x+.055*d, y-.04*d, x+.055*d, y+.04*d, x+.025*d, y+.05*d);
endShape();
line (x-.03*d, y, x+.03*d, y);

//MAIN LETTERS
strokeWeight (.025*d);

//S
stroke (255,105,79); 
beginShape();
//first anchor point
vertex (x+.35*d, y-.15*d);
//beziers (control, control, anchor);
  bezierVertex (x+.425*d, y-.4*d,  x, y-.4*d,  x, y-.2*d);
  bezierVertex (x,y, x+.4*d,y, x+.4*d, y+.2*d);
  bezierVertex (x+.4*d, y+.4*d, x-.025*d, y+.4*d, x+.05*d, y+.15*d);
endShape();

//J
beginShape();
  vertex (x-.35*d, y-.15*d);
  bezierVertex (x-.365*d, y-.275*d, x-.15*d, y-.375*d, x-.15*d, y-.32*d);
  vertex (x-.05*d, y+.2*d);
  bezierVertex (x-.05*d, y+.4*d, x-.45*d, y+.4*d, x-.4*d, y+.15*d);
endShape();

//H
beginShape();
  vertex (x-.02*d, y-.05*d);
  bezierVertex (x-.05*d, y-.04*d, x-.05*d, y+.04*d, x-.02*d, y+.05*d);
endShape();
beginShape();
  vertex (x+.025*d, y-.05*d);
  bezierVertex (x+.055*d, y-.04*d, x+.055*d, y+.04*d, x+.025*d, y+.05*d);
endShape();
line (x-.03*d, y, x+.03*d, y);


