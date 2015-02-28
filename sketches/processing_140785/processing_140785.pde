

boolean clicked = false;

int browRightA;
int browRightB;
int browRightC;
int browRightD;
int browRightE;
int browLeftA;
int browLeftB;
int browLeftC;
int browLeftD;
int browLeftE;
int firstMouthAa;
int firstMouthAb;
int firstMouthAc;
int firstMouthBa;
int firstMouthBb;
int firstMouthBc;
int firstMouthBd;
int firstMouthBe;
int firstMouthCa;
int firstMouthCb;
int firstMouthCc;
int firstMouthDa;
int firstMouthDb;
int firstMouthDc;
int firstMouthDd;
int firstMouthDe;
int firstMouthDf;
int firstMouthEa;
int firstMouthEb;
int firstMouthEc;
int firstMouthEd;
int firstMouthEe;
int firstMouthEf;
int secondMouthAa;
int secondMouthAb;
int secondMouthAc;
int secondMouthBa;
int secondMouthBb;
int secondMouthBc;
int secondMouthBd;
int secondMouthBe;
int secondMouthBf;
int secondMouthCa;
int secondMouthCb;
int secondMouthCc;
int secondMouthCd;
int secondMouthCe;
int secondMouthCf;
int secondMouthDa;
int secondMouthDb;
int secondMouthDc;
int secondMouthDd;
int secondMouthDe;
int secondMouthDf;
int secondMouthDg;
int secondMouthDh;

float hairColorR = 159;
float hairColorG = 255;
float hairColorB = 133;
float eyeColorG = 0;
float eyeColorB = 0;
float pupilA = 18;
float pupilB = 22;
float bigEarringR =105;
float bigEarringG =255;
float bigEarringB =220;
float smallEarringR =105;
float smallEarringG =255;
float smallEarringB =220;
float shirtColor = 84;
float noseA = 25;
float noseB = 20;



void setup(){
  size(350,350);
  background(120,70,195);
  noStroke();
}


void keyPressed(){
  clicked=! clicked;
  
  hairColorR = random(0,1);
  hairColorG = random(254,255);
  hairColorB = random(0,255);
  eyeColorG  = random(0,255);
  eyeColorB  = random(0,255);
  pupilA = random(5,18);
  pupilB = random(5,30);
  bigEarringR = random(0,255);
  bigEarringG = random(0,255);
  bigEarringB = random(0,255);
  smallEarringR = random(0,255);
  smallEarringG = random(0,255);
  smallEarringB = random(0,255);
  shirtColor = random(0,255);
  noseA = random (22,35);
  noseB = random (12,30);


}

