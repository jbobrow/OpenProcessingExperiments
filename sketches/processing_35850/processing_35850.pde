

//homeowrk 2-assignment-2
//copyright of varsha padmanabhan,sept2011,pittsburgh,PA

size(500,500);
background(125,125,118);
float x,y,wd,ht;
x=250;
y=250;
wd=50;
ht=50;

// base circle
fill(125,125,118);
stroke(230,125,118);
strokeWeight(2);
ellipse(x,y,8*wd,8*ht);
strokeWeight(10);
smooth();
//alphabet v
beginShape();
stroke(100,30,100);
curveVertex(x-0.4*wd,y-0.6*ht);
curveVertex(x-.75*wd,y-1*ht);
curveVertex(x-1.5*wd,y+.15*ht);
curveVertex(x-1.5*wd,y+2*ht);
curveVertex(x-1.1*wd,y+2*ht);
curveVertex(x+.75*wd,y-1.5*ht);
curveVertex(x+0.5*wd,y-2*ht);
curveVertex(x-0.6*wd,y-0.25*ht);
endShape();
//alphabet n
beginShape();
stroke(100,45,8);
curveVertex(x-.5*wd,y+.5*ht);
curveVertex(x+.5*wd,y+3.5*ht);
curveVertex(x+1.5*wd,y+1.55*ht);
curveVertex(x+2.5*wd,y+3*ht);
curveVertex(x+3*wd,y-1*ht);
curveVertex(x+2.5*wd,y-.75*ht);
curveVertex(x-1*wd,y+1*ht);
endShape();
//alphabet p
beginShape();
stroke(30,20,20);
curveVertex(x+.6*wd,y-.25*ht);
curveVertex(x+.6*wd,y+.25*ht);
curveVertex(x-1*wd,y+3.5*ht);
curveVertex(x+.6*wd,y+.25*ht);
curveVertex(x+2.25*wd,y+.75*ht);
curveVertex(x+2*wd,y+1.25*ht);
curveVertex(x-.3*wd,y+1.25*ht);
curveVertex(x-.8*wd,y-.5*ht);
endShape();

//smiley
stroke(50,50,20);
ellipse (x-.5*x,y-.5*y,wd/5,ht/5);
ellipse (x-.25*x,y-.5*y,wd/5,ht/5);
//smiley 2
stroke(230,125,118);
strokeWeight(4);
beginShape();
curveVertex(x-.5*wd,y-1*ht);
curveVertex(x-1.5*wd,y+2.75*ht);
curveVertex(x-2*wd,y+3.5*ht);
curveVertex(x-3*wd,y+2.5*ht);
curveVertex(x-1.5*wd,y+2.75*ht);
curveVertex(x-1.5*wd,y-1*ht);
endShape();



