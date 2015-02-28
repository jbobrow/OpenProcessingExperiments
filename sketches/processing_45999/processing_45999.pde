
float [] lineX = new float [1100];
float [] lineY = new float [1100];
float xpos=0;
float ypos=0;
float xspeed=3;
float yspeed=2;
float wW = 40;
float wH = 20;
float iW = 19;
float pW = 9;
PImage oath;

void setup() {
  size(774,600);
  oath=loadImage("oath.jpg");
  ellipseMode(CENTER);
  for (int i=0; i<lineX.length; i++) {
    lineX[i] = 0;
    lineY[i] = 0;
  }
}

void draw() {
  background(oath);
  smooth();
  
  for (int i=0; i<lineX.length-1; i++) {
    lineX[i] = lineX[i+1];
    lineY[i] = lineY[i+1];
  }
  lineX[lineX.length-1] = xpos;
  lineY[lineY.length-1] = ypos;
  
  for (int i=1; i<lineX.length; i++) {
    stroke(255,0,200);
    strokeWeight(4);
    line(lineX[i],lineY[i],lineX[i-1],lineY[i-1]);
  }
  
  noStroke();
  fill(255);
  ellipse(xpos,ypos,wW,wH);
  fill(0,100,255);
  ellipse(xpos,ypos,iW,iW);
  fill(0);
  ellipse(xpos,ypos,pW,pW);
  xpos = xpos + xspeed;
  ypos = ypos + yspeed;
  if(xpos>width || xpos<0) {
    xspeed=(xspeed+random(-2,2)) * -1;
    wW = wW*2;
    wH = wH*4;
    iW = iW*2;
    pW = pW*2;
  }
  if(ypos>height || ypos<0) {
    yspeed=(yspeed+random(-2,2)) * -1;
    wW = wW*2;
    wH = wH*4;
    iW = iW*2;
    pW = pW*2;
  }
  wW = constrain(wW-2, 40, 80);
  wH = constrain(wH-2, 20, 40);
  iW = constrain(iW-2, 19, 38);
  pW = constrain(pW-2, 9, 18);
  xspeed = constrain(xspeed, -10, 10);
  yspeed = constrain(yspeed, -10, 10);
  xpos = constrain(xpos, -3, width+3);
  ypos = constrain(ypos, -3, height+3);
}

void keyPressed() {
  for (int i=0; i<lineX.length; i++) {
    lineX[i] = 0;
    lineY[i] = 0;
  }
  xpos=0;
  ypos=0;
  xspeed=3;
  yspeed=2;
}

