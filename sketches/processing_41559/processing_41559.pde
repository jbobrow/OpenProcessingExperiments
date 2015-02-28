
PImage limeHead;
PImage leftAnkle;
PImage rightAnkle;
PImage eye1;
PImage eye2;
PImage leftShoe;
PImage rightShoe;
PImage belly;
PImage belly2;
PImage chest;
PImage upperChest;
PImage torso;
PImage crotch;
PImage leg;
PImage rleg;
PImage Lshin;
PImage Rshin;
PImage Lknee;
PImage Rknee;
PImage leftSock;
PImage rightSock;
PImage limeNeck; 


float cloudMove;
 float CX;
 float CY;
// float CX2 = 150;


void setup () {
  
  CX = 0;
  CY = 100;
  cloudMove =  (.6);

  size (800, 800);
  frameRate (60);

  limeHead = loadImage ("limeHead2.png");
  leftAnkle = loadImage ("limeNeck.png");
  rightAnkle = loadImage ("limeNeck.png");
  eye1 = loadImage ("eyes.png");
  eye2 = loadImage ("eyes.png");
  leftShoe = loadImage ("leftShoe.png");
  rightShoe = loadImage ("rightShoe.png");
  belly = loadImage ("limeHead2.png");
  belly2 = loadImage ("belly_2.png");
  chest = loadImage ("lime_chest.png");
  upperChest = loadImage ("upper_chest.png");
  torso = loadImage ("torso.png");
  crotch = loadImage ("leopard_crotch.png");
  leg = loadImage ("leg.png");
  rleg = loadImage ("rleg.png");
  Lknee = loadImage ("knee.png");
  Rknee = loadImage ("knee.png");
  Rshin = loadImage ("leg.png");
  Lshin = loadImage ("rleg.png");
  leftSock = loadImage ("leftSock.png");
  rightSock = loadImage ("rightSock.png");
  limeNeck = loadImage ("limeNeck2.png");

  imageMode (CENTER);
  
}


