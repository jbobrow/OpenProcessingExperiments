
// Selon un concept de Simon Desjardins
 
PImage serpentImg;
 
float cibleX,cibleY;
 
float serpentX, serpentX1, serpentX2, serpentX3, serpentX4;
float serpentY, serpentY1, serpentY2, serpentY3, serpentY4;
 
int opacite;
boolean fadeOut;
 
void setup() {
  
  size(400,400);
  serpentImg = loadImage("follow.png");
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
 
   serpentX4 = ( serpentX3 - serpentX4) / 15 + serpentX4;
  serpentY4 = ( serpentY3 - serpentY4) / 15 + serpentY4;
  fill(62,53,26,50);
  ellipse(serpentX4,serpentY4,serpentImg.width * 0.3,serpentImg.height * 0.3);
 
  serpentX3 = ( serpentX2 - serpentX3) / 15 + serpentX3;
  serpentY3 = ( serpentY2 - serpentY3) / 15 + serpentY3;
  fill(129,101,35,60);
  ellipse(serpentX3,serpentY3,serpentImg.width * 0.5,serpentImg.height * 0.5);
 
  serpentX2 = ( serpentX1 - serpentX2) / 15 + serpentX2;
  serpentY2 = ( serpentY1 - serpentY2) / 15 + serpentY2;
  fill(27,69,129,80);
  ellipse(serpentX2,serpentY2,serpentImg.width * 0.66,serpentImg.height * 0.66);
 
  serpentX1 = ( serpentX - serpentX1) / 15 + serpentX1;
  serpentY1 = ( serpentY - serpentY1) / 15 + serpentY1;
  fill(178,51,48,90);
  ellipse(serpentX1,serpentY1,serpentImg.width * 0.75,serpentImg.height * 0.75);
 
  serpentX = ( cibleX - serpentX ) / 15 + serpentX;
  serpentY = ( cibleY - serpentY ) / 15 + serpentY;
 
  tint(255,constrain(map(opacite,75,100,0,255),0,255));
  image(serpentImg,serpentX,serpentY);
   

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


