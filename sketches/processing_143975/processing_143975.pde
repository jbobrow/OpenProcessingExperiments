
import processing.pdf.*;
int x = 0;


 
int browRightA= 10;
int browRightB=-100;
int browRightC=-70;
int browRightD=-70;
int browRightE=50;
int browLeftA=-10;
int browLeftB=-100;
int browLeftC=-70;
int browLeftD=-70;
int browLeftE=50;
int firstMouthAa=0;
int firstMouthAb=0;
int firstMouthAc=0;
int firstMouthBa=-60;
int firstMouthBb=96;
int firstMouthBc=120;
int firstMouthBd=6;
int firstMouthBe=10;
int firstMouthCa=255;
int firstMouthCb=255;
int firstMouthCc=255;
int firstMouthDa=-50;
int firstMouthDb=102;
int firstMouthDc=-38;
int firstMouthDd=102;
int firstMouthDe=-44;
int firstMouthDf=120;
int firstMouthEa=50;
int firstMouthEb=102;
int firstMouthEc=38;
int firstMouthEd=102;
int firstMouthEe=44;
int firstMouthEf=120;


float hairColorR = 62;
float hairColorG = 184;
float hairColorB = 119;
float eyeColorR = 0;
float eyeColorG = 0;
float eyeColorB = 0;
float pupilA = 36;
float pupilB = 44;
float bigEarringR =105;
float bigEarringG =255;
float bigEarringB =220;
float smallEarringR =105;
float smallEarringG =255;
float smallEarringB =220;
float shirtColor = 84;
float noseA = 50;
float noseB = 40;


void setup(){
  size(3525,5325);
  background(255,255,255);
  
  noStroke();
  beginRecord(PDF, "BIG_PRINT.pdf");
  translate(293.75,293.75);
  repeatShape();
  endRecord();
  }


void draw(){ 
  

}

