
// Selon un concept de Simon Desjardins 

PImage serpentImg;

float cibleX,cibleY;

float serpentX, serpentX1, serpentX2, serpentX3;
float serpentY, serpentY1, serpentY2, serpentY3;

int opacite;
boolean fadeOut;

void setup() {
  size(400,400);
  serpentImg = loadImage("bouchard.png");
  imageMode(CENTER);
  smooth();

  opacite = 100;
  fadeOut = false;
  
  noStroke();
}


void draw() {
  background(0);

  if ( fadeOut ) {
    opacite = max(0,opacite-2);
  } else {
     opacite = min(100,opacite+2);
  }


  serpentX3 = ( serpentX2 - serpentX3) / 15 + serpentX3;
  serpentY3 = ( serpentY2 - serpentY3) / 15 + serpentY3;
  fill(110,90,80,constrain(map(opacite,0,25,0,255),0,255));
  ellipse(serpentX3,serpentY3,serpentImg.width * 0.5,serpentImg.height * 0.5);

  serpentX2 = ( serpentX1 - serpentX2) / 15 + serpentX2;
  serpentY2 = ( serpentY1 - serpentY2) / 15 + serpentY2;
  fill(200,140,120,constrain(map(opacite,25,50,0,255),0,255));
  ellipse(serpentX2,serpentY2,serpentImg.width * 0.66,serpentImg.height * 0.66);

  serpentX1 = ( serpentX - serpentX1) / 15 + serpentX1;
  serpentY1 = ( serpentY - serpentY1) / 15 + serpentY1;
  fill(230,180,160,constrain(map(opacite,50,75,0,255),0,255));
  ellipse(serpentX1,serpentY1,serpentImg.width * 0.75,serpentImg.height * 0.75);

  serpentX = ( cibleX - serpentX ) / 15 + serpentX;
  serpentY = ( cibleY - serpentY ) / 15 + serpentY;

  tint(255,constrain(map(opacite,75,100,0,255),0,255));
  image(serpentImg,serpentX,serpentY);
  
  fill(255,0,0,constrain(map(opacite,75,100,255,0),0,255));
  ellipse(serpentX-24,serpentY+5,5,5);
  ellipse(serpentX+22,serpentY+4,5,5);
}

void mousePressed() {

  if (mouseButton == LEFT) { 
    cibleX = mouseX;
    cibleY = mouseY;
  } 
  else {
    fadeOut = !fadeOut;
  }
}


