
PFont font;


int curtainHeight;
int curtainHandle;
int curtainLine;
int centerX;
int lengthTotal;
float startDelta;
float deltaY;
float acceleration;



int windMillGroup1=0;
int windMillGroup2=0;

float velocityX1;
float velocityY1;
float velocityX2;
float velocityY2;
float cloudX;
float cloudY;
int c;
int rectBodyX;
int rectBodyY;
color neonColor;
int dotLine1_X;
int dotLine1_Y;
int gapDot;
int gapDotY;
int spacing;
int endDots;
int len;
float z;
int q;
float cloudMoveA;
float cloudMoveB;
float cloudMoveC;
float cloudMoveD;
float cloudMoveE;
float cloudMoveF;
float cloudMoveG;
float cloudMoveH;
float cloudMoveI;
float cloudMoveJ;
float cloudMoveK;
float cloudMoveL;
float cloudMoveM;
float cloudMoveN;
float cloudMoveO;
float cloudMoveP;
float cloudMoveQ;
float cloudMoveR;




float m;
float speed;

int rectWidth;
int rectHeight;

float w;


void setup() {
  size(600, 800);
  frameRate(60);
  velocityX1=2;
  velocityX2=2;
  cloudX=random(0, 500);
  cloudY=random(0, 500);
  rectBodyX=width/2;
  rectBodyY=(height/3)*2;
  dotLine1_X=100;
  dotLine1_Y=-30;
  spacing=2;

  gapDot=20;
  gapDotY=60;
  endDots=100;
  len=2;
  cloudMoveA=5;
  cloudMoveB=20;
  cloudMoveC=30;

  cloudMoveD=-350;
  cloudMoveE=-385;
  cloudMoveF=-329;

  cloudMoveG=-250;
  cloudMoveH=-278;
  cloudMoveI=-207;

  cloudMoveJ=-428;
  cloudMoveK=-435;
  cloudMoveL=-473;

  cloudMoveM= -238;
  cloudMoveN= -258;
  cloudMoveO= -268;

  cloudMoveP= -111;
  cloudMoveQ= -118;
  cloudMoveR= -118;


  rectWidth=25;
  rectHeight=25;

  w = 200;

  curtainHeight = 50;  // height
  curtainHandle = 200;  // ring
  curtainLine = -98; // cord
  centerX = width/2;
  lengthTotal = curtainHeight + curtainHandle + curtainLine;
  startDelta = 1;
  deltaY = 1;
  acceleration = 1.1;
}

