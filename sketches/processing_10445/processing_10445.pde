
double zeit;
double geschwindigkeit,tmpGeschwindigkeit;
double grafitation=1.63;// Mond! Erde:9.81

float winkel,tmpWinkel;
//Siehe: http://de.wikipedia.org/wiki/Wurfparabel
void setup(){
  size(600,600);
  smooth();
  noStroke();
   background(0);
  zeit=1;
  geschwindigkeit=25;
  tmpGeschwindigkeit= geschwindigkeit;
  winkel=45;
  tmpWinkel=winkel;
}

void draw(){
  int startX=10;
  int startY=height/2;
  fill(0,0,0,10);
  rect(0,0,width,height);
  fill(255);
  int xpos=(int)(startX + wurf_x(zeit) );
  int ypos=(int)(startY -wurf_y(zeit) );
  ellipse(xpos,ypos,10,10); //Koordinatensystem nach unten!
  zeit+=0.4;
  
  if (xpos>width || ypos>height) {
    zeit=0; //Nach gweisser Zeit von vorn
    winkel=tmpWinkel;
    geschwindigkeit=tmpGeschwindigkeit;
  }
  float faktorY=1-mouseY/(float)height;
  tmpWinkel=90*faktorY;
  
  float faktorX=mouseX/(float)width;
  tmpGeschwindigkeit=10+26*faktorX;
  fill(0);
  rect(0,0,width,20);
  fill(255);
  text("Angle: "+tmpWinkel,10,15);
  text(" Speed: "+tmpGeschwindigkeit,width/2,15);
}

double  wurf_x(double zeit) { return geschwindigkeit*zeit*cos(radians(winkel)); }
double  wurf_y(double zeit) { return (geschwindigkeit*zeit*sin(radians(winkel)) - grafitation/2*zeit*zeit); }


