
//declaration of variables
int backgroundColor   = 50;
int grassR;                   //grass
int grassG;
int grassB;
int grassPointY;              
int grassPoint2Y;
int tigerR;                   //head and chin
int tigerG;
int tigerB;
int headX;
int headY;
int headWidth;
int headHeight;
int chinX;
int chinY;
int chinDiameter;
int colorWhite;                //ears
int colorBlack;
int earX;
int ear2X;
int earY;
int earWidth;
int earHeight;
int patchX;                    //white patches around eyes
int patch2X;
int patchY;
int patchWidth;
int patchHeight;
int stripeX;                  //stripes
int stripeY;
int eyeLinerX;                //Black around the eyes
int eyeLiner2X;
int eyeLinerY;
int eyeLinerWidth;
int eyeLinerHeight;
int eyeCornerX;
int eyeCorner2X;
int eyeCornerY;
int noseR;                    //nose
int noseG;
int noseB;
int noseX;
int noseY;
int nose2Y;
int nostrilWidth;
int nostrilHeight;
int eyeR;                   //eye and pupils
int eyeG;
int eyeB;
int eyeX;
int eye2X;
int eyeY;
int eyeDiameter;
int pupilX;
int pupil2X;
int pupilY;
int pupilDiameter;
int mouthX;                   //mouth
int mouthY;
int tongueR;                  //tongue
int tongueG;
int tongueB;
int tongueX;
int tongueY;
int tongueWidth;
int tongueHeight;
int teethX;                   //teeth
int teeth2X;
int teethY;
int teethWidth;
int teethHeight;
int whiskersX;                //whiskers
int whiskers2X;
int whiskers3X;
int whiskers4X;
int whiskersRightX;
int whiskers2RightX;
int whiskers3RightX;
int whiskers4RightX;
int whiskersY;
int whiskers2Y;
int whiskers3Y;
int whiskers4Y;
int whiskersLeftEnd;
int whiskersRightEnd;
float beardX;                    //beard
float beardY;
int pawX;                        //paw
int pawY;
int pawWidth;
int pawHeight;
int clawX;
int clawY;
int clawWidth;
int clawHeight;

void setup() {
  size(200,200);
  background(backgroundColor);
  smooth(); 
  
  //initialization of variables
  
  grassPointY       = 200;    //grass
  grassR            = 137;
  grassG            = 211;
  grassB            = 68;
  tigerR            = 232;    //head and chin
  tigerG            = 135;
  tigerB            = 7;
  headX             = 130;
  headY             = 100;
  headWidth         = 110;
  headHeight        = 115;
  chinX             = 130;
  chinY             = 140;
  chinDiameter      = 60;
  colorWhite        = 255;    //ears
  colorBlack        = 0;
  earX              = 170;
  ear2X             = 90;
  earY              = 55;
  earWidth          = 25;
  earHeight         = 30;
  patchX            = 150;    //white patches around eyes
  patch2X           = 110;
  patchY            = 95;
  patchWidth        = 20;
  patchHeight       = 30;
  stripeX           = 130;    //stripes
  stripeY           = 80;
  eyeLinerX         = 110;    //Black around the eyes
  eyeLiner2X        = 150;
  eyeLinerY         = 100;
  eyeLinerWidth     = 10;
  eyeLinerHeight    = 7;
  eyeCornerX        = 114;
  eyeCorner2X       = 146;
  eyeCornerY        = 98;
  noseR             = 240;    //nose
  noseG             = 187;
  noseB             = 162;
  noseX             = 130;
  noseY             = 131;
  nose2Y            = 122;
  nostrilWidth      = 5;
  nostrilHeight     = 7;
  eyeR              = 187;    //pupils
  eyeG              = 222;
  eyeB              = 85;
  eyeX              = 110;
  eye2X             = 150;
  eyeY              = 100;
  eyeDiameter       = 6; 
  pupilX            = 110;
  pupil2X           = 150;
  pupilY            = 100;
  pupilDiameter     = 2;
  mouthX            = 120;    //mouth
  mouthY            = 150;
  tongueR           = 206;    //tongue
  tongueG           = 63;
  tongueB           = 15;
  tongueX           = 130;
  tongueY           = 150;
  tongueWidth       = 30;
  tongueHeight      = 3;
  teethX            = 120;    //teeth
  teeth2X           = 140;
  teethY            = 150;
  teethWidth        = 3;
  teethHeight       = 7;
  whiskersX         = 105;    //whiskers
  whiskers2X        = 110;
  whiskers3X        = 115;
  whiskers4X        = 120;
  whiskersRightX    = 140;
  whiskers2RightX   = 145;
  whiskers3RightX   = 150;
  whiskers4RightX   = 155;
  whiskersY         = 130;
  whiskers2Y        = 133;
  whiskers3Y        = 135;
  whiskers4Y        = 140;
  whiskersLeftEnd   = 80;
  whiskersRightEnd  = 180;
  pawX              = width/2; //paw
  pawY              = 180;
  pawWidth          = 45;
  pawHeight         = 25;
  clawX             = width/2;
  clawY             = 190;
  clawWidth         = 4;
  clawHeight        = 8;
} 