void draw() {

  background(198, 229, 217);




  smooth();
  cloudMoveA++;
  cloudMoveB++;
  cloudMoveC++;
  cloudMoveA++;
  cloudMoveB++;
  cloudMoveC++;
  cloudMoveD++;
  cloudMoveE++;
  cloudMoveF++;
  cloudMoveG++;
  cloudMoveH++;
  cloudMoveI++;
  cloudMoveJ++;
  cloudMoveK++;
  cloudMoveL++;
  cloudMoveJ++;
  cloudMoveK++;
  cloudMoveL++;
  cloudMoveM++;
  cloudMoveN++;
  cloudMoveO++;
  cloudMoveM++;
  cloudMoveN++;
  cloudMoveO++;
  cloudMoveP++;
  cloudMoveQ++;
  cloudMoveR++;
  cloudMoveP++;
  cloudMoveQ++;
  cloudMoveR++;







  noStroke();

  //tower roof(triangle)
  strokeWeight(1.1);
  stroke(235, 235, 235);
  fill(198, 164, 154);
  triangle(300, 123, 90, 300, 510, 300);

  //tower body1
  fill(198, 164, 154);
  beginShape();
  vertex(124, 300);
  vertex(476, 300);
  vertex(476, 340);
  vertex(466, 337);
  vertex(134, 337);
  vertex(124, 340);
  vertex(124, 300);
  endShape();

  fill(198, 164, 154);
  beginShape();
  vertex(134, 337);
  vertex(466, 337);
  vertex(468, 363);
  vertex(132, 363);
  vertex(134, 337);

  //tower body2
  fill(214, 129, 137);
  beginShape();
  vertex(134, 337);
  vertex(466, 337);
  vertex(466, 340);
  vertex(510, 927);
  vertex(90, 927);
  endShape();

  strokeWeight(1.1);
  stroke(235, 235, 235);
  //244,234,213
  line(134, 337, 466, 337);
  line(134, 337, 90, 927);

  noStroke();

  fill(229, 95, 92);
  beginShape();
  vertex(134, 337);
  vertex(466, 337);
  vertex(466, 340);
  vertex(510, 927);
  vertex(90, 927);
  endShape();


  noStroke();

  int neon=int(random(5));
  if (neon==0) {
    neonColor=color(0, 250, 126);//green
  } else if (neon==1) {
    neonColor=color(2, 0, 223);//purple
  } else if (neon==2) {
    neonColor=color(225, 238, 136);//yellow
  } else if (neon==3) {
    neonColor=color(250, 66, 94);//red
  } else if (neon==4) {
    neonColor=color(157, 188, 252);//blue
  }






  //rectBody
  noStroke();

  pushMatrix();
  fill(255);
  translate(rectBodyX, rectBodyY-50);
  rotate(PI/4);
  rectMode(CENTER);
  rect(0, 0, 70, 70);
  popMatrix();

  pushMatrix();
  fill(255);
  translate(rectBodyX-120, rectBodyY-50);
  rotate(PI/4);
  rectMode(CENTER);
  rect(0, 0, 70, 70);
  popMatrix();

  pushMatrix();
  fill(255);
  translate(rectBodyX+120, rectBodyY-50);
  rotate(PI/4);
  rectMode(CENTER);
  rect(0, 0, 70, 70);
  popMatrix();

  //rectBody2
  pushMatrix();
  translate(rectBodyX, rectBodyY-50);
  beginShape();
  vertex(0, 80);
  vertex(-30, 100);
  vertex(-30, 250);
  vertex(30, 250);
  vertex(30, 100);
  vertex(0, 80);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(rectBodyX+120, rectBodyY-50);
  beginShape();
  vertex(0, 80);
  vertex(-30, 100);
  vertex(-30, 250);
  vertex(30, 250);
  vertex(30, 100);
  vertex(0, 80);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();
  translate(rectBodyX-120, rectBodyY-50);
  beginShape();
  vertex(0, 80);
  vertex(-30, 100);
  vertex(-30, 250);
  vertex(30, 250);
  vertex(30, 100);
  vertex(0, 80);
  endShape(CLOSE);
  popMatrix();

  clouds();
  windMill2();
  windMillCenter();
  curtain();
}




void windMill2() {
  pushMatrix();
  fill(233, 78, 119);
  translate(width/2, 290);
  stroke(neonColor);
  strokeWeight(3);
  rotate(PI/PI+velocityY1);
  rectMode(CENTER);
  beginShape();
  quad(0, -20, -20, 0, -290, -215, -215, -290);
  quad(0, -20, 20, 0, 290, -215, 215, -290);
  quad(20, 0, 0, 20, 215, 290, 290, 215);
  quad(-20, 0, 0, 20, -215, 290, -290, 215);




  endShape(CLOSE);
  if (velocityX1%4==1) {
    velocityY1=velocityY1+0.1;
  }
  velocityX1++;
  popMatrix();
}


void windMillGroup() {
  pushMatrix();
  fill(255);

  translate(width/2, 320);
  strokeWeight(2);
  stroke(neonColor);
  rotate(PI/PI+velocityY1);

  rectMode(CENTER);
  beginShape();
  fill(255);
  rect(0, 0, 90, 770);
  rect(0, 0, 770, 90);
  endShape(CLOSE);
  if (velocityX1%4==1) {
    velocityY1=velocityY1+0.1;
  }
  velocityX1++;
  popMatrix();
}

void windMillCenter() {
  pushMatrix();

  translate(width/2, 320);
  while (w>0) {
    strokeWeight(2);

    stroke(0, 255, 0);
    fill(0, 255, 0);    
    rotate(PI/PI+velocityY1);

    rectMode(CENTER);
    rect(0, 0, w, w);
    w=w-5;
    if (velocityX1%4==1) {
      velocityY1=velocityY1+0.1;
    }
    velocityX1++;
  }
  popMatrix();
}

