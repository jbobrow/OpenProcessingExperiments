
// Homework #2
// Hyunjook, 51-257 A
// Copyright 2012 Hyunjoo Kim

// style
size (400, 400);
background (125, 191, 203);
smooth ();

// variables
float x, y, wd, ht;
x = 200;
y = 200;
wd = 300;
ht = 300;

// outer circle
ellipseMode(CENTER);
fill(210,240,245);
noStroke( );
ellipse (x, y, wd+80, ht+80);

// inner circle
ellipseMode(CENTER);
fill(255);
stroke(106,192,206);
strokeWeight(20);
ellipse (x, y, wd, ht);

noFill();
stroke(62,146,162);
strokeWeight(15);
beginShape( );
curveVertex(x-(.23*wd), y-(.42*ht)); // control point
curveVertex(x-(.25*wd), y-(.4*ht)); // top of h
curveVertex(x-(.38*wd), y-(.25*ht));
curveVertex(x-(.45*wd), y);
curveVertex(x-(.38*wd), y+(.25*ht));
curveVertex(x-(.25*wd), y+(.4*ht));
curveVertex(x-(.23*wd), y+(.42*ht));
endShape();

beginShape( );
curveVertex(x-(.55*wd), y+(.35*ht)); // control point
curveVertex(x-(.45*wd), y+(.05*ht)); // right of h
curveVertex(x-(.38*wd), y-(.10*ht));
curveVertex(x-(.25*wd), y-(.13*ht));
curveVertex(x-(.15*wd), y);
curveVertex(x-(.18*wd), y+(.35*ht));
curveVertex(x-(.05*wd), y+(.4*ht)); 
endShape();

noFill();
stroke(69, 139, 191);
strokeWeight(15);
beginShape( );
curveVertex(x, y-(.25*ht)); // Control point
curveVertex(x, y-(.15*ht)); // j
curveVertex(x+(.01*wd), y);
curveVertex(x+(.01*wd), y+(.08*ht));
curveVertex(x+(.01*wd), y+(.28*ht));
curveVertex(x-(.05*wd), y+(.38*ht));
curveVertex(x-(.15*wd), y+(.43*ht));
curveVertex(x-(.19*wd), y+(.5*ht));
endShape( );

fill(69, 139, 191);
noStroke( );

ellipse (x, y-80, wd*0.08, ht*0.08); // top of j

noFill();
stroke(135, 95, 162);
strokeWeight(15);
beginShape(); 
curveVertex(x+(.1*wd), y-(.5*ht)); // Control point
curveVertex(x+(.1*wd), y-(.45*ht)); // left of k
curveVertex(x+(.15*wd), y-(.20*ht));
curveVertex(x+(.18*wd), y);
curveVertex(x+(.15*wd), y+(.20*ht));
curveVertex(x+(.1*wd), y+(.45*ht));
curveVertex(x+(.1*wd), y+(.5*ht));
endShape();

beginShape(); 
curveVertex(x+(.3*wd), y-(.28*ht)); // Control point
curveVertex(x+(.35*wd), y-(.3*ht)); // right of k
curveVertex(x+(.28*wd), y-(.10*ht));
curveVertex(x+(.2*wd), y);
curveVertex(x+(.28*wd), y+(.10*ht));
curveVertex(x+(.35*wd), y+(.3*ht));
curveVertex(x+(.3*wd), y+(.28*ht));
endShape();

//saveFrame("hw2.jpg");

