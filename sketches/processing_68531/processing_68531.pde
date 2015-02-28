
//Zhaochang He (Zhaochah@andrew.cmu.edu  
//Homework 2

size(400,400);
smooth();
background(#CCCCFF);

float x, y, w, h;
x = 200;
y = 200;
w = 300;
h = 300;


//ellipse decoration

noFill();
strokeWeight(15);
stroke(#CCFFFF);
ellipse(x,y,w+0.60*w,h+0.60*h);


noFill();
strokeWeight(25);
stroke(#FFCCFF);
ellipse(x,y,w+0.40*w,h+0.40*h);

noFill();
strokeWeight(15);
stroke(#FF99CC);
ellipse(x,y,w+0.20*w,h+0.20*h);

noFill();
strokeWeight(25);
stroke(#33FFCC);
ellipse(x,y,w,h);

noFill();
strokeWeight(10);
stroke(#CCFFFF);
ellipse(x, y, w-0.2*w, h-0.2*h);

noFill();
strokeWeight(20);
stroke(#CC99FF);
ellipse(x, y, w-0.4*w, h-0.4*h);

noFill();
strokeWeight(25);
stroke(#99FFFF);
ellipse(x, y, w-0.7*w, h-0.7*h);


// rotate flower
stroke(100,100,100);
strokeWeight(3);
fill(#FFFF00);
beginShape();
curveVertex(x+.2*w, y-.05*w);
curveVertex(x,y);
curveVertex(x-.2*w, y+.05*w);
curveVertex(x-.25*w, y-.05*w);
curveVertex(x-.2*w, y-.1*w);
curveVertex(x,y);
endShape();

translate(w, h/100);
rotate(PI/3.0);
beginShape();
curveVertex(x+.2*w, y-.05*w);
curveVertex(x,y);
curveVertex(x-.2*w, y+.05*w);
curveVertex(x-.25*w, y-.05*w);
curveVertex(x-.2*w, y-.1*w);
curveVertex(x,y);
endShape();

translate(w, h/12-.1*h);
rotate(PI/2.0);
beginShape();
curveVertex(x+.2*w, y-.05*w);
curveVertex(x,y);
curveVertex(x-.2*w, y+.05*w);
curveVertex(x-.25*w, y-.05*w);
curveVertex(x-.2*w, y-.1*w);
curveVertex(x,y);
endShape();

