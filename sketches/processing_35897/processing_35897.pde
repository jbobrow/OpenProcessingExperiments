
//Project 01: Face - Copyright: Eric Mackie, Sept. 2011
//EMS2 - Golan Levin


float x=200;
float y=250;
float wd=150;
float ht=200;

void setup(){
  setupAudio();
size(400,400);
}

void draw(){
background(25,25,125);
smooth();
getVolume();
float CHR = map(volume, 0,500, 0,255);
float CHG = map(volume, 0,500, 0,255);

//Bottom tips of Hair - Moving
float VB = map(volume, 0,500,y+.29*ht,y+.23*ht);
fill(CHR,CHG,0);
noStroke();
triangle(x-.35*wd,y+.17*ht, x-.3*wd,y+.23*ht,    x-.55*wd,VB);
triangle(x+.35*wd,y+.17*ht, x+.3*wd,y+.23*ht,    x+.55*wd,VB);

//Hair Perimeter - Stationary
quad(x-.5*wd,y+.1*ht, x-.63*wd,y, x-.6*wd,y-.07*ht, x-.48*wd,y-.1*ht);
quad(x-.48*wd,y-.1*ht, x-.68*wd,y-.25*ht, x-.6*wd,y-.36*ht, x-.4*wd,y-.29*ht);
quad(x-.4*wd,y-.29*ht, x-.48*wd,y-.5*ht, x-.35*wd,y-.6*ht, x-.15*wd,y-.48*ht);
quad(x-.15*wd,y-.48*ht, x-.19*wd,y-.7*ht, x+.05*wd,y-.65*ht, x+.12*wd,y-.45*ht);
quad(x+.4*wd,y-.2*ht, x+.56*wd,y-.25*ht, x+.61*wd,y-.15*ht, x+.48*wd,y);
quad(x+.48*wd,y-.03*ht, x+.65*wd,y-.04*ht, x+.63*wd,y+.05*ht, x+.45*wd,y+.15*ht);

//Face shape
arc(x,y,wd,ht, radians(180), radians(360));
fill(240,210,150);
arc(x,y+.01*ht,.9*wd,.43*ht, PI, TWO_PI);
quad(x,y+.45*ht, x-.325*wd,y+.3*ht, x-.5*wd,y, x,y);
quad(x,y+.45*ht, x+.325*wd,y+.3*ht, x+.5*wd,y, x,y);
quad(x-.325*wd,y+.3*ht, x-.075*wd,y+.45*ht, x+.075*wd,y+.45*ht, x+.325*wd,y+.3*ht);

//Ears
beginShape();
curveVertex(x+.45*wd, y-.001*ht);
curveVertex(x+.5*wd,y);
curveVertex(x+.55*wd, y-.01*ht);
curveVertex(x+.58*wd, y+.03*ht);
curveVertex(x+.51*wd, y+.15*ht);
curveVertex(x+.35*wd, y+.21*ht);
curveVertex(x, y+.3*ht);
endShape();

beginShape();
curveVertex(x-.45*wd, y-.001*ht);
curveVertex(x-.5*wd,y);
curveVertex(x-.55*wd, y-.01*ht);
curveVertex(x-.58*wd, y+.03*ht);
curveVertex(x-.51*wd, y+.15*ht);
curveVertex(x-.35*wd, y+.21*ht);
curveVertex(x, y+.3*ht);
endShape();

//Eyes
fill(255, 255, 255);
quad(x-.3*wd,y+.175*ht, x-.33*wd,y+.075*ht, x-.075*wd,y+.125*ht, x-.085*wd,y+.175*ht);
quad(x+.3*wd,y+.175*ht, x+.33*wd,y+.075*ht, x+.075*wd,y+.125*ht, x+.085*wd,y+.175*ht);
float CER = map(volume, 0,500, 0,55);
float CEG = map(volume, 0,500, 0,200);
float CEB = map(volume, 0,500, 0,250);
fill(CER,CEG,CEB);
ellipse(x-.15*wd,y+.12*ht, .075*wd, .075*wd);
ellipse(x+.15*wd,y+.12*ht, .075*wd, .075*wd);
stroke(0,0,0);
line(x-.3*wd,y+.175*ht, x-.33*wd,y+.075*ht);
line(x-.085*wd,y+.175*ht, x-.3*wd,y+.175*ht);
line(x+.3*wd,y+.175*ht, x+.33*wd,y+.075*ht);
line(x+.085*wd,y+.175*ht, x+.3*wd,y+.175*ht);
noStroke();

//EyeBrows
fill(CHR,CHG,0);
quad(x-.4*wd,y+.075*ht, x-.375*wd, y+.03*ht, x-.03*wd,y+.11*ht, x-.03*wd,y+.125*ht);
quad(x+.4*wd,y+.075*ht, x+.375*wd, y+.03*ht, x+.03*wd,y+.11*ht, x+.03*wd,y+.125*ht);
stroke(0,0,0);
line(x-.03*wd,y+.07*ht, x-.03*wd,y+.125*ht);
line(x+.03*wd,y+.07*ht, x+.03*wd,y+.125*ht);
noStroke();

//Nose
stroke(0,0,0);
line(x-.035*wd,y+.275*ht, x,y+.285*ht);
line(x+.035*wd,y+.275*ht, x,y+.285*ht);
fill(200,175,125);
triangle(x-.01775*wd,y+.28*ht, x-.01775*wd,y+.2*ht, x-.035*wd,y+.275*ht);
noStroke();

//Mouth and Chin
float M = map(volume, 0,500,0,.02*ht);
stroke(0,0,0);
line(x-.06*wd,y+.32*ht, x-.045*wd,y+.31*ht);
fill(0);
ellipse(x,y+.31*ht,.09*wd,M);
line(x+.045*wd,y+.308*ht, x+.06*wd,y+.32*ht);

beginShape();
curveVertex(x-.1*wd, y+.36*ht);
curveVertex(x-.04*wd, y+.35*ht);
curveVertex(x, y+.34*ht);
curveVertex(x+.04*wd, y+.35*ht);
curveVertex(x+.1*wd, y+.36*ht);
endShape();

//Hair (bangs - stationary)
noStroke();
fill(CHR,CHG, 0);
quad(x-.51*wd,y-.01*ht, x-.5*wd,y+.075*ht, x-.45*wd,y+.05*ht, x-.45*wd,y-.01*ht);
quad(x-.45*wd,y-.01*ht, x-.39*wd,y-.02*ht, x-.25*wd,y-.2*ht, x-.45*wd,y-.2*ht);
quad(x-.32*wd,y-.2*ht, x-.33*wd,y-.05*ht, x-.05*wd,y-.1*ht, x+.1*wd,y-.25*ht);
quad(x+.1,y-.25*ht, x-.03*wd,y-.05*ht, x+.15*wd,y-.05*ht, x+.4*wd,y-.2*ht);
quad(x+.28*wd,y-.15*ht, x+.305*wd,y-.07*ht, x+.4*wd,y-.04*ht, x+.45*wd,y-.18*ht);
quad(x+.42*wd,y-.1*ht, x+.415*wd,y+.05*ht, x+.51*wd,y+.025*ht, x+.51*wd,y-.01*ht);
triangle(x-.5*wd,y+.075*ht, x-.45*wd,y+.04*ht, x-.4*wd,y+.15*ht);
triangle(x-.48*wd,y-.01*ht, x-.37*wd,y-.05*ht, x-.3*wd,y+.1*ht); 
triangle(x-.05*wd,y-.11*ht, x-.33*wd,y-.051*ht, x-.2*wd, y+.15*ht);
triangle(x-.03*wd,y-.05*ht, x+.15*wd,y-.05*ht, x,y+.12*ht);
triangle(x+.305*wd,y-.073*ht, x+.4*wd,y-.043*ht, x+.24*wd,y+.05*ht);
triangle(x+.415*wd,y+.048*ht, x+.51*wd,y+.023*ht, x+.38*wd,y+.1*ht);


//Hair (tips) - Moving
float T1 = map(volume, 0,500,y-.02*ht,y-.1*ht);
float TX1 = map(volume, 0,500,x-.85*wd,x-.75*wd);
triangle(x-.625*wd,y, x-.595*wd,y-.07*ht,          TX1,T1);

float T2 = map(volume, 0,500,y-.28*ht,y-.45*ht);
float TX2 = map(volume, 0,500,x-.95*wd,x-.78*wd);
triangle(x-.675*wd,y-.25*ht, x-.595*wd,y-.36*ht,   TX2,T2);

float T3 = map(volume, 0,500,y-.65*ht,y-.85*ht);
float TX3 = map(volume, 0,500,x-.75*wd,x-.5*wd);
triangle(x-.475*wd,y-.5*ht, x-.345*wd,y-.6*ht,     TX3,T3);

float T4 = map(volume, 0,500,y-.85*ht,y-.95*ht);
float TX4 = map(volume, 0,500,x-.3*wd,x-.15*wd);
triangle(x-.19*wd,y-.695*ht, x+.05*wd,y-.645*ht,   TX4,T4);

float T5 = map(volume, 0,500,y-.22*ht,y-.35*ht);
float TX5 = map(volume, 0,500,x+.85*wd,x+.75*wd);
triangle(x+.555*wd,y-.25*ht, x+.605*wd,y-.15*ht,   TX5,T5);

float T6 = map(volume, 0,500,y+.02*ht,y-.075*ht);
float TX6 = map(volume, 0,500,x+.88*wd,x+.8*wd);
triangle(x+.645*wd,y-.04*ht, x+.625*wd,y+.05*ht,   TX6, T6);

//Hidden Tips
float T7 = map(volume, 0,500,y-.27*ht,y-.35*ht);
float TX7 = map(volume, 0,500,x-.34*wd,x-.45*wd);
triangle(x-.38*wd,y-.2*ht, x-.3*wd,y-.25*ht,         TX7, T7);

float T8 = map(volume, 0,500,y-.41*ht,y-.55*ht);
float TX8 = map(volume, 0,500,x-.15*wd,x-.21*wd);
triangle(x-.2*wd,y-.35*ht, x-.02*wd,y-.38*ht,         TX8, T8);

float T9 = map(volume, 0,500,y-.35*ht,y-.56*ht);
float TX9 = map(volume, 0,500,x+.2*wd,x+.25*wd);
triangle(x+.1*wd,y-.4*ht, x+.3*wd,y-.3*ht,         TX9, T9);

float T10 = map(volume, 0,500,y-.195*ht,y-.4*ht);
float TX10 = map(volume, 0,500,x+.32*wd,x+.4*wd);
triangle(x+.25*wd,y-.22*ht, x+.4*wd,y-.17*ht,         TX10, T10);
}

