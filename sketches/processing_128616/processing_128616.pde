
//copyright Yoon-ji Kim 2014
//ICE #2

size(400, 400);
background(216, 26, 26);
fill(211, 209, 209);

float x = 100;
float y = 50;
float wd = 100;
float ht = 140;

beginShape();
curveVertex(x-3.5*wd, y+ht);
curveVertex(x+wd, y+ht);
curveVertex(x+wd, y);
curveVertex(x, y);
curveVertex(x-.5*wd, y+ht);
curveVertex(x, y+ht);
curveVertex(x+2.5*wd,y+ht); 
curveVertex(x+wd, y+2.2*ht);
curveVertex(x-.2*wd, y+1.2*ht);
curveVertex(x+wd, y+ht);
curveVertex(x+3*wd, y);
endShape();



