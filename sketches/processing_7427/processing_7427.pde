
float randImg;
PShape[] typo = new PShape[4];
PImage[] drawnFaces = new PImage[6];
PImage[] realFaces = new PImage[6];

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
 drawnFaces[0] = loadImage("drawn1.gif");
 drawnFaces[1] = loadImage("drawn2.gif");
 drawnFaces[2] = loadImage("drawn3.png");
 drawnFaces[3] = loadImage("drawn4.png");
 drawnFaces[4] = loadImage("drawn5.png");
 drawnFaces[5] = loadImage("drawn6.png");
 realFaces[0] = loadImage("real1.gif");
 realFaces[1] = loadImage("real2.png");
 realFaces[2] = loadImage("real3.png");
 realFaces[3] = loadImage("real4.png");
 realFaces[4] = loadImage("real5.png");
 realFaces[5] = loadImage("real6.png");
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
    image(drawnFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(realFaces[(int)randImg], 0, 0);
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
    image(drawnFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(realFaces[(int)randImg], 0, 0);
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
    image(drawnFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(realFaces[(int)randImg], 0, 0);
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
    image(drawnFaces[(int)randImg], 0, 0);
    break;
  case 1:
    image(realFaces[(int)randImg], 0, 0);
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

