
//declare global variables

float eyeSize = 15;
int eyeSize2 = 25;
float eyeBrowup= -20;
float sweatDrip = -28;
int eyeColor1 = 5;
int eyeColor2 = 89;
int eyeColor3 = 114;
float sweatColor1 = 195;
float sweatColor2 = 237;
float sweatColor3 = 237;
int eyeColor_1 = 0;
int eyeColor_2 = 0;
int eyeColor_3 = 0;
float disMouth = 38;
int hairTrans = -100;
float Face = 20;
float earSize = 0;
float lefteyeMove= 0;
float righteyeMove = 0;
float faceSize = 250;
float redChange1 = 255;
float redChange2 = 0;
float redChange3 = 0;

boolean clicked = false;


//runs once
void setup(){
  size(500,500);
  background(5,89,114);
  if (clicked == false){
 
    eyeSize = 15;
    eyeSize2 = 25;
    eyeBrowup = -20;
    sweatDrip = -28;
    eyeColor1 = 255;
    eyeColor2 = 0;
    eyeColor3 = 0;
    sweatColor1 = 195;
    sweatColor2 = 237;
    sweatColor3 = 237;
    eyeColor_1 = 255;
    eyeColor_2 = 0;
    eyeColor_3 = 0;
    disMouth= 38;
    hairTrans = -100; 
    Face = 20;
    earSize = 0;
        
  }
   if (clicked == true){
    eyeSize = 8;
    eyeSize2= 30;
    eyeBrowup = -30;
    sweatDrip = 5; 
    eyeColor1 = 0;
    eyeColor2 = 0;
    eyeColor3 = 0;
    eyeColor_1 = 0;
    eyeColor_2 = 0;
    eyeColor_3 = 0;
    sweatColor1 = 44;
    sweatColor2 = 162;
    sweatColor3 = 168;
    disMouth= 28;
    hairTrans = -110;
    Face = 36;
    earSize = 10;
    
  }
}

void keyPressed(){    
  clicked =! clicked;
  eyeSize = random(5,25);
  righteyeMove = random(-10,10);
  lefteyeMove = righteyeMove * -1; 
  sweatColor1 = random(0,255);
  sweatColor2 = random(0,255);
  sweatColor3 = random(0,255);
  earSize = random(0,30);
  Face = random(15,30);
  faceSize = random(250,275);
  eyeBrowup= random(-30,-20);
  disMouth= random(15,38);
  sweatDrip = sweatDrip + 10;
  if (sweatDrip > 60){
    sweatDrip = -32;
  }
  redChange1 = random(49,130);
  redChange2 = random(11,125);
  redChange3 = random(11,145);
}
 