void makeShape(){
  //~~~HEAD~~~

noStroke();
 
//SHIRT
fill(shirtColor,shirtColor,shirtColor);
ellipse(0,260,440,60);
rect(-220,260, 440, 100, 10);
triangle(-210,360,-218,254,-250,360);
triangle(110,360,218,254,250,360);
 
//NECK
fill(234,181,255);
rect(-60,140, 120, 100,10);
ellipse(0,236,120,40);
fill(194,132,219);
rect(-60,140, 120, 46,10);
 
//ACTUAL HEAD
 
 
fill(234,181,255);
rect(-140,-100,280,260,10,10,100,100);
 
//SIDEBURNS
fill(hairColorR,hairColorG,hairColorB);
rect(124,-60,16,40);
rect(-140,-60,16,40);
 
 
//HAIR
fill(hairColorR,hairColorG,hairColorB);
rect(-150, -200, 300, 140, 200, 200, 4, 4);
fill(135,135,135);
ellipse(0,-204,120,80);
fill(hairColorR,hairColorG,hairColorB);
ellipse(0,-220,120,110);
 
//CHIN
fill(194,132,219);
ellipse(0,180,110,40);
fill(234,181,255);
ellipse(0,140, 160, 80);
 
//HAIR PART
fill(234,181,255);
triangle(40,-58,72,-114,84,-58);
 
 
 
//~~~EYES~~~
 
fill(255,255,255);
ellipse(60,-30,60,70);
ellipse(-60,-30,60,70);
fill(eyeColorR,eyeColorG,eyeColorB);
//PUPIL
ellipse(60,-30,pupilA,pupilB);
ellipse(-60,-30,pupilA,pupilB);
//HIGHLIGHT
fill(255,255,255);
ellipse(64,-40,14,14);
ellipse(-56,-40,14,14);
 
//EYELASHES
fill(0,0,0);
stroke(2);
strokeWeight(4);
line(90,-46,100,-50);
line(92,-34,100,-38);
line(-90,-36,-100,-50);
line(-92,-34,-100,-38);
 
//EYEBROWS
noFill();
curve(browRightA,browRightB, 30,browRightC, 90,browRightD, 210,browRightE);
curve(browLeftA,browLeftB, -30,browLeftC, -90,browLeftD, -210,browLeftE);
 
noStroke();
 
 
//MOUTH
fill(firstMouthAa,firstMouthAb,firstMouthAc);
rect(firstMouthBa,firstMouthBb,firstMouthBc,firstMouthBd,firstMouthBe);
fill(firstMouthCa,firstMouthCb,firstMouthCc);
triangle(firstMouthDa,firstMouthDb,firstMouthDc,firstMouthDd,firstMouthDe,firstMouthDf);
triangle(firstMouthEa,firstMouthEb,firstMouthEc,firstMouthEd,firstMouthEe,firstMouthEf);

noStroke();

//NOSE
fill(196,80,242);
 
pushMatrix();
translate(0, 40);
 
triangle(0,-80,-20,20,20,20);
 
fill(158,68,194);
ellipse(0,10,noseA,noseB);
 
fill(255,255,255);
ellipse(-16,0,8,6);
popMatrix();
 
 
 
//RIGHT EAR
noStroke();
fill(234,181,255);
pushMatrix();
translate(20, -60);
quad(76, 62, 172, 0, 138, 126, 20, 152);
 
//EAR SHADE
fill(193,124,217);
triangle(118, 62, 142, 40, 118, 116);
 
 
 
//EARRING RIGHT
fill(bigEarringR,bigEarringG,bigEarringB);
ellipse(126,116,14,14);
fill(smallEarringR,smallEarringG,smallEarringB);
ellipse(136,104,10,10);
 
 
popMatrix();
 
//SIDEBURN
fill(hairColorR,hairColorG,hairColorB);
triangle(124,-20,124,20,140,-26);
 
//LEFT EAR
fill(234,181,255);
pushMatrix();
translate(-20, -60);
quad(-76, 62, -172, 0, -138, 126, -20, 152);
 
//EAR SHADE
fill(193,124,217);
triangle(-118, 62, -142, 40, -118, 116);
 
//EARRING LEFT
fill(bigEarringR,bigEarringG,bigEarringB);
ellipse(-126,116,14,14);
fill(smallEarringR,smallEarringG,smallEarringB);
ellipse(-136,104,10,10);
popMatrix();
 
//SIDEBURN
fill(hairColorR,hairColorG,hairColorB);
triangle(-124,-20,-124,20,-140,-26);
 
//FRECKLES
fill(170,109,194);
ellipse(-40,40,5,5);
ellipse(-50,50,5,5);
ellipse(-60,44,5,5);
ellipse(-70,54,5,5);
ellipse(-80,40,5,5);
ellipse(-68,32,5,5);
ellipse(-52,34,5,5);
ellipse(-40,28,5,5);
ellipse(-26,26,5,5);
ellipse(-30,39,5,5);
ellipse(-12,14,5,5);
ellipse(-16,26,5,5);
ellipse(-6,20,5,5);
ellipse(0,14,5,5);
ellipse(40,40,5,5);
ellipse(50,50,5,5);
ellipse(60,44,5,5);
ellipse(70,54,5,5);
ellipse(80,40,5,5);
ellipse(68,32,5,5);
ellipse(52,34,5,5);
ellipse(40,28,5,5);
ellipse(26,26,5,5);
ellipse(30,36,5,5);
ellipse(12,14,5,5);
ellipse(16,26,5,5);
ellipse(6,20,5,5);
ellipse(-26,16,5,5);
ellipse(-54,24,5,5);
ellipse(-40,16,5,5);
ellipse(-74,20,5,5);
ellipse(-86,30,5,5);
ellipse(26,16,5,5);
ellipse(54,24,5,5);
ellipse(40,16,5,5);
ellipse(74,20,5,5);
ellipse(86,30,5,5);
ellipse(88,54,5,5);
ellipse(-88,54,5,5);
}

void repeatShape(){
  for (int i=0; i< 108; i++) {
    println("MEH" + i);
    makeShape(); 
    translate(587.5,0);
    x++;
    if (x == 6){
      x = 0;
      translate(-3525,587.5);
    }
 
   
  hairColorR = random(0,50);
  hairColorG = random(225,255);
  hairColorB = random(0,255);
  eyeColorR = random(0,0);
  eyeColorG  = random(0,0);
  eyeColorB  = random(0,0);
  pupilA = random(14,36);
  pupilB = random(14,60);
  bigEarringR = random(0,255);
  bigEarringG = random(0,255);
  bigEarringB = random(0,255);
  smallEarringR = random(0,255);
  smallEarringG = random(0,255);
  smallEarringB = random(0,255);
  shirtColor = random(0,255);
  noseA = random (44,70);
  noseB = random (26,60);

    
   }
 }




