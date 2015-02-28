
//Homework 6 - 60-257
// copyright Eric Mackie September 2011 Pittsburgh, PA 15221

int xPos = 20;

void setup(){
  size(400,400);
  ellipseMode(CENTER);
  background(185,225,135);
}

void draw(){
  while((xPos<width)){
    initials (xPos,xPos,40);
    initials (xPos, height-xPos,40);
    initials (xPos+width/2, xPos, 40);
    initials (xPos-width/2, xPos, 40);
    initials (xPos+width/2, height-xPos, 40);
    initials (xPos-width/2, height-xPos, 40);
  xPos=xPos+40;
  }
}


void initials (float x, float y, float d){
  fill(245,205,125);
stroke(135,100,15);
strokeWeight(.0125*d);
ellipse(x,y,d,d);

//Curve Sets
smooth();
strokeWeight(.01*d);
stroke(55,155,50);
noFill();

//Backbone E
beginShape();
curveVertex(x-.45*d, y-.35*d);
curveVertex(x-.425*d, y-.23*d);
curveVertex(x-.4*d, y);
curveVertex(x-.425*d, y+.23*d);
curveVertex(x-.45*d, y+.4*d);
endShape();

beginShape();
curveVertex(x-.48*d, y-.4*d);
curveVertex(x-.44*d, y-.2*d);
curveVertex(x-.415*d, y);
curveVertex(x-.44*d, y+.2*d);
curveVertex(x-.48*d, y+.4*d);
endShape();

//Top E
beginShape();
curveVertex(x, y-.1*d);
curveVertex(x-.45*d, y-.05*d);
curveVertex(x-.325*d, y-.35*d);
curveVertex(x-.25*d, y-.15*d);
curveVertex(x-.1*d, y);
endShape();

//Bottom E
beginShape();
curveVertex(x, y+.1*d);
curveVertex(x-.45*d, y+.05*d);
curveVertex(x-.325*d, y+.35*d);
curveVertex(x-.25*d, y+.15*d);
curveVertex(x-.1*d, y);
endShape();

//Middle Bar E
beginShape();
curveVertex(x-.5*d, y+.1*d);
curveVertex(x-.45*d, y-.025*d);
curveVertex(x-.4*d, y+.025*d);
curveVertex(x-.3*d, y-.02*d);
curveVertex(x-.25*d, y);
endShape();

beginShape();
curveVertex(x-.5*d, y-.1*d);
curveVertex(x-.45*d, y+.025*d);
curveVertex(x-.4*d, y-.025*d);
curveVertex(x-.3*d, y+.02*d);
curveVertex(x-.25*d, y);
endShape();

//Left Column M
beginShape();
curveVertex(x-.225*d, y-.5*d);
curveVertex(x-.17*d, y-.45*d);
curveVertex(x-.225*d, y-.25*d);
curveVertex(x-.17*d, y-.1*d);
curveVertex(x-.225*d, y+.25*d);
curveVertex(x-.17*d, y+.45*d);
curveVertex(x-.225*d, y+.5*d);
endShape();

beginShape();
curveVertex(x-.24*d, y-.5*d);
curveVertex(x-.185*d, y-.44*d);
curveVertex(x-.24*d, y-.25*d);
curveVertex(x-.185*d, y-.1*d);
curveVertex(x-.24*d, y+.25*d);
curveVertex(x-.185*d, y+.44*d);
curveVertex(x-.24*d, y+.5*d);
endShape();

beginShape();
curveVertex(x-.17*d, y-.5*d);
curveVertex(x-.225*d, y-.4*d);
curveVertex(x-.17*d, y-.25*d);
curveVertex(x-.225*d, y);
curveVertex(x-.17*d, y+.15*d);
curveVertex(x-.225*d, y+.4*d);
curveVertex(x-.17*d, y+.5*d);
endShape();

//Right Column M
beginShape();
curveVertex(x+.225*d, y-.5*d);
curveVertex(x+.17*d, y-.45*d);
curveVertex(x+.225*d, y-.25*d);
curveVertex(x+.17*d, y-.1*d);
curveVertex(x+.225*d, y+.25*d);
curveVertex(x+.17*d, y+.45*d);
curveVertex(x+.225*d, y+.5*d);
endShape();

beginShape();
curveVertex(x+.24*d, y-.5*d);
curveVertex(x+.185*d, y-.44*d);
curveVertex(x+.24*d, y-.25*d);
curveVertex(x+.185*d, y-.1*d);
curveVertex(x+.24*d, y+.25*d);
curveVertex(x+.185*d, y+.44*d);
curveVertex(x+.24*d, y+.5*d);
endShape();

beginShape();
curveVertex(x+.17*d, y-.5*d);
curveVertex(x+.225*d, y-.4*d);
curveVertex(x+.17*d, y-.25*d);
curveVertex(x+.225*d, y);
curveVertex(x+.17*d, y+.15*d);
curveVertex(x+.225*d, y+.4*d);
curveVertex(x+.17*d, y+.5*d);
endShape();

//V of M
beginShape();
curveVertex(x-.25*d, y-.1*d);
curveVertex(x-.23*d, y-.35*d);
curveVertex(x+.02*d, y);
curveVertex(x-.025*d, y+.15*d);
curveVertex(x-.2*d, y+.35*d);
endShape();

beginShape();
curveVertex(x+.25*d, y-.1*d);
curveVertex(x+.23*d, y-.35*d);
curveVertex(x-.02*d, y);
curveVertex(x+.025*d, y+.15*d);
curveVertex(x+.2*d, y+.35*d);
endShape();

//Down Teardrop
beginShape();
curveVertex(x,y);
curveVertex(x-.025*d, y+.2*d);
curveVertex(x+.15*d, y+.4*d);
curveVertex(x, y+.48*d);
curveVertex(x-.15*d, y+.4*d);
curveVertex(x+.025*d, y+.2*d);
curveVertex(x,y);
endShape();

//Up Teardrop
beginShape();
curveVertex(x,y);
curveVertex(x-.025*d, y-.2*d);
curveVertex(x+.15*d, y-.4*d);
curveVertex(x, y-.48*d);
curveVertex(x-.15*d, y-.4*d);
curveVertex(x+.025*d, y-.2*d);
curveVertex(x,y);
endShape();


//D Backbone
beginShape();
curveVertex(x, y-.5*d);
curveVertex(x+.24*d, y-.41*d);
curveVertex(x+.3*d, y);
curveVertex(x+.24*d, y+.41*d);
curveVertex(x, y+.5*d);
endShape();

beginShape();
curveVertex(x, y-.5*d);
curveVertex(x+.27*d, y-.4*d);
curveVertex(x+.32*d, y);
curveVertex(x+.27*d, y+.4*d);
curveVertex(x, y+.5*d);
endShape();

//D )curve
beginShape();
curveVertex(x,y);
curveVertex(x+.25*d, y+.15*d);
curveVertex(x+.325*d, y+.35*d);
curveVertex(x+.475*d, y);
curveVertex(x+.325*d, y-.35*d);
curveVertex(x+.25*d, y-.15*d);
curveVertex(x,y);
endShape();
}
                
