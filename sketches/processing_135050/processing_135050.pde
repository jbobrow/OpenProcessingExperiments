
boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeSize[] = {80,93};
float eyeSizeB[] = {70,83};
float eyeSizeC[] = {12,30};
float eyeSizeD[] = {5,15};
float eyeSizeE[] = {2,5};
float eyeColor[] = {0,250,0,250,0,250};
float earSize[] = {70,90};
float backCol[] = {0,250,0,250,0,250};
float noseSize[] = {1,4};
float bodyColor[] = {0,250,0,250,0,250};
float _eyeSize = 80;
float _eyeSizeB = 70;
float _eyeSizeC = 30;
float _eyeSizeD = 15;
float _eyeSizeE = 5;
float _eyeColorR = 0;
float _eyeColorG = 0;
float _eyeColorB = 0;
float _earSize = 70;
float _earSizeB = 60; 
float _mouthSize = 55;
float _backColR = 0;
float _backColG = 0;
float _backColB = 0;
float _bodyA = 75;
float _bodyB = 60;
float _bodyColorR = 0;
float _bodyColorG = 0;
float _bodyColorB = 0;
float _noseSize = 4;

void setup() {
  size(300,300);
  background(_backColR,_backColG,_backColB);
  textSize(12);
} 

void draw() {
   makeFace();
  smooth();
  text(keyPrompt,42,135);
}

void keyPressed() { 
  _eyeSize = random(eyeSize[0],eyeSize[1]);
  _eyeSizeB = random(eyeSizeB[0],eyeSizeB[1]);
  _eyeSizeC = random(eyeSizeC[0],eyeSizeC[1]);
  _eyeSizeD = random(eyeSizeD[0],eyeSizeD[1]);
  _eyeSizeE = random(eyeSizeE[0],eyeSizeE[1]);
  _earSize = random(earSize[0],earSize[1]);
  _eyeColorR = random(eyeColor[0],eyeColor[1]);
  _eyeColorG = random(eyeColor[2],eyeColor[3]);
  _eyeColorB = random(eyeColor[4],eyeColor[5]);
  _backColR = random(backCol[0],backCol[1]);
  _backColG = random(backCol[2],backCol[3]);
  _backColB = random(backCol[4],backCol[5]);
  _noseSize = random(noseSize[0],noseSize[1]);
  _bodyColorR = random(bodyColor[0],bodyColor[1]);
  _bodyColorG = random(bodyColor[2],bodyColor[3]);
  _bodyColorB = random(bodyColor[4],bodyColor[5]);
  
  keyPrompt = ("");
}

void makeFace(){
  background(_backColR,_backColG,_backColB);
  translate(150,150);
  rectMode(CENTER);
  noStroke();
  
  //ears
fill(_bodyColorR,_bodyColorG,_bodyColorB);
ellipse(-100,-70,_earSize,_earSize);
ellipse(100,-70,_earSize,_earSize);
fill(#675645);
ellipse(-100,-70,_earSizeB,_earSizeB);
ellipse(100,-70,_earSizeB,_earSizeB);
fill(#58493B);
ellipse(-100,-70,45,45);
ellipse(100,-70,45,45);
fill(#4B3D31);
ellipse(-100,-70,30,30);
ellipse(100,-70,30,30);
  
  
  
  
  
//body
fill(_bodyColorR,_bodyColorG,_bodyColorB);
ellipse(0,120,50,100);
fill(#625141);
ellipse(0,125,30,_bodyA);
fill(#A08266);
ellipse(0,130,20,_bodyB);
  
//head
fill(_bodyColorR,_bodyColorG,_bodyColorB);
ellipse(0,0,250,150);
  
  
//eyes
  
fill(#98806B);
ellipse(-60,0,_eyeSize,_eyeSize);
ellipse(60,0,_eyeSize,_eyeSize);
fill(#625141);
ellipse(-60,0,_eyeSizeB,_eyeSizeB);
ellipse(60,0,_eyeSizeB,_eyeSizeB);
fill(255);
ellipse(-60,0,50,40);
ellipse(60,0,50,40);
fill(_eyeColorR,_eyeColorG,_eyeColorB);
ellipse(60,0,_eyeSizeC,_eyeSizeC);
fill(_eyeColorR,_eyeColorG,_eyeColorB);
ellipse(-60,0,_eyeSizeC,_eyeSizeC);
fill(0);
ellipse(-60,0,_eyeSizeD,_eyeSizeD);
fill(0);
ellipse(60,0,_eyeSizeD,_eyeSizeD);
fill(255);
ellipse(60,-3,_eyeSizeE,_eyeSizeE);
ellipse(-60,-3,_eyeSizeE,_eyeSizeE);
  
//nose
fill(#4B3A23);
ellipse(1,30,40,35);
fill(#644E30);
ellipse(1,30,30,25);
fill(#816953);
ellipse(2,30,20,15);
fill(255);
ellipse(4,29,_noseSize,2);
  
  
  
//mouth
fill(#816953);
arc(0, 59, 100,20, 0, PI);
fill(255);
arc(0, _mouthSize, 100,20, 0, PI);
}



