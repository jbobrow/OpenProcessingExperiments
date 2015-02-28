
//PImage online;
PImage GreyHOOND;
PImage GreyHOOND1;
PImage GreyHOOND2;
PImage GreyHOOND3;
PImage GreyHOOND4;
PImage GreyHOOND5;
PImage diamond;
PImage diamondgreen;
PImage diamondpink;
PImage PinkOCTO;

void setup(){	
size(800, 800);
 smooth();
  background(#FFFFFF);

 // online = loadImage("GreyHOOND.png");
  GreyHOOND = loadImage("GreyHOOND.png");
  GreyHOOND1 = loadImage("GreyHOOND1.png");
  GreyHOOND2 = loadImage("GreyHOOND2.png");
  GreyHOOND3 = loadImage("GreyHOOND3.png");
  GreyHOOND4 = loadImage("GreyHOOND4.png");
  GreyHOOND5 = loadImage("GreyHOOND5.png");
  diamond = loadImage("diamond.png");
  diamondgreen = loadImage("diamondgreen.png");
   diamondpink = loadImage("diamondpink.png");
   PinkOCTO = loadImage("PinkOCTO.png");
}

void draw(){
//
//float fr = map(mouseX, 0, width, 1, 100);
//float m = map(mouseX, 0, width, 255, random(255));
//
//frameRate(fr);
//rect(0,0,300,300);
//fill(m, 252, 255, 255);
//
//rect(500,500,300,300);
//fill(m, 252, 255, 255);

float r = map(mouseX, 0, width, 100, 0);
 


 if (mousePressed) {
    image( GreyHOOND, mouseX + random(-r,r), mouseY + random(-r,r), 100, 100);
  }
  if (keyPressed){
  if (key=='1') {
      image(GreyHOOND, mouseX + random(-r,r), mouseY + random(-r,r),50,50);{
    }
  }
  if (key =='2') {
    image(GreyHOOND1, mouseX + random(9*-r,r*9), mouseY+ random(9*-r,r*9), 100, 100);
  }
  if (key=='3') {
    image(GreyHOOND2, mouseX + random(5*-r,r*5), mouseY + random(5*-r,r *5), 100, 100);
  }
  if (key=='4') {
    image(GreyHOOND3, mouseX + random(2*-r,r*2), mouseY + random(2*-r,r*2), 100, 100);
  }
  if (key=='5') {
    image(GreyHOOND4, mouseX + random(7+-r,r+7), mouseY + random(7+-r,r+7), 100, 100);
  }
  if (key=='6') {
    image(GreyHOOND5, mouseX + random (20*-r,r*20), mouseY + random(20*-r,r*20), 100, 100);
  }
 if (key=='7') {
    fill(200); // break SSSSTTTOPPP GREYHOUNDS!!!
  }
   if (key=='8') {
    image(diamond, mouseX, mouseY, 100, 100);
  }
  if (key=='9') {
    image(diamondgreen, mouseX, mouseY, 100, 100);
  }
  if (key=='0') {
    image(diamondpink, mouseX, mouseY, 100, 100);
  }
   if (key=='p') {
    image(PinkOCTO, mouseX, mouseY, 100, 100);
  }
  
  if (key==' '){
    background(255);
  }

    else if(key=='i'){
    filter(INVERT);
  } 
  else if (key=='b'){
    filter(BLUR);
  }
    else if(key=='e'){
    filter(ERODE);
  }
  else if(key=='d'){
    filter(DILATE);
  }
 }
}


 






