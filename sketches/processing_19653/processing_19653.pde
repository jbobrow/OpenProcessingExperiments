
class bigfish {
  
  //FIELDS
  int rippleX;
  int rippleY;
  int rippleSize;
  int lightpA;
  int backfinXone = 25;
  int backfinYone = 130;
  int backfinXtwo = 25; 
  int backfinYtwo = 70;
  int backfinXthree = 70;
  int backfinYthree = 100;

  int darkpurpleR = 85;
  int darkpurpleG = 14;
  int darkpurpleB = 137;
  int lightpR = 141;
  int lightpG = 23;
  int lightpB = 227;
  int waterR = 140;
  int waterG = 247;
  int waterB = 237;
  int topfinXone = 80;
  int topfinYone = 70;
  int topfinXtwo = 120;
  int topfinYtwo = 70;
  int topfinXthree = 80;
  int topfinYthree = 30;
  int bodyWidth = 120;
  int bodyHeight = 80;
  int stripeWeight = 4;
  int stripeR = 226;
  int stripeG = 133;
  int stripeB = 245;
  //int goldR = 255;
  //int goldG = 179;
  //int goldB = 13;
  int mouthR = 247;
  int mouthG = 10;
  int mouthB = 121;
  int lowfinX1 = 80;
  int lowfinY1 = 130;
  int lowfinX2 = 100;
  int lowfinY2 = 130;
  int lowfinX3 = 80;
  int lowfinY3 = 150;
  int pupilSize = 18;
  int eyeX = 140;
  int eyeY = 80;
  int mouthX1 = 130;
  int mouthY1 = 110;
  int mouthX2 = 148;
  int mouthY2 = 123;
  int pupilX = 143;
  int lineX1 = 50;
  int lineY1 = 90;
  int lineX2 = 60;
  int openmouthX1 = 130;
  int openmouthY1 = 110;
  int openmouthX2 = 200;
  int openmouthY2 = 70;
  int openmouthX3 = 175;
  int openmouthY3 = 145;
  
  

  //Constructor
bigfish(int templightpR, int templightpG, int templightpB) {
lightpR = templightpR;
lightpG = templightpG;
lightpB = templightpB;


}

//METHODS



void fish () {
  smooth();
  noStroke();
  //fins
  fill(darkpurpleR,darkpurpleG,darkpurpleB);
  //back fin
  triangle(backfinXone,backfinYone,backfinXtwo,backfinYtwo,backfinXthree,backfinYthree);
  //top fin
  triangle(topfinXone,topfinYone,topfinXtwo,topfinYtwo,topfinXthree,topfinYthree);
  //bottom fin
  triangle(lowfinX1,lowfinY1,lowfinX2,lowfinY2,lowfinX3,lowfinY3);
  // the body
  fill(lightpR,lightpG,lightpB);
  ellipse(width/2,height/2,bodyWidth,bodyHeight);
  //the scales
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
  
  //the eye
  stroke(255);
  fill(255);
  ellipse(eyeX,eyeY,width/10,height/10);
  fill(0);
  noStroke();
  ellipse(pupilX,eyeY,pupilSize,pupilSize);
  
  //the mouth
  stroke(mouthR,mouthG,mouthB);
  line(mouthX1,mouthY1,mouthX2,mouthY2);
 
  //tongue out
  noStroke();
  if (mouseX > 140 && mouseY < 170 && mouseY >50) {
  noStroke();
  fill(waterR,waterG,waterB);
  //triangle(openmouthX1,openmouthY1,openmouthX2,openmouthY2,openmouthX3,openmouthY3);
  stroke(mouthR,mouthG,mouthB);
  line(mouthX1,mouthY1,mouthX2 + 10,mouthY2 + 10);
 } else {
 }
   //make the goldfish disappear with a mouse click in mouth
  if (mousePressed && mouseX > 140 && mouseX < 175 && mouseY < 140 && mouseY > 105) {
  frameRate(1);
  noStroke();
  fill(waterR,waterG,waterB);
  triangle(openmouthX1,openmouthY1,openmouthX2,openmouthY2,openmouthX3,openmouthY3);
  stroke(mouthR,mouthG,mouthB);
  line(mouthX1,mouthY1,mouthX2 + 10,mouthY2 + 10);
} else {
}


}
}


