
// Samantha Chiu scchiu 2014
size (400, 400);
strokeWeight (5); 
background (160,197,229, 100);

float x=0;
float y=0;
float w=400;
float h=400;

stroke(255);
beginShape();
  curveVertex(x+.2 * w, y+.2 * h); 
  curveVertex(x + .5 * w, y+ .1 *h);
  curveVertex(x+.7 * w, y+.2 * h); 
  curveVertex(x+.4*w, y+.3*h);

  
  stroke (153);
  curveVertex(x+.1 *w, y+.5*h);
  curveVertex(x+.59*w, y+.9*h);
  curveVertex(x+.77*w, y+.55*h);
  curveVertex(x+.4*w, y+.35*h);
endShape (CLOSE); 


