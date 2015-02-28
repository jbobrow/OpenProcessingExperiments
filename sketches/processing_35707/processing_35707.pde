
//homework 2
//copyright Erica Gatts August 2011 Pittsburgh, PA 15214
size(400, 400);
background(250, 101, 178);
smooth();

float x, y, dia; //setting up my variables
x = 200;
y = 200;
dia = 300;
noStroke();
fill(250, 175, 215);
ellipse(x, y, dia, dia);

noFill(); //this is my "E" curve
stroke(0, 0, 0);
strokeWeight(6);
bezier(x-.12*dia, y-.49*dia, x-.65*dia, y-.25*dia, x-.65*dia, y+.25*dia, x-.1*dia, y+.49*dia);
strokeWeight(2);
line(x-.49*dia, y+.15*dia, x+.09*dia, y-.11*dia); //the middle lines of the "E"
line(x-.5*dia, y+.13*dia, x+.09*dia, y-.13*dia); 

stroke(137, 237, 31);//this is my "A"
beginShape(); //this is the top curve of my "A"
strokeWeight(6);
curveVertex(x-.12*dia, y-.49*dia);
curveVertex(x-.1*dia, y-.5*dia);
curveVertex(x-.05*dia, y-.51*dia); 
curveVertex(x+.03*dia, y-.51*dia);
curveVertex(x+.06*dia, y-.505*dia);
endShape();
strokeWeight(3);
line(x-.08*dia, y-.505*dia, x-.08*dia, y+.48*dia);
line(x-.1*dia, y-.49*dia, x-.1*dia, y+.48*dia);

beginShape( ); //this is the top of my "G"
stroke(255, 57, 3);
strokeWeight(5);
curveVertex(x+.3*dia, y-.35*dia);
curveVertex(x+.3*dia, y-.4*dia);
curveVertex(x+.19*dia, y-.463*dia); 
curveVertex(x+.045*dia, y-.5*dia);
curveVertex(x+.001*dia, y-.5*dia);
endShape();

beginShape();
line(x+.15*dia, y+.47*dia, x+.04*dia, y-.5*dia);
strokeWeight(5);
curveVertex(x+.5*dia, y-.4*dia); 
curveVertex(x+.5*dia, y+.01*dia);  
curveVertex(x+.4*dia, y+.3*dia);
curveVertex(x+.15*dia, y+.48*dia); 
curveVertex(x, y+.4*dia); 
endShape( );
strokeWeight(4);
rect(x+.25*dia, y-.015*dia, .25*dia, .025*dia);

//saveFrame("hmwk2.jpg");


