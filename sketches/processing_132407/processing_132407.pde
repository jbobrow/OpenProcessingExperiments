
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiamLeft;
int eyeBallDiamRight;
int mouthWidth;
int pupilLeft;
int nostrilColor;
int bigNoseColor;
int bgColor;
int eyeBall;
int lineChange;
int lineBall;
int lineBallShine; 
int headColor;
int antennaColor;
int bodyFat;
int faceFat;
int pumpHandles;
int pumpStand;
int pumpDown;

void setup(){
  size(300, 300);
  background(100,300,150);
  textSize(12);
}
 
void draw(){
  if (flipFlop == false){
    eyeBallDiamLeft = 40;
    eyeBallDiamRight = 60;
     mouthWidth = 90;
     pupilLeft = 30;
     nostrilColor = 0;
     bigNoseColor = 100;
     bgColor = 300;
     eyeBall = 40;
     lineChange = -130;
     lineBall = -130;
     lineBallShine = -130;
     headColor = 100;
     antennaColor = 0;
     bodyFat = 200;
     faceFat = 150;
     pumpHandles = -140;
     pumpStand = 60;
     pumpDown = -110;
  }
  if (flipFlop == true){
    eyeBallDiamLeft = 40;
    eyeBallDiamRight = 10;
    mouthWidth = 35;
    pupilLeft = 10;
    nostrilColor = 60; 
    bigNoseColor = 300;
    bgColor = 17;
    eyeBall = 10;
    lineChange = -140;
    lineBall = -140;
    lineBallShine = -140;
    headColor = 175;
    antennaColor = 255;
    bodyFat = -300;
    faceFat = 230;
    pumpHandles = -120;
    pumpStand = 40;
    pumpDown = -97;
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}
 
void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}
 
void makeFace(){
  background(100,bgColor,150);
  noStroke();
  rectMode(CENTER);
  // this is important - changes zero location for all future coordinates
  translate(150,150);

//pump
fill(245,60,60);
rect(-120,pumpHandles,30,10);
rect(-120,pumpDown,10,pumpStand);
fill(0);
ellipse(-105,pumpHandles,12,12);
ellipse(-135,pumpHandles,12,12);

//cord
noFill();
stroke(255, 102, 0);
stroke(0, 0, 0);
pushMatrix();
translate(-130,-90);
bezier(10,10,85,20,15,80,90,90);
popMatrix();
  
//body
noStroke();
fill(100,headColor,200);
ellipse(0,200,bodyFat,200);

//hair
stroke(antennaColor,178,201);
strokeWeight(10);
line(0,lineChange,0,-100);
fill(antennaColor,178,201);
ellipse(0,-100,10,10);
ellipse(0,lineBall,10,10);
fill(255);
ellipse(3,lineBallShine,3,3);

//head
rectMode(CENTER);
fill(100,headColor,200);
noStroke();
rect(0,0,faceFat,200,100);
ellipse(0,90,70,40);

//eyes
fill(255);
ellipse(-25,-50,eyeBallDiamLeft,eyeBallDiamRight);
ellipse(25,-50,eyeBallDiamLeft,eyeBall);
fill(0);
ellipse(-25,-50,10,pupilLeft);
ellipse(25,-50,10,10);

//nose
fill(100,bigNoseColor,150);
ellipse(0,0,50,30);
fill(nostrilColor);
ellipse(-10,0,5,5);
ellipse(10,0,5,5);

//mouth
fill(0);
ellipse(0,50,mouthWidth,45);
fill(100,headColor,200);
ellipse(0,30,60,30);
}



