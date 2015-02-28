
background(255,82,82);
int x, y, wd, ht;
x=0;
y=0;
wd=300;
ht=300;

size(x+wd, y+ht);

fill(255,129,129);
noStroke();
ellipse(x+.5*wd, y+.5*ht, wd, ht);

stroke(255,183,0);
strokeWeight(20);
noFill();


line(x+.25*wd,y+.25*ht,x+.25*wd,y+.75*ht);

beginShape();
curveVertex(x+.6*wd,y+.5*ht);
curveVertex(x+.6*wd,y+.5*ht);
curveVertex(x+.25*wd,y+.58*ht);
curveVertex(x+.4*wd,y+.75*ht);
curveVertex(x+.8*wd,y+.75*ht);
endShape();

beginShape();
curveVertex(x+.5*wd,y+.25*ht);
curveVertex(x+.5*wd,y+.25*ht);
curveVertex(x+.5*wd,y+.68*ht);
curveVertex(x+.56*wd,y+.75*ht);
curveVertex(x+.6*wd,y+.75*ht);
endShape();

point(x+.7*wd,y+.75*ht);