void draw() {
  
  if (clicked == false) {
    browRightA = 5;
    browRightB = -50;
    browRightC = -35;
    browRightD = -35;
    browRightE = 25;
    browLeftA = -5;
    browLeftB = -50;
    browLeftC = -35;
    browLeftD = -35;
    browLeftE = 25;
    firstMouthAa = 0;
    firstMouthAb = 0;
    firstMouthAc = 0;
    firstMouthBa = -30;
    firstMouthBb = 48;
    firstMouthBc = 60;
    firstMouthBd = 3;
    firstMouthBe = 5;
    firstMouthCa = 255;
    firstMouthCb = 255;
    firstMouthCc = 255;
    firstMouthDa = -25;
    firstMouthDb = 51;
    firstMouthDc = -19;
    firstMouthDd = 51;
    firstMouthDe = -22;
    firstMouthDf = 60;
    firstMouthEa = 25;
    firstMouthEb = 51;
    firstMouthEc = 19;
    firstMouthEd = 51;
    firstMouthEe = 22;
    firstMouthEf = 60;
    secondMouthAa = 0;
    secondMouthAb = 0;
    secondMouthAc = 0;
    secondMouthBa = 0;
    secondMouthBb = 0;
    secondMouthBc = 0;
    secondMouthBd = 0;
    secondMouthBe = 0;
    secondMouthBf = 0;
    secondMouthCa = 0;
    secondMouthCb = 0;
    secondMouthCc = 0;
    secondMouthCd = 0;
    secondMouthCe = 0;
    secondMouthCf = 0;
    secondMouthDa = 0;
    secondMouthDb = 0;
    secondMouthDc = 0;
    secondMouthDd = 0;
    secondMouthDe = 0;
    secondMouthDf = 0;
    secondMouthDg = 0;
    secondMouthDh = 0;

  }
  
   if (clicked == true) {
    browRightA = 10;
    browRightB = -55;
    browRightC = -40;
    browRightD = -40;
    browRightE = 35;
    browLeftA = -5;
    browLeftB = -50;
    browLeftC = -30;
    browLeftD = -33;
    browLeftE = 25;
    firstMouthAa = 0;
    firstMouthAb = 0;
    firstMouthAc = 0;
    firstMouthBa = 0;
    firstMouthBb = 0;
    firstMouthBc = 0;
    firstMouthBd = 0;
    firstMouthBe = 0;
    firstMouthCa = 0;
    firstMouthCb = 0;
    firstMouthCc = 0;
    firstMouthDa = 0;
    firstMouthDb = 0;
    firstMouthDc = 0;
    firstMouthDd = 0;
    firstMouthDe = 0;
    firstMouthDf = 0;
    firstMouthEa = 0;
    firstMouthEb = 0;
    firstMouthEc = 0;
    firstMouthEd = 0;
    firstMouthEe = 0;
    firstMouthEf = 0;
    secondMouthAa = 255;
    secondMouthAb = 255;
    secondMouthAc = 255;
    secondMouthBa = -13;
    secondMouthBb = 55;
    secondMouthBc = -7;
    secondMouthBd = 55;
    secondMouthBe = -10;
    secondMouthBf = 64;
    secondMouthCa = 20;
    secondMouthCb = 51;
    secondMouthCc = 14;
    secondMouthCd = 51;
    secondMouthCe = 17;
    secondMouthCf = 64;
    secondMouthDa = 15;
    secondMouthDb = 2;
    secondMouthDc = -20;
    secondMouthDd = 50;
    secondMouthDe = 25;
    secondMouthDf = 47;
    secondMouthDg = 20;
    secondMouthDh = 2;

   }

  
//~~~HEAD~~~
translate(175,175);
noStroke();

//SHIRT
fill(shirtColor,shirtColor,shirtColor);
ellipse(0,130,220,30);
rect(-110,130, 220, 50, 5);
triangle(-105,175,-109,127,-125,175);
triangle(105,175,109,127,125,175);

//NECK
fill(234,181,255);
rect(-30,70, 60, 50,5);
ellipse(0,118,60,20);
fill(194,132,219);
rect(-30,70, 60, 23,5);

//ACTUAL HEAD


fill(234,181,255);
rect(-70,-50,140,130,5,5,50,50);

//SIDEBURNS
fill(hairColorR,hairColorG,hairColorB);
rect(62,-30,8,20);
rect(-70,-30,8,20);


//HAIR
fill(hairColorR,hairColorG,hairColorB);
rect(-75, -100, 150, 70, 100, 100, 2, 2);
fill(135,135,135);
ellipse(0,-102,60,40);
fill(hairColorR,hairColorG,hairColorB);
ellipse(0,-110,60,55);

//CHIN
fill(194,132,219);
ellipse(0,90,55,20);
fill(234,181,255);
ellipse(0,70, 80, 40);

//HAIR PART
fill(234,181,255);
triangle(20,-29,36,-57,42,-29);



//~~~EYES~~~

fill(255,255,255);
ellipse(30,-15,30,35);
ellipse(-30,-15,30,35);
fill(0,eyeColorG,eyeColorB);
//PUPIL
ellipse(30,-15,pupilA,pupilB);
ellipse(-30,-15,pupilA,pupilB);
//HIGHLIGHT
fill(255,255,255);
ellipse(32,-20,7,7);
ellipse(-28,-20,7,7);

//EYELASHES
fill(0,0,0);
stroke(2);
strokeWeight(2);
line(45,-23,50,-25);
line(46,-17,50,-19);
line(-45,-23,-50,-25);
line(-46,-17,-50,-19);

//EYEBROWS
noFill();
curve(browRightA,browRightB, 15,browRightC, 45,browRightD, 105,browRightE);
curve(browLeftA,browLeftB, -15,browLeftC, -45,browLeftD, -105,browLeftE);

noStroke();


//MOUTH
fill(firstMouthAa,firstMouthAb,firstMouthAc);
rect(firstMouthBa,firstMouthBb,firstMouthBc,firstMouthBd,firstMouthBe);
fill(firstMouthCa,firstMouthCb,firstMouthCc);
triangle(firstMouthDa,firstMouthDb,firstMouthDc,firstMouthDd,firstMouthDe,firstMouthDf);
triangle(firstMouthEa,firstMouthEb,firstMouthEc,firstMouthEd,firstMouthEe,firstMouthEf);


//MOUTH 2
fill(secondMouthAa,secondMouthAb,secondMouthAc);
triangle(secondMouthBa,secondMouthBb,secondMouthBc,secondMouthBd,secondMouthBe,secondMouthBf);
triangle(secondMouthCa,secondMouthCb,secondMouthCc,secondMouthCd,secondMouthCe,secondMouthCf);

noFill();
stroke(5);
strokeWeight(3);
curve(secondMouthDa,secondMouthDb,secondMouthDc,secondMouthDd,secondMouthDe,secondMouthDf,secondMouthDg,secondMouthDh);

noStroke();





//NOSE
fill(196,80,242);

pushMatrix();
translate(0, 20);

triangle(0,-40,-10,10,10,10);

fill(158,68,194);
ellipse(0,5,noseA,noseB);

fill(255,255,255);
ellipse(-8,0,4,3);
popMatrix();



//RIGHT EAR
noStroke();
fill(234,181,255);
pushMatrix();
translate(10, -30);
quad(38, 31, 86, 0, 69, 63, 10, 76);

//EAR SHADE
fill(193,124,217);
triangle(59, 31, 71, 20, 59, 58);



//EARRING RIGHT
fill(bigEarringR,bigEarringG,bigEarringB);
ellipse(63,58,7,7);
fill(smallEarringR,smallEarringG,smallEarringB);
ellipse(68,52,5,5);


popMatrix();

//SIDEBURN
fill(hairColorR,hairColorG,hairColorB);
triangle(62,-10,62,10,70,-13);

//LEFT EAR
fill(234,181,255);
pushMatrix();
translate(-10, -30);
quad(-38, 31, -86, 0, -69, 63, -10, 76);

//EAR SHADE
fill(193,124,217);
triangle(-59, 31, -71, 20, -59, 58);

//EARRING LEFT
fill(bigEarringR,bigEarringG,bigEarringB);
ellipse(-63,58,7,7);
fill(smallEarringR,smallEarringG,smallEarringB);
ellipse(-68,52,5,5);
popMatrix();

//SIDEBURN
fill(hairColorR,hairColorG,hairColorB);
triangle(-62,-10,-62,10,-70,-13);

//FRECKLES
fill(170,109,194);
ellipse(-20,20,2.5,2.5);
ellipse(-25,25,2.5,2.5);
ellipse(-30,22,2.5,2.5);
ellipse(-35,27,2.5,2.5);
ellipse(-40,20,2.5,2.5);
ellipse(-34,16,2.5,2.5);
ellipse(-26,17,2.5,2.5);
ellipse(-20,14,2.5,2.5);
ellipse(-13,13,2.5,2.5);
ellipse(-15,18,2.5,2.5);
ellipse(-6,7,2.5,2.5);
ellipse(-8,13,2.5,2.5);
ellipse(-3,10,2.5,2.5);
ellipse(0,7,2.5,2.5);
ellipse(20,20,2.5,2.5);
ellipse(25,25,2.5,2.5);
ellipse(30,22,2.5,2.5);
ellipse(35,27,2.5,2.5);
ellipse(40,20,2.5,2.5);
ellipse(34,16,2.5,2.5);
ellipse(26,17,2.5,2.5);
ellipse(20,14,2.5,2.5);
ellipse(13,13,2.5,2.5);
ellipse(15,18,2.5,2.5);
ellipse(6,7,2.5,2.5);
ellipse(8,13,2.5,2.5);
ellipse(3,10,2.5,2.5);
ellipse(-13,8,2.5,2.5);
ellipse(-27,12,2.5,2.5);
ellipse(-20,8,2.5,2.5);
ellipse(-37,10,2.5,2.5);
ellipse(-43,15,2.5,2.5);
ellipse(13,8,2.5,2.5);
ellipse(27,12,2.5,2.5);
ellipse(20,8,2.5,2.5);
ellipse(37,10,2.5,2.5);
ellipse(43,15,2.5,2.5);
ellipse(44,27,2.5,2.5);
ellipse(-44,27,2.5,2.5);

}
