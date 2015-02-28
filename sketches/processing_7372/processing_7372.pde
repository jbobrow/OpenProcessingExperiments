

////################ Script text ##############
PFont script;
////################ Blue Pillow ##############
PImage pillow;
PImage pillowflip;
PImage pillow2;
PImage pillowflip2;

////################ Scarf Pattern ##############

PImage STL;
PImage STR;
PImage SML;
PImage SMR;
PImage SMmL;
PImage SMmR;
PImage SBL;
PImage SBR;
PImage SBbL;
PImage SBbR;

////################ Stem pattern ##############
PImage small;


void setup(){
  size(640,480);
  noLoop();
 ////################ Script text ##############
  script = loadFont("Parchment-Regular-255.vlw");
  textFont(script);
  smooth();

////################ Scarf Pattern ##############

  STL = loadImage("STL.png");
  STR= loadImage("STR.png");
  SML= loadImage("SML.png");
  SMR= loadImage("SMR.png");
  SMmL= loadImage("SMmL.png");
  SMmR= loadImage("SMmR.png");
  SBL= loadImage("SBL.png");
  SBR= loadImage("SBR.png");
  SBbL= loadImage("SBbL.png");
  SBbR= loadImage("SBbR.png");

////################ Stem pattern ##############

  small = loadImage("small.png");

////################ Blue Pillow ##############

  pillow= loadImage("pillow.png");
  pillowflip= loadImage("pillow_flip.png");
  pillow2= loadImage("pillow2.png");
  pillowflip2= loadImage("pillow_flip2.png");


}


