
int rippleX;
int rippleY;
int rippleSize;
int backfinXone;
int backfinYone;
int backfinXtwo;
int backfinYtwo;
int backfinXthree;
int backfinYthree;
int darkpurpleR;
int darkpurpleG;
int darkpurpleB;
int waterR;
int waterG;
int waterB;
int lightpR;
int lightpG;
int lightpB;
int stripeR;
int stripeG;
int stripeB;
int goldR;
int goldG;
int goldB;
int mouthR;
int mouthG;
int mouthB;
int topfinXone;
int topfinYone;
int topfinXtwo;
int topfinYtwo;
int topfinXthree;
int topfinYthree;
int lowfinX1;
int lowfinY1;
int lowfinX2;
int lowfinY2;
int lowfinX3;
int lowfinY3;
int bodyWidth;
int bodyHeight;
int stripeWeight;
int pupilSize;
int eyeX;
int eyeY;
int mouthX1;
int mouthY1;
int mouthX2;
int mouthY2;
int pupilX;
int lineX1;
int lineY1;
int lineX2;
int openmouthX1;
int openmouthY1;
int openmouthX2;
int openmouthY2;
int openmouthX3;
int openmouthY3;


void setup() {
  rippleX = 0;
  rippleY = 0;
  rippleSize = 20;
  backfinXone = 25;
  backfinYone = 130;
  backfinXtwo = 25; 
  backfinYtwo = 70;
  backfinXthree = 70;
  backfinYthree = 100;
  darkpurpleR = 85;
  darkpurpleG = 14;
  darkpurpleB = 137;
  lightpR = 141;
  lightpG = 23;
  lightpB = 227;
  waterR = 140;
  waterG = 247;
  waterB = 237;
  topfinXone = 80;
  topfinYone = 70;
  topfinXtwo = 120;
  topfinYtwo = 70;
  topfinXthree = 80;
  topfinYthree = 30;
  bodyWidth = 120;
  bodyHeight = 80;
  stripeWeight = 4;
  stripeR = 226;
  stripeG = 133;
  stripeB = 245;
  goldR = 255;
  goldG = 179;
  goldB = 13;
  mouthR = 247;
  mouthG = 10;
  mouthB = 121;
  lowfinX1 = 80;
  lowfinY1 = 130;
  lowfinX2 = 100;
  lowfinY2 = 130;
  lowfinX3 = 80;
  lowfinY3 = 150;
  pupilSize = 18;
  eyeX = 140;
  eyeY = 80;
  mouthX1 = 130;
  mouthY1 = 110;
  mouthX2 = 148;
  mouthY2 = 123;
  pupilX = 143;
  lineX1 = 50;
  lineY1 = 90;
  lineX2 = 60;
  openmouthX1 = 130;
  openmouthY1 = 110;
  openmouthX2 = 200;
  openmouthY2 = 70;
  openmouthX3 = 180;
  openmouthY3 = 145;

  
  size(200,200);
  colorMode(RGB);
  background(waterR,waterG,waterB);
  
}

void draw(){
  frameRate(20);
  background(waterR,waterG,waterB);
  smooth();
  noStroke();
  fill(darkpurpleR,darkpurpleG,darkpurpleB);
  
  //this is the back fin
  triangle(backfinXone,backfinYone,backfinXtwo,backfinYtwo,backfinXthree,backfinYthree);
  
  //this is the top fin
  triangle(topfinXone,topfinYone,topfinXtwo,topfinYtwo,topfinXthree,topfinYthree);
  
  //this is the bottom fin
  triangle(lowfinX1,lowfinY1,lowfinX2,lowfinY2,lowfinX3,lowfinY3);
  
  //this is the body
  fill(lightpR,lightpG,lightpB);
  ellipse(width/2,height/2,bodyWidth,bodyHeight);
  
  //these are the scales
  stroke(stripeR,stripeG,stripeB);
  strokeWeight(stripeWeight);
  line(lineX1,lineY1,lineX2,height/2);
  line(lineX1,lineY1 + 20,lineX2,height/2);
  line(lineX1 + 10,lineY1 - 10,lineX2 + 15,height/2);
  line(lineX1 + 10,lineY1 +30,lineX2 + 15,height/2);
  line(lineX1 + 20,lineY1 -20,lineX2 + 30,height/2);
  line(lineX1 + 20,lineY1 + 40,lineX2 + 30,height/2);
  line(lineX1 + 33,lineY1 - 22,lineX2 + 45,height/2);
  line(lineX1 + 33,lineY1 + 42,lineX2 +45,height/2);
  line(lineX1 + 47,lineY1 - 22,lineX2 *2,height/2);
  line(lineX1 + 47,lineY1 + 42,lineX2 * 2,height/2);
  line(lineX1 + 58,lineY1 - 20,lineX2 + 55,height/2 - 20);
  line(lineX1 + 58,lineY1 + 40,lineX2 + 55,height/2 + 20);
 
  //this is the eye
  stroke(255);
  fill(255);
  ellipse(eyeX,eyeY,width/10,height/10);
  fill(0);
  noStroke();
  ellipse(pupilX,eyeY,pupilSize,pupilSize);
  
  //this is the mouth
  stroke(mouthR,mouthG,mouthB);
  line(mouthX1,mouthY1,mouthX2,mouthY2);
  
  //these are the ripples
  noStroke();
  fill(255);
  ellipse(rippleX,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 19,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 39,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 59,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 79,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 99,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 119,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 139,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 159,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 179,rippleY,rippleSize,rippleSize);
  ellipse(rippleX + 199,rippleY,rippleSize,rippleSize);


//stick tongue out when goldfish is near  
if (mouseX > 140 && mouseY < 170 && mouseY >50) {
   fill(waterR,waterG,waterB);
   triangle(openmouthX1,openmouthY1,openmouthX2,openmouthY2,openmouthX3,openmouthY3);
   stroke(mouthR,mouthG,mouthB);
   line(mouthX1,mouthY1,mouthX2 + 10,mouthY2 + 10);
 } else {
 }
  
  //the goldfish
  noStroke();
  fill(goldR,goldG,goldB);
  ellipse(mouseX,mouseY,width/10,width/20);
  triangle(mouseX+5,mouseY,mouseX+15,mouseY-7,mouseX+15,mouseY+7);
  
  //make the goldfish disappear with a mouse click in mouth
  if (mousePressed && mouseX > 140 && mouseX < 175 && mouseY < 140 && mouseY > 105) {
  frameRate(1);
  fill(waterR,waterG,waterB);
  triangle(openmouthX1,openmouthY1,openmouthX2,openmouthY2,openmouthX3,openmouthY3);
  stroke(mouthR,mouthG,mouthB);
  line(mouthX1,mouthY1,mouthX2 + 10,mouthY2 + 10);
} else {
}


}