void draw () {
  
  //head and ears in background so beard can appear above it
  if (frameCount <= 12) {
    //ears
    fill(colorWhite);
    stroke(colorBlack);
    ellipse(earX,earY,earWidth,earHeight);
    ellipse(ear2X,earY,earWidth,earHeight);
    //head
    noStroke();
    fill(tigerR,tigerG,tigerB);
    ellipse(headX,headY,headWidth,headHeight);
    ellipse(chinX,chinY,chinDiameter,chinDiameter);
  } else {                          
    frameRate(20);
    stroke(colorWhite);
    beardX            = random(120,140); 
    beardY            = random(161,165);
    line(beardX,beardY,beardX,(beardY+10));
    beardX            = beardX + 1;
    beardY            = beardY + 1;
  }
  
  //white patches around eyes
  noStroke();
  fill(colorWhite);
  ellipse(patchX,patchY,patchWidth,patchHeight);
  ellipse(patch2X,patchY,patchWidth,patchHeight);
  
  //stripes
  fill(colorBlack);
  triangle(stripeX,stripeY,(stripeX-10),(stripeY+5),(stripeX-7),(stripeY+6));
  triangle(stripeX,stripeY,(stripeX+10),(stripeY+5),(stripeX+7),(stripeY+6));
  triangle(stripeX,(stripeY-10),(stripeX-20),(stripeY-5),(stripeX-17),(stripeY-3));
  triangle(stripeX,(stripeY-10),(stripeX+20),(stripeY-5),(stripeX+17),(stripeY-3));
  triangle(stripeX,(stripeY-20),(stripeX-30),(stripeY-10),(stripeX-27),(stripeY-6));
  triangle(stripeX,(stripeY-20),(stripeX+30),(stripeY-10),(stripeX+27),(stripeY-6));
  
  //black around the eyes
  fill(colorBlack);
  stroke(colorBlack);
  ellipse(eyeLinerX,eyeLinerY,eyeLinerWidth,eyeLinerHeight);
  ellipse(eyeLiner2X,eyeLinerY,eyeLinerWidth,eyeLinerHeight);
  triangle(eyeCornerX,eyeCornerY,(eyeCornerX+4),(eyeCornerY+6),(eyeCornerX-4),(eyeCornerY+6));
  triangle(eyeCorner2X,eyeCornerY,(eyeCorner2X-4),(eyeCornerY+6),(eyeCorner2X+4),(eyeCornerY+6));
  
  //eyes
  fill(eyeR,eyeG,eyeB);
  noStroke();
  ellipse(eyeX,eyeY,eyeDiameter,eyeDiameter);
  ellipse(eye2X,eyeY,eyeDiameter,eyeDiameter);
  fill(colorBlack);

  //the tiger blinks twice
  if (frameCount <= 20) {
    ellipse(pupilX,pupilY,pupilDiameter,pupilDiameter);
    ellipse(pupil2X,pupilY,pupilDiameter,pupilDiameter);
  } else if (frameCount <= 40) {
    pupilX = pupilX + 1;
    pupil2X = pupil2X + 1;
  } else if (frameCount <= 60) {
    pupilX = pupilX - 1;
    pupil2X = pupil2X - 1;
  } else if (frameCount <= 80) {
    ellipse(pupilX,pupilY,pupilDiameter,pupilDiameter);
    ellipse(pupil2X,pupilY,pupilDiameter,pupilDiameter);
  } else if (frameCount <= 100) {
    pupilX = pupilX + 1;
    pupil2X = pupil2X + 1;
  } else if (frameCount <= 120) {
    pupilX = pupilX - 1;
    pupil2X = pupil2X - 1;
  } else {
    ellipse(pupilX,pupilY,pupilDiameter,pupilDiameter);
    ellipse(pupil2X,pupilY,pupilDiameter,pupilDiameter);
  }
  
  //nose
  fill(noseR,noseG,noseB);
  rectMode(CENTER);
  rect(noseX,noseY,nostrilWidth,nostrilHeight);
  triangle(noseX,(noseY+1),(noseX-10),nose2Y,(noseX+10),nose2Y);
  
  //mouth
  fill(colorBlack);
  quad(mouthX,mouthY,(mouthX-10),(mouthY+5),(mouthX-5),(mouthY+15),(mouthX+5),(mouthY+10));
  quad(mouthX,mouthY,mouthX,(mouthY+11),(mouthX+16),(mouthY+11),(mouthX+20),mouthY);
  quad((mouthX+20),mouthY,(mouthX+15),(mouthY+11),(mouthX+25),(mouthY+15),(mouthX+30),(mouthY+5));
  
  //tongue
  fill(tongueR,tongueG,tongueB);
  ellipse(tongueX,tongueY,tongueWidth,tongueHeight);
  triangle(tongueX,(tongueY-10),(tongueX+10),tongueY,(tongueX-10),tongueY);
  stroke(colorBlack);
  line(tongueX,(tongueY-10),tongueX,(tongueY-15));
  
  //teeth
  fill(colorWhite);
  noStroke();
  ellipse(teethX,teethY,teethWidth,teethHeight);
  ellipse(teeth2X,teethY,teethWidth,teethHeight);
  
  //whiskers
  strokeCap(ROUND);
  stroke(colorBlack);
  
  point((whiskersX+1),whiskers2Y);
  point((whiskers2X+1),whiskersY);
  point((whiskers3X+1),whiskers4Y);
  point((whiskers4X+1),whiskers3Y);
  
  point((whiskersRightX-1),whiskers3Y);
  point((whiskers2RightX-1),whiskers4Y);
  point((whiskers3RightX-1),whiskersY);
  point((whiskers4RightX-1),whiskers2Y);
  
  stroke(colorWhite);
  line(whiskersX,whiskers2Y,(whiskersLeftEnd-5),(whiskers2Y+7));
  line(whiskers2X,whiskersY,whiskersLeftEnd,(whiskersY+5));
  line(whiskers3X,whiskers4Y,whiskersLeftEnd,(whiskers4Y+12));
  line(whiskers4X,whiskers3Y,whiskersLeftEnd,(whiskers3Y+10));
  
  line(whiskersRightX,whiskers3Y,whiskersRightEnd,(whiskers3Y+10));
  line(whiskers2RightX,whiskers4Y,whiskersRightEnd,(whiskers4Y+12));
  line(whiskers3RightX,whiskersY,whiskersRightEnd,(whiskersY+5));
  line(whiskers4RightX,whiskers2Y,(whiskersRightEnd+5),(whiskers2Y+7));
  
  //paw
  if (mouseX >= width/2) {
  noStroke();
  fill(tigerR,tigerG,tigerB);
  ellipse(pawX,pawY,pawWidth,pawHeight);
  fill(colorWhite);
  ellipse(clawX,clawY,clawWidth,clawHeight);
  ellipse(clawX-10,clawY,clawWidth,clawHeight);
  ellipse(clawX+10,clawY,clawWidth,clawHeight);
  }
 
  // grass
  grassPoint2Y      = int(random(1,125));
  
  stroke(grassR,grassG,grassB);
  strokeCap(ROUND);
  line(mouseX,grassPointY,mouseX,grassPoint2Y);
}