void draw(){  
  background(255);
  //frameRate(5);


  ////###########################################################
  ////################ BLUE PILLOWS ##############
  ////###########################################################

  //PILLOW Random
  float Pr = random(0.0,360);
  float Ps = random(0.5,1.2);

  //TOP LEFT BLUE
  pushMatrix();
  translate(320,140);
  rotate(radians(Pr));
  scale(Ps);
  image(pillow,-130,-109);
  popMatrix();  
  //Middle LEFT BLUE
  pushMatrix();
  translate(320,243);
  rotate(radians(Pr-90));
  scale(Ps+0.3);
  image(pillow,-130,-128);
  popMatrix();  
  //Bottom LEFT BLUE
  pushMatrix();
  translate(320,320);
  rotate(radians(Pr-180)); 
  scale(Ps-0.2);
  image(pillowflip,-130,-73);
  popMatrix();

  ////////////////////////////////
  //TOP RIGHT BLUE
  pushMatrix();
  translate(320,140);
  rotate(radians(360-Pr));  
  scale(Ps);
  image(pillow2,0,-109);
  popMatrix();  
  //Middle RIGHT  BLUE
  pushMatrix();
  translate(320,243);
  rotate(radians(360-(Pr-90)));
  scale(Ps+0.3);
  image(pillow2,0,-128);
  popMatrix();  
  //Bottom RIGHT  BLUE
  pushMatrix();
  translate(320,320);
  rotate(radians(360-(Pr-180))); 
  scale(Ps-0.2);
  image(pillowflip2,0,-73);
  popMatrix();



  ////###########################################################
  ////################ MINI STEMS ########################
  ////################ 1st Bunch STEM : Left ##############
  ////###########################################################

  ///////////////////////////
  ////////////STEMS
  float smallR = random(0.0,40);
  /////////////////SMALL/////////////////////
  pushMatrix();
  translate(220,380);
  rotate(radians(310));
  //////////////////FIRST STEM LEFT
  pushMatrix();
  translate(0,0);
  rotate(radians(330-(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////2
  pushMatrix();
  translate(0,-50);
  rotate(radians(310-(smallR+20)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////3
  pushMatrix();
  translate(0,-110);
  rotate(radians(300-(smallR+15)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  //2nd STEM
  /////// 1
  pushMatrix();
  translate(0,0);
  rotate(radians(280-(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

  //////////////////3
  pushMatrix();
  translate(-84,-20);
  rotate(radians(240-(smallR+13)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  



  /////////////// STEM3
  /////// 1
  pushMatrix();
  translate(0,0);
  rotate(radians(100-(smallR+20)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

  /////////////// STEM4


  /////// 1
  pushMatrix();
  translate(0,0);
  rotate(radians(45-(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

////###########################################################
  ////################ 1st Bunch STEM : RIGHT ##############
  ////###########################################################

  //////////////////FIRST STEM RIGHT
  pushMatrix();
  translate(0,0);
  rotate(radians(0+(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  pushMatrix();
  translate(0,-50);
  rotate(radians(0+(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  pushMatrix();
  translate(0,-110);
  rotate(radians(10+(smallR+20)));  
  // scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  //// SECOND STEM
  ////////////////// 2
  pushMatrix();
  translate(-60,-15);
  rotate(radians(280+(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  ////////////////  
  //////////////////4
  pushMatrix();
  translate(-107,-20);
  rotate(radians(270+(smallR+13)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //STEM 3
  ////////////////// 2
  pushMatrix();
  translate(12,34);
  rotate(radians(135+(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

  //////////  STEM 4
  /////////////2
  pushMatrix();
  translate(50,-30);
  rotate(radians(45+(smallR+6)));  
  //scale(Ps);
  tint(255,160);
  image(small,0,-83);
  popMatrix();  
  ////////////
  ///////////////////
  popMatrix();    

 ////###########################################################
  ////################ 2nd BUNCH STEM : LEFT ##############
  ////###########################################################

  ////////////STEMS
  //float smallR = random(0.0,40);
  /////////////////SMALL/////////////////////
  pushMatrix();
  translate(440,380);
  rotate(radians(90));
  //////////////////FIRST STEM LEFT
  pushMatrix();
  translate(0,0);
  rotate(radians(330-(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////2
  pushMatrix();
  translate(0,-50);
  rotate(radians(310-(smallR+20)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////3
  pushMatrix();
  translate(0,-110);
  rotate(radians(300-(smallR+15)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  //2nd STEM
  /////// 1
  pushMatrix();
  translate(0,0);
  rotate(radians(280-(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

  //////////////////3
  pushMatrix();
  translate(-84,-20);
  rotate(radians(240-(smallR+13)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  



  /////////////// STEM3
  /////// 1
  pushMatrix();
  translate(0,0);
  rotate(radians(100-(smallR+20)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

  /////////////// STEM4


  /////// 1
  pushMatrix();
  translate(0,0);
  rotate(radians(45-(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  


  ////###########################################################
  ////################ 2nd Bunch STEM : RIGHT ##############
  ////###########################################################
  //////////////////FIRST STEM RIGHT
  pushMatrix();
  translate(0,0);
  rotate(radians(0+(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  pushMatrix();
  translate(0,-50);
  rotate(radians(0+(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  pushMatrix();
  translate(0,-110);
  rotate(radians(10+(smallR+20)));  
  // scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //////////////////
  //// SECOND STEM
  ////////////////// 2
  pushMatrix();
  translate(-60,-15);
  rotate(radians(280+(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  ////////////////  
  //////////////////4
  pushMatrix();
  translate(-107,-20);
  rotate(radians(270+(smallR+13)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  //STEM 3
  ////////////////// 2
  pushMatrix();
  translate(12,34);
  rotate(radians(135+(smallR+10)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  

  //////////  STEM 4
  /////////////2
  pushMatrix();
  translate(50,-30);
  rotate(radians(45+(smallR+6)));  
  //scale(Ps);
  image(small,0,-83);
  popMatrix();  
  ////////////
  ///////////////////

  popMatrix();    

  noTint();
  ////###########################################################
  ////################ SCARF ##############
  ////###########################################################
  
  ////////SCARF Random
  float Sd = random(0.0,100);
  int d = round(Sd);
  //float Ss = random(0.5,1.2);

  //TOP LEFT SCARF
  //pushMatrix();


  blend(STL,0,0,STL.width,STL.height,155+d,-100,STR.width,STL.height, DIFFERENCE);

  blend(SML,0,0,SML.width,STR.height,134+d,30,SML.width,SML.height, DIFFERENCE);

  blend(SMmL,0,0,SMmL.width,SMmL.height,248+d,102,SMmL.width,SMmL.height, DIFFERENCE);

  blend(SBL,0,0,SBL.width,SBL.height,66+d,196,SBL.width,SBL.height, DIFFERENCE);

  blend(SBbL,0,0,SBbL.width,SBbL.height,120+d,310,SBbL.width,SBbL.height, DIFFERENCE);




  blend(STR,0,0,STR.width,STR.height,292-d,-100,STR.width,STR.height, DIFFERENCE);

  blend(SMR,0,0,SMR.width,SMR.height,364-d,30,SMR.width,SMR.height, DIFFERENCE);

  blend(SMmR,0,0,SMmR.width,SMmR.height,300-d,102,SMmR.width,SMmR.height, DIFFERENCE);

  blend(SBR,0,0,SBR.width,SBR.height,366-d,196,SBR.width,SBR.height, DIFFERENCE);

  blend(SBbR,0,0,SBbR.width,SBbR.height,338-d,310,SBbR.width,SBbR.height, DIFFERENCE);



  ////###########################################################
  ////################ Script Text ##############
  ////###########################################################
  float scriptR = random(-20,45);
  //tint(0,
  pushMatrix();
  translate(320,0);
  scale(1.2,1.2);
  textSize(250);
  fill(0);
  rotate(radians(scriptR));
  text ("L",-165,130);
  noFill();
  popMatrix();

  pushMatrix();
  translate(320,0);
  scale(-1.2,1.2);
  textSize(250);
  fill(0);
  rotate(radians(scriptR));
  text ("L",-165,130);
  noFill();
  popMatrix();
  //###############################################///
  //###############################################///
  // float scriptR = random(-20,45);

  pushMatrix();
  translate(100,20);
  rotate(radians(90));
  tint(255,0,0);
  pushMatrix();
  translate(320,0);
  scale(1,1);
  textSize(250);
  fill(0);
  rotate(radians(scriptR-10));
  text ("L",-110,130);
  noFill();
  popMatrix();

  pushMatrix();
  translate(320,0);
  scale(-1,1);
  textSize(250);
  fill(0);
  rotate(radians(scriptR-10));
  text ("L",-110,130);
  noFill();
  popMatrix();
  noTint();
  popMatrix();

  println(scriptR);
  //###############################################///
  //###############################################///
  // float scriptR = random(-20,45);

  pushMatrix();
  translate(540,660);
  rotate(radians(-90));
  //scale(1,-1);

  pushMatrix();
  translate(320,0);
  scale(1,1);
  textSize(250);
  fill(0);
  //rotate(radians(40));
  rotate(radians(scriptR-10));
  text ("L",-110,130);
  noFill();
  popMatrix();

  pushMatrix();
  translate(320,0);
  scale(-1,1);
  textSize(250);
  fill(0);
  //rotate(radians(40));
  rotate(radians(scriptR-10));
  text ("L",-110,130);
  noFill();
  popMatrix();

  popMatrix();

  //###############################################///
  //###############################################///

}



void mousePressed() {
  redraw();
}



