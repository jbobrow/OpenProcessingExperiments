
//Hannah Schmitt (hschmitt@andrew.cmu.edu)
//Homework 2
//Copyright Hannah Schmitt Carnegie Mellon University 2012

size(400,400);
smooth();
background(250,202,202);

float x,y,wd,ht;

x=200; // x and y variables taken from class notes
y=200;
wd=150;
ht=150;

noFill();
strokeWeight(4);
stroke(192,205,214);

ellipse(x, y, wd,ht); //inner circle

strokeWeight(2);
stroke(206,85,85);
ellipse(x, y, wd +(0.09*wd), ht+ (0.09*ht)); //middle circle

strokeWeight(2);
stroke(250,124,124);
ellipse(x, y, wd +(0.13*wd), ht+ (0.13*ht)); //outer circle

point(x-(0.33*wd), y+(0.285*ht)); //bottom of 'h'
point(x-(0.30*wd), y+(0.22*ht));
point(x-(0.25*wd), y+(0.14*ht));
point(x-(0.2*wd), y);
point(x-(0.15*wd), y-(0.3*ht));
point(x-(0.18*wd), y-(0.42*ht));
point(x-(0.34*wd), y-(0.3*ht)); //top left of 'h'

point(x-(0.16*wd), y-(0.12*ht)); //middle of 'h'
point(x-(0.05*wd), y-(0.14*ht)); 
point(x-(0.01*wd), y-(0.07*ht));
point(x-(0.01*wd), y+(0.01*ht));
point(x-(0.01*wd), y+(0.1*ht));
point(x, y+(0.18*ht));
point(x+(0.08*wd), y+(0.22*ht));
point(x+(0.18*wd), y+(0.22*ht)); //lower right of 'h


stroke(250,124,124);
strokeWeight(5);

beginShape();
curveVertex( x - ( .33 * wd),   y + ( .285 * ht) ); //control pt.
curveVertex(x-(0.33*wd), y+(0.285*ht)); //bottom of 'h'
curveVertex(x-(0.30*wd), y+(0.22*ht));
curveVertex(x-(0.25*wd), y+(0.14*ht));
curveVertex(x-(0.2*wd), y);
curveVertex(x-(0.15*wd), y-(0.3*ht));
curveVertex(x-(0.18*wd), y-(0.42*ht));
curveVertex(x-(0.34*wd), y-(0.3*ht)); //top left of 'h'
curveVertex(x-(0.25*wd), y-(0.3*ht)); //control pt. 2

endShape();

stroke(250,124,124); 

beginShape();
curveVertex( x - ( .2 * wd),   y); //control pt
curveVertex(x-(0.16*wd), y-(0.12*ht)); //middle of 'h'
curveVertex(x-(0.05*wd), y-(0.14*ht)); 
curveVertex(x-(0.01*wd), y-(0.07*ht));
curveVertex(x-(0.01*wd), y+(0.01*ht));
curveVertex(x-(0.01*wd), y+(0.1*ht));
curveVertex(x, y+(0.18*ht));
curveVertex(x+(0.08*wd), y+(0.22*ht));
curveVertex(x+(0.18*wd), y+(0.22*ht));
curveVertex(x+(0.18*wd), y+(0.22*ht)); //control pt.2
endShape();

strokeWeight(3);
stroke(100);
point(x+(0.3*wd), y); //top of 's'
point(x+(0.25*wd), y-(0.07*ht));
point(x+(0.15*wd), y-(0.08*ht));
point(x+(0.08*wd), y);
point(x+(0.08*wd), y+(0.10*ht));

point(x+(0.14*wd), y+(0.14*ht));
point(x+(0.25*wd), y+(0.16*ht));

point(x+(0.3*wd), y+(0.25*ht));
point(x+(0.28*wd), y+(0.35*ht));
point(x+(0.20*wd), y+(0.40*ht));
point(x+(0.12*wd), y+(0.44*ht));


strokeWeight(5);
stroke(206,85,85); 

beginShape();
curveVertex(x+(0.3*wd), y);//control pt
curveVertex(x+(0.3*wd), y); //top of 's'
curveVertex(x+(0.25*wd), y-(0.07*ht));
curveVertex(x+(0.15*wd), y-(0.08*ht));
curveVertex(x+(0.08*wd), y);
curveVertex(x+(0.08*wd), y+(0.10*ht));

curveVertex(x+(0.14*wd), y+(0.14*ht));
curveVertex(x+(0.25*wd), y+(0.16*ht));

curveVertex(x+(0.3*wd), y+(0.25*ht));
curveVertex(x+(0.28*wd), y+(0.35*ht));
curveVertex(x+(0.20*wd), y+(0.40*ht));
curveVertex(x+(0.12*wd), y+(0.44*ht));
curveVertex(x+(0.12*wd), y+(0.44*ht));//control pt 2
endShape();

//saveFrame("hw2.jpg");



