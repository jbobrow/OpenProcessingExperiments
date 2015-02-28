
/* Aneta Genova - Interactive Prototyping - Ryan Raffa - Final Project - May 13, 2013 */
/* Collaborative project: CLass Portrait. Photos submitted by students in class */
/* Click Click in the different corners to generate a new picture. */
/* Top left: random */
/* Lower left: type: Have a Great Summer */
/* Top right: neon photos */
/* Lower right: actual photos */

float randImg;
PShape[] typo = new PShape[4];
PImage[] photoFaces = new PImage[7];
PImage[] neonFaces = new PImage[7];

int corner = 3;
int type = 0;

PImage leftEye;
PImage rightEye;
PImage leftMouth;
PImage rightMouth;



void setup() {
 size(640,480);
 background(255);
 smooth();
 photoFaces[0] = loadImage("photo1.gif");
 photoFaces[1] = loadImage("photo2.gif");
 photoFaces[2] = loadImage("photo3.gif");
 photoFaces[3] = loadImage("photo4.gif");
 photoFaces[4] = loadImage("photo5.gif");
 photoFaces[5] = loadImage("photo6.gif");
 photoFaces[6] = loadImage("photo7.gif");
 neonFaces[0] = loadImage("neon1.gif");
 neonFaces[1] = loadImage("neon2.gif");
 neonFaces[2] = loadImage("neon3.gif");
 neonFaces[3] = loadImage("neon4.gif");
 neonFaces[4] = loadImage("neon5.gif");
 neonFaces[5] = loadImage("neon6.gif");
 neonFaces[6] = loadImage("neon7.gif");
 typo[0] = loadShape("typo1.svg");
 typo[1] = loadShape("typo2.svg");
 typo[2] = loadShape("typo3.svg");
 typo[3] = loadShape("typo4.svg");
 
}
void draw() {
  
 
 background(255);
 randImg = round(random(0,5));
if(corner==3){
  type = round(random(0,2));
}else{
  type=corner;
}
 switch(type) {
  case 0:
    image(photoFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(neonFaces[(int)randImg], 0, 0);
    break;
  case 2:
    randImg = round(random(0,3));
    shape(typo[(int)randImg], 0, 0);
    break;
 }
 leftEye = get(160,20,160,260);
 background(255);

 randImg = round(random(0,5));
 if(corner==3){
  type = round(random(0,2));
}else{
  type=corner;
}
 switch(type) {
  case 0:
    image(photoFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(neonFaces[(int)randImg], 0, 0);
    break;
  case 2:
    randImg = round(random(0,3));
    shape(typo[(int)randImg], 0, 0);
    break;
 }
 rightEye = get(320,20,160,260);
 background(255);

 randImg = round(random(0,5));
 if(corner==3){
  type = round(random(0,2));
}else{
  type=corner;
}
 switch(type) {
  case 0:
    image(photoFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(neonFaces[(int)randImg], 0, 0);
    break;
  case 2:
    randImg = round(random(0,3));
    shape(typo[(int)randImg], 0, 0);
    break;
 }
 leftMouth = get(160,280,160,200);
 background(255);

 randImg = round(random(0,5));
 if(corner==3){
  type = round(random(0,2));
}else{
  type=corner;
}
 switch(type) {
  case 0:
    image(photoFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(neonFaces[(int)randImg], 0, 0);
    break;
  case 2:
    randImg = round(random(0,3));
    shape(typo[(int)randImg], 0, 0);
    break;
 }
 rightMouth = get(320,280,160,200);
 background(255);
 


 switch(round(random(0,2))) {
  case 0:
     image(leftEye,random(140,160),random(10,20));
     image(rightEye,random(310,330),random(10,20));
     image(leftMouth,random(145,165),random(260,290));
     image(rightMouth,random(310,330),random(260,290));
    break;
  case 1:
     image(rightEye,random(310,330),random(0,20));
     image(leftMouth,random(140,160),random(270,290));
     image(leftEye,random(140,160),random(10,30));
     image(rightMouth,random(300,320),random(260,290));
    break;
  case 2:
     image(rightMouth,random(310,330),random(270,290));
     image(leftMouth,random(140,160),random(260,290));
     image(rightEye,random(310,330),random(0,20));
     image(leftEye,random(140,150),random(0,30));
    break;
  case 3:
    image(leftMouth,random(140,160),random(260,280));
    image(leftEye,random(140,160),random(10,30));
    image(rightMouth,random(310,330),random(270,290));
    image(rightEye,random(310,330),random(0,20));
    break;
 }
noLoop();
   

}

void mouseClicked() {
  
  if(mouseX > 320){
    if(mouseY>240){
      corner=0;
    }else{
      corner=1;
    }
  }else{
    if(mouseY>240){
      corner=2;
    }else{
      corner=3;
    }
  }
  loop();
}

