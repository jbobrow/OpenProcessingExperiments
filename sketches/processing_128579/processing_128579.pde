
//copyright Leslie Bloomfield lbloomfi 2014
size (400, 400);
background (195, 255, 3);
noFill();
stroke(35, 21, 255);
strokeWeight(20);

float x = 0;
float y = 0;
float wt = 400;
float ht = 400;

beginShape();
curveVertex(x + 0.5*wt, y + 0.75*ht); //reference point


curveVertex(x + 0.5*wt,  y + 0.25*ht); 
curveVertex(x + 0.75*wt, y + 0.35*ht);
curveVertex(x + 0.25*wt, y + 0.4*ht);

curveVertex(x + 0.2*wt,  y + 0.6*ht);
curveVertex(x + 0.45*wt,  y + 0.8*ht);
curveVertex(x + 0.85*wt,  y + 0.75*ht);

curveVertex(x + 0.5*wt,  y + 0.25*ht);


curveVertex(x + 0.75*wt, y + 0.25*ht); //end point









endShape();




