
// ICE #2
// Kevin Kuntz

size(400,400);
background(0);

fill(255);
ellipse(200,200,275,275);

// Figure 8
// objectBoundary(150,87,100,225);

float x = 150;
float y = 87;
float wd = 100;
float ht = 225;

noFill();
stroke(0);
strokeWeight(10);

beginShape();
  curveVertex(x + .5*wd, y);
  curveVertex(x, y + .25*ht);
  curveVertex(x + .5*wd, y + .5*ht);
  curveVertex(x + wd, y + .75*ht);
  curveVertex(x + .3*wd, y + ht);
  curveVertex(x, y + .75*ht);
  curveVertex(x + .7*wd, y + .5*ht);
  curveVertex(x + .9*wd, y + .5*ht); 
  curveVertex(x + .7*wd, y);
  curveVertex(x, y + .25*ht);
  curveVertex(x + .5*wd, y + .5*ht);
endShape();