void draw(){  
  background(5,89,114);

  translate(250,250);
  noStroke();
  
  //RIGHT EAR
  fill(209,157,113);
  ellipse(-125,earSize,50,70);
  
  //LEFT EAR
  fill(209,157,113);
  ellipse(125,earSize,50,70);
  
  //FACE
  rectMode(CENTER);
  fill(237,194,142);
  rect(0,0,250,faceSize,Face); 
  
  //RIGHT SMALL EAR
  fill(237,194,142);
  ellipse(-125,earSize,20,40);
  
  //LEFT SMALL EAR
  fill(237,194,142);
  ellipse(125,earSize,20,40);
  
  //LEFT BLACK EYE
  fill(0,0,0);
  ellipse(-62.5,0,60,60);
  
  //LEFT WHITE EYE
  fill(225,225,225);
  ellipse(-62.5,0,50,50);
   
  //RIGHT BLACK EYE
  fill(0,0,0);
  ellipse(62.5,0,60,60);
  
  //RIGHT WHITE EYE
  fill(225,225,225);
  ellipse(62.5,0,50,50);
  
  //IRIS RED RIGHT
  fill(redChange1,redChange2,redChange3);
  ellipse(62.5 + righteyeMove,0,30,30);
  
  //IRIS RED LEFT
  fill(redChange1,redChange2,redChange3);
  ellipse(-62.5 + righteyeMove,0,30,30);
   
  //IRIS LIGHT BLUE RIGHT
  fill(5,89,114);
  ellipse(62.5 + righteyeMove,0,25,25);
  
  //IRIS LIGHT BLUE LEFT
  fill(5,89,114);
  ellipse(-62.5 + righteyeMove,0,25,25);
  
  //IRIS YELLOW LEFT
  fill(226,196,45);
  ellipse(-62.5 + righteyeMove,0,20,20); 
  
  //IRIS YELLOW RIGHT
  fill(226,196,45);
  ellipse(62.5 + righteyeMove,0,20,20); 
  
  //LEFT PUPIL 
  fill(0,0,0);
  ellipse(-62.5 + righteyeMove,0,eyeSize,eyeSize);
  
  //RIGHT PUPIL 
  fill(0,0,0);
  ellipse(62.5 + righteyeMove,0,eyeSize,eyeSize);
  
  //NOSE circle 
  fill(209,157,113);
  ellipse(0,35,50,20);
  
  //NOSE little right circle 
  fill(209,157,113);
  ellipse(20,38,19,15);
  
  //NOSE little left circle 
  fill(209,157,113);
  ellipse(-20,38,19,15);
  
  //RIGHT EYEBROW 
  rectMode(CENTER);
  fill(0,0,0);
  rect(62.5,eyeBrowup,60,20); 
   
  //LEFT EYEBROW 
  rectMode(CENTER);
  fill(0,0,0);
  rect(-62.5,eyeBrowup,60,20); 
  
  //HEADBAND GREEN
  rectMode(CENTER);
  fill(222,232,26);
  rect(0,-62,280,50,20); 
  
  //HEADBAND BLACK
  rectMode(CENTER);
  fill(0,0,0);
  rect(0,-62,280,30,20); 
  
  //HEADBAND WHITE
  rectMode(CENTER);
  fill(225,225,225);
  rect(0,-60,280,8,20); 
  
  //HEADBAND RED
  rectMode(CENTER);
  fill(225,0,0);
  rect(0,-60,280,2,20); 
  
  //HAIR PIECES
  fill(0,0,0);
  ellipse(40,-110,5,5);
  
  fill(0,0,0);
  ellipse(0,hairTrans,5,5);
  
  fill(0,0,0);
  ellipse(-40,-110,5,5);
  
  //STUBLE
  fill(0,0,0);
  ellipse(122,55,4,4);
  ellipse(122,65,4,4);
  ellipse(122,75,4,4);
  ellipse(122,85,4,4);
  ellipse(122,95,4,4);
  ellipse(122,105,4,4);
  
  ellipse(115,55,4,4);
  ellipse(115,65,4,4);
  ellipse(115,75,4,4);
  ellipse(115,85,4,4);
  ellipse(115,95,4,4);
  ellipse(115,105,4,4);
  ellipse(115,115,4,4);
  
  ellipse(108,55,4,4);
  ellipse(108,65,4,4);
  ellipse(108,75,4,4);
  ellipse(108,85,4,4);
  ellipse(108,95,4,4);
  ellipse(108,105,4,4);
  ellipse(108,115,4,4);
  
  ellipse(101,55,4,4);
  ellipse(101,65,4,4);
  ellipse(101,75,4,4);
  ellipse(101,85,4,4);
  ellipse(101,95,4,4);
  ellipse(101,105,4,4);
  ellipse(101,115,4,4);
  
  ellipse(94,55,4,4);
  ellipse(94,65,4,4);
  ellipse(94,75,4,4);
  ellipse(94,85,4,4);
  ellipse(94,95,4,4);
  ellipse(94,105,4,4);
  ellipse(94,115,4,4);
  
  ellipse(87,55,4,4);
  ellipse(87,65,4,4);
  ellipse(87,75,4,4);
  ellipse(87,85,4,4);
  ellipse(87,95,4,4);
  ellipse(87,105,4,4);
  ellipse(87,115,4,4);
  
  ellipse(80,55,4,4);
  ellipse(80,65,4,4);
  ellipse(80,75,4,4);
  ellipse(80,85,4,4);
  ellipse(80,95,4,4);
  ellipse(80,105,4,4);
  ellipse(80,115,4,4);
  
  ellipse(73,55,4,4);
  ellipse(73,65,4,4);
  ellipse(73,75,4,4);
  ellipse(73,85,4,4);
  ellipse(73,95,4,4);
  ellipse(73,105,4,4);
  ellipse(73,115,4,4);
  
  ellipse(66,55,4,4);
  ellipse(66,65,4,4);
  ellipse(66,75,4,4);
  ellipse(66,85,4,4);
  ellipse(66,95,4,4);
  ellipse(66,105,4,4);
  ellipse(66,115,4,4);
  
  ellipse(59,55,4,4);
  ellipse(59,65,4,4);
  ellipse(59,75,4,4);
  ellipse(59,85,4,4);
  ellipse(59,95,4,4);
  ellipse(59,105,4,4);
  ellipse(59,115,4,4);
  
  ellipse(52,55,4,4);
  ellipse(52,65,4,4);
  ellipse(52,75,4,4);
  ellipse(52,85,4,4);
  ellipse(52,95,4,4);
  ellipse(52,105,4,4);
  ellipse(52,115,4,4);
  
  ellipse(45,55,4,4);
  ellipse(45,65,4,4);
  ellipse(45,75,4,4);
  ellipse(45,85,4,4);
  ellipse(45,95,4,4);
  ellipse(45,105,4,4);
  ellipse(45,115,4,4);
  
  ellipse(38,55,4,4);
  ellipse(38,65,4,4);
  ellipse(38,75,4,4);
  ellipse(38,85,4,4);
  ellipse(38,95,4,4);
  ellipse(38,105,4,4);
  ellipse(38,115,4,4);
  
  ellipse(31,55,4,4);
  ellipse(31,65,4,4);
  ellipse(31,75,4,4);
  ellipse(31,85,4,4);
  ellipse(31,95,4,4);
  ellipse(31,105,4,4);
  ellipse(31,115,4,4);
  
  ellipse(24,55,4,4);
  ellipse(24,65,4,4);
  ellipse(24,75,4,4);
  ellipse(24,85,4,4);
  ellipse(24,95,4,4);
  ellipse(24,105,4,4);
  ellipse(24,115,4,4);
  
  ellipse(17,55,4,4);
  ellipse(17,65,4,4);
  ellipse(17,75,4,4);
  ellipse(17,85,4,4);
  ellipse(17,95,4,4);
  ellipse(17,105,4,4);
  ellipse(17,115,4,4);
  
  ellipse(10,55,4,4);
  ellipse(10,65,4,4);
  ellipse(10,75,4,4);
  ellipse(10,85,4,4);
  ellipse(10,95,4,4);
  ellipse(10,105,4,4);
  ellipse(10,115,4,4);
  
  ellipse(3,55,4,4);
  ellipse(3,65,4,4);
  ellipse(3,75,4,4);
  ellipse(3,85,4,4);
  ellipse(3,95,4,4);
  ellipse(3,105,4,4);
  ellipse(3,115,4,4);
  
  ellipse(-122,55,4,4);
  ellipse(-122,65,4,4);
  ellipse(-122,75,4,4);
  ellipse(-122,85,4,4);
  ellipse(-122,95,4,4);
  ellipse(-122,105,4,4);
  
  ellipse(-115,55,4,4);
  ellipse(-115,65,4,4);
  ellipse(-115,75,4,4);
  ellipse(-115,85,4,4);
  ellipse(-115,95,4,4);
  ellipse(-115,105,4,4);
  ellipse(-115,115,4,4);
  
  ellipse(-108,55,4,4);
  ellipse(-108,65,4,4);
  ellipse(-108,75,4,4);
  ellipse(-108,85,4,4);
  ellipse(-108,95,4,4);
  ellipse(-108,105,4,4);
  ellipse(-108,115,4,4);
  
  ellipse(-101,55,4,4);
  ellipse(-101,65,4,4);
  ellipse(-101,75,4,4);
  ellipse(-101,85,4,4);
  ellipse(-101,95,4,4);
  ellipse(-101,105,4,4);
  ellipse(-101,115,4,4);
  
  ellipse(-94,55,4,4);
  ellipse(-94,65,4,4);
  ellipse(-94,75,4,4);
  ellipse(-94,85,4,4);
  ellipse(-94,95,4,4);
  ellipse(-94,105,4,4);
  ellipse(-94,115,4,4);
  
  ellipse(-87,55,4,4);
  ellipse(-87,65,4,4);
  ellipse(-87,75,4,4);
  ellipse(-87,85,4,4);
  ellipse(-87,95,4,4);
  ellipse(-87,105,4,4);
  ellipse(-87,115,4,4);
  
  ellipse(-80,55,4,4);
  ellipse(-80,65,4,4);
  ellipse(-80,75,4,4);
  ellipse(-80,85,4,4);
  ellipse(-80,95,4,4);
  ellipse(-80,105,4,4);
  ellipse(-80,115,4,4);
  
  ellipse(-73,55,4,4);
  ellipse(-73,65,4,4);
  ellipse(-73,75,4,4);
  ellipse(-73,85,4,4);
  ellipse(-73,95,4,4);
  ellipse(-73,105,4,4);
  ellipse(-73,115,4,4);
  
  ellipse(-66,55,4,4);
  ellipse(-66,65,4,4);
  ellipse(-66,75,4,4);
  ellipse(-66,85,4,4);
  ellipse(-66,95,4,4);
  ellipse(-66,105,4,4);
  ellipse(-66,115,4,4);
  
  ellipse(-59,55,4,4);
  ellipse(-59,65,4,4);
  ellipse(-59,75,4,4);
  ellipse(-59,85,4,4);
  ellipse(-59,95,4,4);
  ellipse(-59,105,4,4);
  ellipse(-59,115,4,4);
  
  ellipse(-52,55,4,4);
  ellipse(-52,65,4,4);
  ellipse(-52,75,4,4);
  ellipse(-52,85,4,4);
  ellipse(-52,95,4,4);
  ellipse(-52,105,4,4);
  ellipse(-52,115,4,4);
  
  ellipse(-45,55,4,4);
  ellipse(-45,65,4,4);
  ellipse(-45,75,4,4);
  ellipse(-45,85,4,4);
  ellipse(-45,95,4,4);
  ellipse(-45,105,4,4);
  ellipse(-45,115,4,4);
  
  ellipse(-38,55,4,4);
  ellipse(-38,65,4,4);
  ellipse(-38,75,4,4);
  ellipse(-38,85,4,4);
  ellipse(-38,95,4,4);
  ellipse(-38,105,4,4);
  ellipse(-38,115,4,4);
  
  ellipse(-31,55,4,4);
  ellipse(-31,65,4,4);
  ellipse(-31,75,4,4);
  ellipse(-31,85,4,4);
  ellipse(-31,95,4,4);
  ellipse(-31,105,4,4);
  ellipse(-31,115,4,4);
  
  ellipse(-24,55,4,4);
  ellipse(-24,65,4,4);
  ellipse(-24,75,4,4);
  ellipse(-24,85,4,4);
  ellipse(-24,95,4,4);
  ellipse(-24,105,4,4);
  ellipse(-24,115,4,4);
  
  ellipse(-17,55,4,4);
  ellipse(-17,65,4,4);
  ellipse(-17,75,4,4);
  ellipse(-17,85,4,4);
  ellipse(-17,95,4,4);
  ellipse(-17,105,4,4);
  ellipse(-17,115,4,4);
  
  ellipse(-10,55,4,4);
  ellipse(-10,65,4,4);
  ellipse(-10,75,4,4);
  ellipse(-10,85,4,4);
  ellipse(-10,95,4,4);
  ellipse(-10,105,4,4);
  ellipse(-10,115,4,4);
  
  ellipse(-3,55,4,4);
  ellipse(-3,65,4,4);
  ellipse(-3,75,4,4);
  ellipse(-3,85,4,4);
  ellipse(-3,95,4,4);
  ellipse(-3,105,4,4);
  ellipse(-3,115,4,4);
  
  //MOUTH DARK TAN CIRCLE
  fill(209,157,113);
  ellipse(0,81,72,40);
  
  //MOUTH BLACK CIRCLE
  fill(0,0,0);
  ellipse(0,81,70,disMouth); 
  
  //TONGUE RED LONG CIRCLE
  fill(142,27,60);
  arc(0,92,50,15, -1, PI+QUARTER_PI, OPEN);
  
  //TONGUE RIGHT CIRCLE RED
  fill(142,27,60);
  ellipse(13,90,27,13); 
  
  //TONGUE LEFT CIRCLE PINK 
  fill(142,27,60);
  ellipse(-13,90,27,13); 
  
  //SWEATDRIP
  translate(110,sweatDrip);
  fill(sweatColor1,sweatColor2,sweatColor3);
  triangle(2,-5,-8,15,8,15);
  ellipse(0,17,17,17);

}