void clouds() {
  //cloud1
  noStroke();
  fill(255, 99);
  ellipse(cloudMoveA, 45, 40, 30);
  if (cloudMoveA==width+0)
    cloudMoveA=-300;
  ellipse(cloudMoveB, 60, 100, 40);
  if (cloudMoveB==width+0)
    cloudMoveB=-300;
  ellipse(cloudMoveC, 75, 70, 30);
  if (cloudMoveC==width+0)
    cloudMoveC=-300;

  //cloud2
  ellipse(cloudMoveD, 109, 45, 32);
  if (cloudMoveD==width+250)
    cloudMoveD=-300;
  ellipse(cloudMoveE, 120, 80, 40);
  if (cloudMoveE==width+250)
    cloudMoveE=-300;
  ellipse(cloudMoveF, 125, 60, 50);
  if (cloudMoveF==width+250)
    cloudMoveF=-300;

  //cloud3
  ellipse(cloudMoveG, 58, 85, 52);
  if (cloudMoveG==width+200)
    cloudMoveG=-300;
  ellipse(cloudMoveH, 72, 70, 83);
  if (cloudMoveH==width+200)
    cloudMoveH=-300;
  ellipse(cloudMoveI, 65, 60, 30);
  if (cloudMoveI==width+200)
    cloudMoveI=-300;

  //cloud4
  ellipse(cloudMoveJ, 315, 120, 38);
  if (cloudMoveJ==width+200)
    cloudMoveJ=-20;
  ellipse(cloudMoveK, 300, 90, 63);
  if (cloudMoveK==width+200)
    cloudMoveK=-20;
  ellipse(cloudMoveL, 321, 78, 81);
  if (cloudMoveL==width+200)
    cloudMoveL=-20;

  ellipse(cloudMoveM, 108, 125, 52);
  if (cloudMoveM==width+150)
    cloudMoveM=-280;
  ellipse(cloudMoveN, 142, 130, 53);
  if (cloudMoveN==width+150)
    cloudMoveN=-280;
  ellipse(cloudMoveO, 113, 69, 38);
  if (cloudMoveO==width+150)
    cloudMoveI=-280;

  ellipse(cloudMoveP, 250, 49, 60);
  if (cloudMoveP==width+50)
    cloudMoveP=-180;
  ellipse(cloudMoveQ, 232, 128, 72);
  if (cloudMoveQ==width+50)
    cloudMoveQ=-180;
  ellipse(cloudMoveR, 218, 80, 68);
  if (cloudMoveR==width+50)
    cloudMoveR=-180;
}

void curtain() {

  {


    if ((centerX - mouseX)*(centerX - mouseX) + (lengthTotal - mouseY)*(lengthTotal - mouseY)
      <= (curtainHandle + 5) * (curtainHandle + 5))
    {
      lengthTotal = mouseY;
      deltaY = startDelta;
    } else
    {
      lengthTotal = int(lengthTotal - deltaY);    
      deltaY *= acceleration;
    }

    if (lengthTotal < curtainHeight + curtainHandle + curtainLine)
    {
      lengthTotal = curtainHeight + curtainHandle + curtainLine;
    }

    fill(0);
    noStroke();
    rect(0, 0, width*2, (lengthTotal - (curtainHandle + curtainLine))*2);
    stroke(0);
    line(0, lengthTotal - (curtainHandle + curtainLine), width, lengthTotal - (curtainHandle + curtainLine));
    fill(0);
    line(centerX, lengthTotal - (curtainHandle + curtainLine), centerX, lengthTotal);
    fill(255);
    pushMatrix();
    translate(centerX, lengthTotal);
    stroke(15, 15, 15);
    strokeWeight(1);
    fill(0);
    triangle(-15, 0, 15, 0, 0, 15);
    //sphere(30);
    font = loadFont("Baskerville-48.vlw");
    stroke(244, 234, 213);
    strokeWeight(10);
    fill(244, 234, 213);
    textFont(font,15);
    text("1 NEW MESSAGE", -66, -112);
    popMatrix();



    pushMatrix();
    stroke(244, 234, 213);
    line(0, 697, 600, 697);
    line(0, 788, 600, 788);

    noStroke();
    noFill();
    quad(0, 550, 0, 650, 600, 650, 600, 550);
    font = loadFont("Baskerville-Bold-48.vlw");
    fill(244, 234, 213);

    textFont(font, 50);
    text("Good Night,", centerX-170, lengthTotal-400);
    text("Mr. Lautrec", centerX-101, lengthTotal-350);
    noStroke();

    noFill();
    noFill();
    quad(0, 699, 0, 790, 600, 790, 600, 699);
    font = loadFont("Baskerville-Bold-48.vlw");
    stroke(244, 234, 213);

    textFont(font, 99);
    text("Moulin Rouge", -7, 773);

    popMatrix();
  }
}  

/*
//matrix displayer
 void mouseClicked() {
 println("X : ", mouseX);
 println("Y : ", mouseY);
 println("");
 }
 */


