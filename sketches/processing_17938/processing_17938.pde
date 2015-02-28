
//declare variables at the top of code

int canvasX = 200;
int canvasY = 200;

int backgroundR = 138;
int backgroundG = 240;
int backgroundB = 234;
int backgroundR2 = 3;
int backgroundG2 = 173;
int backgroundB2 = 255;
int backgroundR3 = 40;
int backgroundG3 = 222;
int backgroundB3 = 205;
int backgroundR4 = 3;
int backgroundG4 = 88;
int backgroundB4 = 255;

int earX = 75;
int earY = 20;
int earDiam = 25;
int earColor = 0;

int black = 0;
int white = 255;

int bodyX = 100;
int bodyY = 120;
int bodyWidth = 100;
int bodyHeight = 115;

int bellyWidth = 70;
int bellyHeight = 105;
int bellyColor = 220;

int headX = 100;
int headY = 50;
int headWidth = 75;
int headHeight = 80; 

int eyeX = 86;
int eyeY = 45;
int eyeWidth = 25;
int eyeHeight = 30;

int pupilWidth = 10;
int pupilHeight = 15;
int pupilDiam = 5; 
int pupilR = 3;
int pupilG = 100;
int pupilB = 255;

int noseX1 = 100;
int noseY1 = 57;
int noseX2 = 105;
int noseY2 = 65;
int noseX3 = 95;

int mouthX1 = 100;
int mouthY1 = 65;
int mouthY2 = 72;
int strokeMouth = 1;

int handX = 55;
int handY = 90;
int handWidth = 20;
int handHeight = 30;

int feetX = 70;
int feetY = 170;
int feetDiam = 20;
 
int bowtieX2 = 120;
int bowtieY2 = 88;
int bowtieY3 = 109;
int bowtieStroke = 1;
int bowtieDiam = 10;

int hairStroke = 0;
int hairY1 = 11;
int hairY2 = 5;

int speed = 1;
int growingBelly = 50;


void setup() {
size(canvasX,canvasY);
smooth();
frameRate(growingBelly);
}

void draw() {
  //background(backgroundR,backgroundG,backgroundB);

if (mouseX > width/2 && mouseY> height/2) {
  background(backgroundR,backgroundG,backgroundB);
} else if (mouseX > width/2 && mouseY < height/2) {
  background(backgroundR2,backgroundG2,backgroundB2);
} else if (mouseX < width/2 && mouseY < height/2) {
  background(backgroundR3,backgroundG3,backgroundB3);
} else if (mouseX < width/2 && mouseY > height/2) {
  background(backgroundR4,backgroundG4,backgroundB4);
}

//these are his ears
noStroke();
fill(earColor);
ellipse(earX,earY,earDiam,earDiam);
ellipse(earX + 50,earY,earDiam,earDiam);

//this is his body
noStroke();
fill(black);
ellipse(bodyX,bodyY,bodyWidth,bodyHeight);

if (mouseX > width/3 && mouseX < width-width/3) {
  bodyWidth = bodyWidth + speed;
  if(bodyWidth >= width - 40 || bodyWidth <= width/4) {
    speed = speed * -1;
}
}

//this is his belly
noStroke();
fill(bellyColor);
ellipse(bodyX,bodyY,bellyWidth,bellyHeight);

if (mouseX > width/3 && mouseX < width-width/3) {
  bellyWidth = bellyWidth + speed;
  if(bellyWidth >= width - 40 || bellyWidth <= width/4) {
    speed = speed * -1;
}
}

//this is his head
noStroke();
fill(white);
ellipse(headX,headY,headWidth,headHeight);

//these are his eyes
noStroke();
fill(black);
ellipse(eyeX,eyeY,eyeWidth,eyeHeight);
ellipse(eyeX + 30,eyeY,eyeWidth,eyeHeight);

//these are his pupils
noStroke();
fill(white);
ellipse(eyeX,eyeY,pupilWidth,pupilHeight);
ellipse(eyeX + 30,eyeY,pupilWidth,pupilHeight);
noStroke();
fill(pupilR,pupilG,pupilB);
ellipse(eyeX,eyeY,pupilDiam,pupilDiam);
ellipse(eyeX + 30,eyeY,pupilDiam,pupilDiam);

//this is his nose
noStroke();
fill(black);
triangle(noseX1,noseY1,noseX2,noseY2,noseX3,noseY2);

//this is his mouth
strokeWeight(strokeMouth);
stroke(black);
line(mouthX1,mouthY1,mouthX1,mouthY2);
line(mouthX1,mouthY1 + 7,mouthX1 + 5,mouthY2 - 3);

//these are his hands
noStroke();
fill(white);
ellipse(constrain(mouseX,45,65),constrain(mouseY,85,100),handWidth,handHeight);
ellipse(constrain(mouseX,135,155),constrain(mouseY,85,100),handWidth,handHeight);
//these are his feet
ellipse(constrain(mouseX,60,80),constrain(mouseY,160,180),feetDiam,feetDiam);
ellipse(constrain(mouseX,120,140),constrain(mouseY,160,180),feetDiam,feetDiam);

//this is his bowtie
noStroke();
fill(mouseX,mouseY,255);
triangle(width/2,height/2,bowtieX2,bowtieY2,bowtieX2,bowtieY3);
triangle(width/2,height/2,bowtieX2 - 40,bowtieY2,bowtieX2 - 40,bowtieY3);

strokeWeight(bowtieStroke);
stroke(white);
fill(black);
ellipse(width/2,height/2,bowtieDiam,bowtieDiam);

//this is his hair
strokeWeight(1);
stroke(0);
line(width/2,hairY1,width/2,hairY2);
line(width/2,hairY1,width/2 + 5,hairY2);

}
                
                
