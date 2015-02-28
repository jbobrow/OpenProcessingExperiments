
// Nema Rao 
// pmrao
// copyright Nema Rao 2013
// ICE 2 assymetrical figure 8

size (400, 400);
background (#C3CCC8);
 
float x = 0;
float y = 0;
float wd = 400;
float ht = 400;

noFill();
strokeWeight(5);

beginShape();

curveVertex(x + 0.5*wd, y + 0.75*ht); 
curveVertex(x + 0.5*wd,  y + 0.25*ht);

curveVertex(x + 0.7*wd, y + 0.45*ht);
curveVertex(x + 0.35*wd, y + 0.35*ht);
 
curveVertex(x + 0.3*wd,  y + 0.6*ht);
curveVertex(x + 0.5*wd,  y + 0.6*ht);
curveVertex(x + 0.85*wd,  y + 0.75*ht);
 
curveVertex(x + 0.5*wd,  y + 0.25*ht);
curveVertex(x + 0.55*wd, y + 0.5*ht); //end point
 
endShape();



