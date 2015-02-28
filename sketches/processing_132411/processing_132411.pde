

boolean flipFlop = false;
String keyPrompt = "press any key";
int browHeight;
int mouthWidth;
int mouthHeight;
int buttonColorR;
int buttonColorG;
int buttonColorB;
int lightColorR;
int lightColorG;
int lightColorB;
int armHeight;
int armLength;
int elbow1;
int elbow2;

void setup(){
size(300,300);
background(255);
textSize(12);
}

void draw(){
  if (flipFlop == true){
    browHeight = -25;
    mouthWidth = 50;
    mouthHeight = 10;
    buttonColorR = 255;
    buttonColorG = 0;
    buttonColorB = 0;
    lightColorR = 255;
    lightColorG = 0;
    lightColorB = 0;
    armHeight = 0; 
    armLength = 200;
    elbow1 = 118;
    elbow2 = -118;
  }
  if(flipFlop == false){
    browHeight = -15;
    mouthWidth = 100;
    mouthHeight = 5;
    buttonColorR = 0;
    buttonColorG = 255;
    buttonColorB = 0;
    lightColorR = 0;
    lightColorG = 255;
    lightColorB = 0;
    armHeight = 150;
    armLength = 100;
    elbow1 = 400;
    elbow2 = 400;
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
  background(255);
  noStroke();
  rectMode(CENTER);
  translate(150,150);
fill(200,190,200);
rect(0,0,150,150);
//eyes
fill(255);
ellipse(-35,0,40,40);
ellipse(35,0,40,40);
fill(100,150,255);
ellipse(-35,0,25,25);
ellipse(35,0,25,25);
fill(0);
ellipse(-35,0,20,20);
ellipse(35,0,20,20);
//brows
rect(-35,-15,50,15);
rect(35,browHeight,50,15);
//mouth
rect(0,50,mouthWidth,mouthHeight);
//neck
fill(200,190,200);
rect(0,90,30,35);
//arms
rect(118,armHeight,25,armLength);
rect(-118,armHeight,25,armLength);
fill(170,160,170);
ellipse(100,100,75,25);
ellipse(-100,100,75,25);
ellipse(elbow1,0,40,40);
ellipse(elbow2,0,40,40);
//"ears"
ellipse(75,0,15,150);
ellipse(-75,0,15,150);
//shoulders
fill(200,190,200);
rect(0,120,200,75);
//antenna
ellipse(0,-75,10,10);
ellipse(10,-75,10,10);
ellipse(20,-75,10,10);
ellipse(30,-75,10,10);
ellipse(40,-75,10,10);
ellipse(50,-75,10,10);
ellipse(60,-75,10,10);
ellipse(70,-75,10,10);
ellipse(-10,-75,10,10);
ellipse(-20,-75,10,10);
ellipse(-30,-75,10,10);
ellipse(-40,-75,10,10);
ellipse(-50,-75,10,10);
ellipse(-60,-75,10,10);
ellipse(-70,-75,10,10);
rect(0,-100,5,60);
fill(lightColorR,lightColorG,lightColorB);
ellipse(0,-135,18,20);
//nose
fill(170,160,170);
triangle(0,0,-15,40,15,40);
//chest/buttons
rect(0,120,150,60);
fill(255,0,0);
ellipse(-50,120,15,15);
fill(0);
rect(-50,140,18,18);
fill(buttonColorR,buttonColorG,buttonColorB);
ellipse(-35,125,5,5);
ellipse(-25,125,5,5);
ellipse(-15,125,5,5);
ellipse(-5,125,5,5);
ellipse(5,125,5,5);
ellipse(15,125,5,5);
ellipse(25,125,5,5);
ellipse(35,125,5,5);
ellipse(-35,135,5,5);
ellipse(-25,135,5,5);
ellipse(-15,135,5,5);
ellipse(-5,135,5,5);
ellipse(5,135,5,5);
ellipse(15,135,5,5);
ellipse(25,135,5,5);
ellipse(35,135,5,5);
ellipse(-35,145,5,5);
ellipse(-25,145,5,5);
ellipse(-15,145,5,5);
ellipse(-5,145,5,5);
ellipse(5,145,5,5);
ellipse(15,145,5,5);
ellipse(25,145,5,5);
ellipse(35,145,5,5);
}




