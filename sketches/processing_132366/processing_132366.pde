
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeSize;
int eyeSizeB;
int eyeSizeC;
int eyeSizeD;
int eyeSizeE;
int eyeColor; 
int earSize;
int earSizeB;
int earColor;
int mouthSize;
int backCol;
int bodyA;
int bodyB;
int bodyColor;
int headColor;
int noseSize;



void setup() {
  size(300,300);
  background(backCol);
  textSize(14);
}  

void draw() {
  if (flipFlop == false){
    eyeSize = 80 ;
    eyeSizeB = 70 ;
    eyeSizeC = 30 ;
    eyeSizeD = 15 ;
    eyeSizeE = 5 ;
    eyeColor = (#7C603C) ;
    earSize = 70 ;
    earSizeB = 60 ;
    earColor =(#C4A98E) ;   
    mouthSize = 55 ;  
    backCol = (#539371);
    bodyA = 75  ;
    bodyB = 60 ;
    bodyColor = (#C4AA92);
    headColor = (#C4A98E);
    noseSize = 4;
    
    
  }
  if (flipFlop == true){
     eyeSize = 93 ;
     eyeSizeB = 83 ;
     eyeSizeC = 12 ;
     eyeSizeD = 5 ;
     eyeSizeE = 2 ;
     eyeColor = (#F0953A) ;
     earSize = 90 ;
     earSizeB = 80 ;
     earColor = (#B9A48E) ;
     mouthSize = 58 ;
     backCol = (0);
     bodyA = 85 ;
     bodyB = 70 ;
     bodyColor =(#B9A48E) ;
     headColor =(#B9A48E);
     noseSize = 1;
    
     
  }   
  makeFace();
  smooth();
  text(keyPrompt,42,135);
}

void keyPressed(){
  flipFlop =! flipFlop;
  keyPrompt = ("");
}

void makeFace(){
  background(backCol);
  translate(150,150);
  rectMode(CENTER);
  noStroke();
 
//ears
fill(earColor);
ellipse(-100,-70,earSize,earSize);
ellipse(100,-70,earSize,earSize);
fill(#675645);
ellipse(-100,-70,earSizeB,earSizeB);
ellipse(100,-70,earSizeB,earSizeB);
fill(#58493B);
ellipse(-100,-70,45,45);
ellipse(100,-70,45,45);
fill(#4B3D31);
ellipse(-100,-70,30,30);
ellipse(100,-70,30,30);
 
 
 
 
 
//body
fill(bodyColor);
ellipse(0,120,50,100);
fill(#625141);
ellipse(0,125,30,bodyA);
fill(#A08266);
ellipse(0,130,20,bodyB);
 
//head
fill(headColor);
ellipse(0,0,250,150);
 
 
//eyes
 
fill(#98806B);
ellipse(-60,0,eyeSize,eyeSize);
ellipse(60,0,eyeSize,eyeSize);
fill(#625141);
ellipse(-60,0,eyeSizeB,eyeSizeB);
ellipse(60,0,eyeSizeB,eyeSizeB);
fill(255);
ellipse(-60,0,50,40);
ellipse(60,0,50,40);
fill(eyeColor);
ellipse(60,0,eyeSizeC,eyeSizeC);
fill(eyeColor);
ellipse(-60,0,eyeSizeC,eyeSizeC);
fill(0);
ellipse(-60,0,eyeSizeD,eyeSizeD);
fill(0);
ellipse(60,0,eyeSizeD,eyeSizeD);
fill(255);
ellipse(60,-3,eyeSizeE,eyeSizeE);
ellipse(-60,-3,eyeSizeE,eyeSizeE);
 
//nose
fill(#4B3A23);
ellipse(1,30,40,35);
fill(#644E30);
ellipse(1,30,30,25);
fill(#816953);
ellipse(2,30,20,15);
fill(255);
ellipse(4,29,noseSize,2);
 
 
 
//mouth
fill(#816953);
arc(0, 59, 100,20, 0, PI);
fill(255);
arc(0, mouthSize, 100,20, 0, PI);
}



