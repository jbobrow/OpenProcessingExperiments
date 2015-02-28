
//copyright Irene Joung 2014
//51-257: ICE#2

size(400,400);
background(255,139,141);
strokeWeight(5);

float x=20;
float y=20;
float wd=400;
float ht=400;
fill(43,121,162);
beginShape();
  curveVertex(x+2*wd,y);
  curveVertex(x+.5*wd, y+.2*ht);
  curveVertex(x+.2*wd, y+.4*ht);
  curveVertex(x+.5*wd, y+.6*ht);
  curveVertex(x+.8*wd, y+.8*ht);
  curveVertex(x+.6*wd, y+.9*ht);
  curveVertex(x+.3*wd, y+.7*ht);
  curveVertex(x+.5*wd, y+.6*ht);
  curveVertex(x+.7*wd, y+.4*ht);
  curveVertex(x+.5*wd, y+.2*ht);
  curveVertex(x-2*wd,y);
  endShape();
 