void draw () {
 
 
  background (#92B4B7);
 
  smooth();

 // float cloudMove = (millis()/7);
   cloud (0, 0, .95);
   cloud (400, 100, .7);

  cloud (700 , 300, 1.2);
 cloud (-200 , 200, 1.5);
  cloud (450 , 400, 1.3);
//cloudXval = cloudXval + (millis()/7);
 
  sideWalk (0,0);
 
  
  head (200, 100);

  limeNeck ();

  drawTorso ();
  drawUpperChest ();
  
  drawLeftLeg();
  drawRightLeg();
  
  drawBelly ();


  //POINTS OF PIVOT!

//  fill (255, 0, 0);
//  //NECK
//  ellipse (380, 155, 5, 5);
//
//  //BOTTOM OF NECK
//  ellipse (380, 212, 5, 5);
//
//  //BELLY (EXACTLY WHAT PARTS CORRELATE??
//  ellipse (380, 320, 5, 5);
//
//  //TOP OF LEFT LEG (KNEES TRACK BOTTOM OF THE FEMUR PART) HOW TO DO THAT?
//  ellipse (350, 405, 5, 5);
//
//  //TOP OF RIGHT LEG
//  ellipse (423, 405, 5, 5);
//
//  //TOP OF LOWER LEFT LEG
//  ellipse (340, 530, 5, 5);
//
//  //TOP OF LOWER RIGHT LEG
//  ellipse (440, 530, 5, 5);
//
//  //LEFT ANKLE
//  ellipse (360, 700, 5, 5);
//
//  //RIGHT ANKLE
//  ellipse (420, 700, 5, 5);
}




///////////   IINDIVIDUAL DRAW FUNCTIONS    ///////////////////////



//HEAD
void head (int x, int y) {

  float headx = 6*sin(frameCount/3);

  pushMatrix ();

  translate (headx, 0);

  pushMatrix();

  scale (0.5, 0.5);
  //  rotate (ang2);
  image (limeHead, 778, 250);
  popMatrix();


  //eye shadow
  noStroke();
  fill (0, y-20);
  //right 
  ellipse (403, 100, 30, 10);
  //left 
  ellipse (362, 100, 30, 10);

  //eyes

  //left
  pushMatrix ();
  scale (0.5, 0.5);
  image (eye1, 730, 170);
  popMatrix ();

  //right
  pushMatrix ();
  scale (0.5, 0.5);
  image (eye2, 810, 170);
  popMatrix ();

  //PUPILS
  fill (0);
  //right
  ellipse (407, 85, 10, 10);
  //left
  ellipse (365, 85, 10, 10);

  popMatrix();
}

//NECK

void limeNeck () {

  float neckWiggle =  .1*sin(frameCount/3);

  pushMatrix();
  translate(380, 212);
  rotate ( neckWiggle );


  image (limeNeck, 0, -10);
  //380, 220,
  popMatrix();
}

//BELLY
void drawBelly () {
  float bellyMove = 2.5*sin(frameCount/1.5);
  
  pushMatrix ();
  translate (382, 360);
  image (belly2, 0 , bellyMove);
  // 382, 360
  popMatrix();
  
  pushMatrix ();
  translate (380, 390);
  image (crotch, 0 , bellyMove);
  popMatrix ();
  
}



//UPPER CHEST
void drawUpperChest () {
  float chestMove = 1.5*sin(frameCount/1.5);
  
pushMatrix ();
translate (381, 270);
  image(upperChest, chestMove, 0);
  //381, 270
  popMatrix ();
}


//TORSO
void drawTorso () {
float torsoMove = 1.5*sin(frameCount/1.5);

pushMatrix ();
translate (382, 331);
  image (torso, torsoMove, 0);
  popMatrix ();
}

//UPPER LEGS
void drawLeftLeg () {

  float ang1 =  0.7 * (cos(millis()/200.0) + 1);

  float ang1B =  0.5 * (cos(millis()/170.0) - 1);

  float ang1C =  0.1 * (cos(millis()/170.0) + 1);


  pushMatrix ();
  translate (340, 400);
  //423, 405
  rotate (ang1);
  pushMatrix ();

  scale (1.2, 1.0);
  image (leg, 0, 65);
  //290, 450
  popMatrix();

  //LEFT KNEE
  pushMatrix();
  scale (1.1, 1.1);
  image (Lknee, -13, 125);
  popMatrix();

  //SHIN
  pushMatrix();
  translate(5, 153);
  rotate (ang1B);
  image (Lshin, 0, 55);
  //353, 610

  //Left Sock
  pushMatrix ();
  translate (3, 120);
  scale (0.4, 0.5);
  image (leftSock, 0, 0);
  //900, 1400
  popMatrix ();

  //Left Shoe
  pushMatrix ();
  translate (-40, 150);
  rotate (ang1C);
  scale (0.32, 0.32);
  image (leftShoe, 0, 0);
  //990, 2300
  popMatrix ();
  popMatrix ();
  popMatrix ();
}


void drawRightLeg () {

  float ang2 =  0.7 * (sin(millis()/200.0) - 1);
  //145

  float ang2B =  0.5 * (sin(millis()/170.0) + 1);
  //170

  float ang2C =  0.1 * (sin(millis()/170.0) - 1);
  //170

  pushMatrix ();
  translate (423, 405);
  //423, 405
  rotate (ang2);
  //leg
  pushMatrix ();
  scale (1.2, 1.0);
  image (rleg, 0, 45);
  //355, 450
  popMatrix();


  //KNEES
  pushMatrix();
  scale (1.1, 1.1);
  image (Rknee, 10, 110);
  popMatrix ();

  //SHIN
  pushMatrix();
  translate(0, 130);
  rotate(ang2B);
  image (Rshin, -5, 65);
  //427, 610

//SOCKS
  // rightSock 
  pushMatrix ();
  translate (-10, 150);
  scale (0.4, 0.5);
  image (rightSock, 0, 0);
  //1055, 1400
  popMatrix ();

  // rightShoe  
  pushMatrix ();
  translate (30, 180);
  rotate (ang2C);
  scale (0.32, 0.32);
  image (rightShoe, 0, 0);
  //1450, 2300
  popMatrix ();

  popMatrix();

  popMatrix ();
}

void sideWalk (float a, int b) {
  //drawn side walk
  fill (140);
rect (0,700, 800, 100);

 float sideWalkMove = (millis()/7);
 float lnSpacing;
 
for ( lnSpacing = -100000; lnSpacing < 801; lnSpacing = lnSpacing + 200) {
stroke (0);
line (lnSpacing + sideWalkMove, 700,  (lnSpacing- 200) + sideWalkMove, 800);
noStroke();
} 
if (lnSpacing > 600) {
 lnSpacing = 0;
}

}


void cloud (int x, int y, float s) {
  
 pushMatrix();
  translate (x, y);
  scale(s);
 //   posX = 100, posY = 100
//  float cloudMove = (millis()/10);
// float CX = 0;
// float CY = 100;
// float CX2 = 150;
 


 fill (255, 255, 255);
  ellipse (CX + 35, CY + 15, 50, 50);
  //135, 115
  
  ellipse (CX + 25, CY, 50, 50);
  //125, 100
  ellipse (CX, CY + 10, 80, 40);
  
  //150, 110
  ellipse (CX, CY + 20, 60,40);
  //100, 120
  ellipse (CX - 30, CY + 5, 45, 30);
  //70, 105
  ellipse (CX - 5, CY, 40, 40); 
  //95, 100
  
 


 popMatrix();
 
  CX = CX + cloudMove;
 
   if (CX  >= width + 100)
  {
   CX = -620;
    
  }
  

 
}

