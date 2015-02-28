

boolean clicked = false;
 
int browRightA=5;
int browRightB=-50;
int browRightC=-35;
int browRightD=-35;
int browRightE=25;
int browLeftA=-5;
int browLeftB=-50;
int browLeftC=-35;
int browLeftD=-35;
int browLeftE=25;
int firstMouthAa=0;
int firstMouthAb=0;
int firstMouthAc=0;
int firstMouthBa=-30;
int firstMouthBb=48;
int firstMouthBc=60;
int firstMouthBd=3;
int firstMouthBe=5;
int firstMouthCa=255;
int firstMouthCb=255;
int firstMouthCc=255;
int firstMouthDa=-25;
int firstMouthDb=51;
int firstMouthDc=-19;
int firstMouthDd=51;
int firstMouthDe=-22;
int firstMouthDf=60;
int firstMouthEa=25;
int firstMouthEb=51;
int firstMouthEc=19;
int firstMouthEd=51;
int firstMouthEe=22;
int firstMouthEf=60;

 
float hairColorR = 62;
float hairColorG = 184;
float hairColorB = 119;
float eyeColorR = 0;
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
  background(214,246,255);
  noStroke();

  createFont("magsfont.vwl");
  PFont fancyFont;
  fancyFont = loadFont("magsfont.vlw");
  loadFont("magsfont.vlw");
  textFont(fancyFont, 16);
  
  fill(0,0,0);
  text("Click this image and then press any key to", 25, 20);
  text("generate a random Bat Gal.", 80, 35);
}
void keyPressed(){
  clicked=! clicked;
   
  hairColorR = random(0,50);
  hairColorG = random(225,255);
  hairColorB = random(0,255);
  eyeColorR = random(0,0);
  eyeColorG  = random(0,0);
  eyeColorB  = random(0,0);
  pupilA = random(7,18);
  pupilB = random(7,30);
  bigEarringR = random(0,255);
  bigEarringG = random(0,255);
  bigEarringB = random(0,255);
  smallEarringR = random(0,255);
  smallEarringG = random(0,255);
  smallEarringB = random(0,255);
  shirtColor = random(0,255);
  noseA = random (22,35);
  noseB = random (13,30);
 
 
}
 
void draw() {
  hint(ENABLE_NATIVE_FONTS);
fill(0,0,0);  

  //loadFont("ArialUnicodeMS-15.vlw");
  //textFont("ArialUnicodeMS-15.vlw");
  //textSize(15);
  //text("Click this image and then press any key to", 30, 20);
  //text("generate a random Bat Gal", 75, 35);

//String s = "Click this image and then press any key to generate a random Bat Gal";
//fill(50);
//text(s, 10, 10, 70, 80);

 
   
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
fill(eyeColorR,eyeColorG,eyeColorB);
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




