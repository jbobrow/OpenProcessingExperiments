
float eyesX = 180;
float eyesY = 200;
float eyeSpeed = .32;
int xGoal;
float x = 180;
int h, m, s;
float fallone = 1;
float falltwo=1;
float fallthree = 1;
float fallfour=1;
float fallfive = 1;
float fallsix = 1;
float fallseven = 1;
float falleight= 1;
float fallnine=1;
float fallten=1;
float falleleven =1;
float falltwelve=1;

PImage skyone, skytwo, skythree, skyfour, skyfive, skysix, skyseven, skyeight, skynine, skyten, skyeleven, skytwelve ;
PImage grass;

void setup() {
  size (390, 400);
  background(255);
  noStroke();
  smooth();
  rectMode(CENTER);
  skyone = loadImage("skyone.png");
  skytwo = loadImage("skytwo.png");
  skythree = loadImage("skythree.png");
  skyfour = loadImage("skyfour.png");
  skyfive = loadImage("skyfive.png");
  skysix = loadImage("skysix.png");
  skyseven = loadImage("skyseven.png");
  skyeight = loadImage("skyeight.png");
  skynine = loadImage("skynine.png");
  skyten = loadImage("skyten.png");
  skyeleven = loadImage("skyeleven.png");
  skytwelve = loadImage("skytwelve.png");
  grass = loadImage("grass.png");
}

void draw() {
  background(0, 0, 0);
  sky();
  fill(127, 183, 24);
  rect(200, 320, 400, 200);//grass area
  wings();
  fill(0, 0, 0, 70);
  ellipse(180, 320, 70, 20);
  chicken();
  timeEyes();
  image(grass, 100, 265, 100, 80);//grassblades 
  image(grass, 0, 250, 200, 150);//grassblades 
  image(grass, 200, 250, 200, 150);//grassblades 
}


void sky() {
  h = hour()%12;
  m=minute();
  float posy1=0;
  float posy2=0;
  float posy3=0;
  float posy4=0;
  float posy5=0;
  float posy6=0;
  float posy7=0;
  float posy8=0;
  float posy9=0;
  float posy10=0;
  float posy11=0;
  float posy12=0;//these tell the change in y position of the sky pieces

  image (skytwelve, 0, posy12+falltwelve);
  image (skyeleven, 0, posy11+falleleven);
  image (skyten, 0, posy10+fallten);
  image (skynine, 0, posy9+fallnine);
  image (skyeight, 0, posy8+falleight);
  image (skyseven, 0, posy7+fallseven);
  image (skysix, 0, posy6+fallsix);
  image (skyfive, 0, posy5+fallfive);
  image (skyfour, 0, posy4+fallfour);
  image (skythree, 0, posy3+fallthree);
  image(skytwo, 0, posy2+falltwo);
  image (skyone, 0, posy1+fallone);//loads sky pieces with their position
  
  if (h >= 1) {
    //fallone =1;
    fallone = fallone *1.03;
  }
  if (h >= 2) {
    falltwo = falltwo* 1.02;
  }
  if (h >= 3) {
    fallthree = fallthree* 1.03;
  }
  if (h >= 4) {
    fallfour = fallfour*1.039;
  }
  if (h>= 5) {
    fallfive = fallfive* 1.04;
  }
  if (h>= 6) {
    fallsix = fallsix * 1.042;
  }
  if (h>=7) {
    fallseven= fallseven * 1.031;
  }
  if (h>=8) {
    falleight = falleight* 1.02;
  }
  if (h>=9) {
    fallnine = fallnine*1.025;
  }
  if (h>=10) {
    fallten = fallten*1.034;
  }
  if (h>=11) {
    falleleven = falleleven +1.17;
  }
  if (h>=12) {
    falltwelve = falltwelve + 1.66;
  }
}

void chicken() {
  ellipseMode(CENTER);
  fill(211, 60, 0);
  rect(200, 280, 5, 100); //left leg
  rect(220, 280, 5, 100);//right leg
  arc(190, 330, 25, 10, PI, TWO_PI);//left foot
  arc(229, 330, 25, 10, PI, TWO_PI);//right foot
  fill(242, 162, 12);
  ellipse(210, 260, 80, 80);//body
  fill (250, 200, 61);
  ellipse(210, 200, 80, 100);//head
  fill(211, 60, 0);
  triangle(195, 200, 225, 200, 210, 240);//beak
  fill(255);
  ellipse(190, 200, 40, 50);//left eye
  ellipse(230, 200, 40, 50);//right eye
  stroke (252, 248, 168);


  noStroke();
}

void timeEyes() {
  ellipseMode(CENTER);

  int s = second();
  int rightCoord = 200;
  int leftCoord = 180;

  if (s%2 ==0) {
    xGoal = rightCoord;
  }
  if (s%2 ==1) {
    xGoal = leftCoord;
  }
  if (x< xGoal) {
    x++;
  }
  if ( x> xGoal) {
    x--;
  }
  constrain(x, leftCoord, rightCoord);
  fill(0);
  ellipse(x, eyesY, 10, 40);
  ellipse(x+40, eyesY, 10, 40);
}

void wings() {
  int m = minute();
   //makes left wing extend
  if ( m <=29) {
    int m2 = minute();
    pushMatrix();
    ellipseMode(CORNER);
    translate(240, 230);
    rotate(-HALF_PI+(PI/30)*m2);
    fill(252, 248, 168);
    arc(0, -25, 70, 50, 0, PI);
    popMatrix();
  }else{
    int m2 = 30;
     pushMatrix();
    ellipseMode(CORNER);
    translate(240, 230);
    rotate(-HALF_PI+(PI/30)*m2);
    fill(252, 248, 168);
    arc(0, -25, 70, 50, 0, PI);
    popMatrix();
  }
  //makes right wing extend
  if (m >=30) {
    int m3 = minute();
    pushMatrix();
    ellipseMode(CORNER);
    translate(180, 230);
    rotate(1.5*PI+(PI/30)*m);
    fill(252, 248, 168);
    arc(0, -25, 70, 50, PI, TWO_PI);
    popMatrix();
  }else{
    int m3 = 30;
    pushMatrix();
    ellipseMode(CORNER);
    translate(180, 230);
    rotate(1.5*PI+(PI/30)*m3);
    fill(252, 248, 168);
    arc(0, -25, 70, 50, PI, TWO_PI);
    popMatrix();
  }
}


