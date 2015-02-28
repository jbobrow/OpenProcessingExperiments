
boolean flipFlop = false;
String keyPrompt = "press any key";

int smile;
int eyeR;
int eyeL;
int eyeColor;
int eyeColor2;
int chin;
int lipColor2;
int lipColor1;
int lipColor3;
int hatColor;
int hatMoveR;
int hatMoveL;

void setup(){
  size(300, 300);
  background(240,237,194);
  textSize(12);
}
 
void draw(){
  if (flipFlop == false){
    eyeR = 10;
    smile = 50;
    eyeL = 10;
    eyeColor = 66;
    eyeColor2 = 66;
    chin = 100;
    lipColor2 = 64;
    lipColor3  = 91;
    lipColor1 = 249;
    hatColor = 35;
    hatMoveR = 120;
    hatMoveL = -95;
  }
  if (flipFlop == true){
    eyeR = 20;
    smile = 80;
    eyeL = 20;
    eyeColor = 300;
    eyeColor2 = 300;
    chin = 50;
    lipColor2 = 182;
    lipColor1 = 39;
    lipColor3 = 248;
    hatColor = 280;
    hatMoveR = 90;
    hatMoveL = -65;
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
size(300,300);
background(177,219,76);
translate(150,150);
noStroke();
fill(255);
ellipse(0,0,200,200);

noStroke();
 
 
//blueeyes
noStroke();
fill(eyeColor,195,225);
ellipse(55,-55,65,65);
 
 
//blueeyes
noStroke();
fill(eyeColor2,195,255);
ellipse(-55,-55,65,65);
 
//blackeye
noStroke();
fill(0);
ellipse(-55,-50,40,40);
//whitecircleeye
noStroke();
fill(255);
ellipse(-55,-50,eyeR,10);
//blackeye
noStroke();
fill(0);
ellipse(55,-50,40,40);
//whitecircleeye
noStroke();
fill(255);
ellipse(55,-50,eyeL,10);
//cheeckL
noStroke();
fill(255,218,253);
ellipse(-55,13,55,55);
 
//cheeckR
fill(255,218,253);
ellipse(55,13,55,55);
 
//chin
fill(255);
ellipse(0,chin,70,85);
 
 
 
//hatcircle
noStroke();
fill(249,hatColor,101);
ellipse(-2,-130,40,40);
//greeneyes
 
//mouth
noStroke();
fill(lipColor1,lipColor2,lipColor3);
ellipse(0,90,smile,50);
 
noStroke();
fill(255,255,255);
ellipse(0,90,75,10);
//eyelashes-right
rectMode(CENTER);
fill(20,300,40);
noStroke();
fill(0);
rect(80,-85,3,20);
rect(70,-87.5,3,20);
rect(60,-89,3,20);
rect(50,-91,3,20);
rect(40,-87.5,3,20);
//eyelashes-left
rect(-80,-85,3,20);
rect(-70,-87.5,3,20);
rect(-60,-89,3,20);
rect(-50,-91,3,20);
rect(-40,-87.5,3,20);
 
 // nose
noStroke();
fill(255);
 
//hat
fill(249,35,101);
triangle(0,-130,-120,-95,hatMoveR,hatMoveL);
 // nose
noStroke();
fill(255);
fill(0);
 triangle(0,-15, -15, 55, 15, 55);
}


