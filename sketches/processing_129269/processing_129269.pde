
// eunki

size (400, 400);
background (29, 89, 129);
strokeWeight(3);
stroke(255, 95, 3);

float x;
x=0;
float y;
y=0;
float wd;
wd=400;
float ht;
ht=400;

point (x+0.25*wd, y+0.25*ht);

beginShape();
  fill(232, 197, 54);
  curveVertex(x+0.25*wd, y+0.25*ht); // reference point
  curveVertex(x+0.25*wd, y+0.25*ht);
  curveVertex(x+0.50*wd, y+0.125*ht);
  curveVertex(x+0.75*wd, y+0.25*ht);
  curveVertex(x+0.45*wd, y+0.55*ht);
  curveVertex(x+0.25*wd, y+0.75*ht);
  curveVertex(x+0.50*wd, y+0.95*ht);
  curveVertex(x+0.75*wd, y+0.75*ht);
  curveVertex(x+0.65*wd, y+0.35*ht);
  curveVertex(x+0.25*wd, y+0.25*ht);
  curveVertex(x+0.45*wd, y+0.125*ht);// reference point
endShape();





