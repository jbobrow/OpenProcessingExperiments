

//basic elements
int life = 400, stickwidth = 150;
float m=255, m2 = 255;
float balldiameter = 20; 
float diameter = 0;
float xSpeed = 0, ySpeed = 0;
float x = 300, y = 300;

//life bar
String Life = "Score : ";
String score = "000";
float alpha = 0;

//raining balls
float y1Speed=random(2, 5), y2Speed=random(2, 5), y3Speed=random(2, 5), y4Speed=random(2, 5), y5Speed=random(2, 5);
float y1=0, y2=0, y3=0, y4=0, y5=0;
float x1=random(0, 120), x2=random(120, 240), x3=random(240, 400), x4=random(400, 500), x5=random(500, width);

float x1Speed=random(2, 5), x2Speed=random(2, 5), x3Speed=random(2, 5), x4Speed=random(2, 5), x5Speed=random(2, 5);

//input font & imgs
PFont font;
PImage start, imgbk, imgbk0, imgbk1, imgbk2, imgend;
PImage cursor01, cursor02;

//mon's words
float tSize = 25;
String mom =  "";
float tx1 = 30, tx2 = 200;
float ty1 = 200, ty2 = 550;

//EBR = Extra Ball Radius 
float EBR = 15;
float bx1=150, by1=200, bx2=400, by2=450, bx3=500, by3=550;
float bx1Speed = 5, by1Speed = -6;
float bx2Speed = -6, by2Speed = 7;
float bx3Speed = 7, by3Speed = -8;

//game over
String NGU = "NEVER GIVE UP";
String ctc = "click to continue";

void mousePressed() {
  if (xSpeed == 0 && score == "000") {
    xSpeed = -4;
    ySpeed = 5;
    start = imgbk;
  }
  if (diameter > 900) {
    diameter = 0;
    NGU = "";
    ctc= "";
    x = 300;
    y = 150;
  }
}

void setup() {
  size(600, 600);
  noStroke();
  noCursor();
  imgbk = loadImage("bk.jpg");
  imgbk0 = loadImage("bk0.jpg");
  imgbk1 = loadImage("bk1.jpg");
  imgbk2 = loadImage("bk2.jpg");
  imgend = loadImage("end.jpg");
  start = loadImage("start.jpg");
  font = loadFont("Pixel.vlw");
  cursor01 = loadImage("cursor01.png");
  cursor02 = loadImage("cursor02.png");
}

void draw() {
  background(start);

  //game over words
  if (life <= 400) {
    ctc = "click to continue";
    NGU = "NEVER GIVE UP";
  }

  //cursor
  image (cursor01, mouseX-5, mouseY-5);
  if (life<=380) {
    cursor01 = cursor02;
  }

  //life bar
  colorMode(RGB, 255);
  fill(255);
  textFont (font, 30);
  text(Life + score, 20, 40);
  fill(255, 0, 0, alpha);
  rect(120, 25, life, 10);

  //ball and stick
  colorMode(RGB, 255);
  fill(255, m);
  ellipse(x, y, balldiameter, balldiameter);
  colorMode(RGB, 255);
  fill(255);
  rect(mouseX-stickwidth/2, 500, stickwidth, 15);

  //mom's words
  textSize (tSize);
  text(mom, tx1, ty1, tx2, ty2);

  //change speed
  x = x + xSpeed;
  y = y + ySpeed;

  //how the ball bounds in the box
  if (x > width-balldiameter/2 || x < balldiameter/2) {
    xSpeed = -xSpeed;
  }
  if (y < balldiameter) {
    ySpeed = -ySpeed;
  }

  //how the ball bounds because of the stick
  if ((x <= mouseX + stickwidth/2 && x >= mouseX- stickwidth/2) && (y >= 495 && y <= 510)) { 
    ySpeed = -ySpeed;
    life = life - 10;
  }

  if (x == mouseX - stickwidth/2 && (y >= 495 && y <= 510)) {
    ySpeed = -ySpeed;
  }
  if (x == mouseX + stickwidth/2 && (y >= 495 && y <= 510)) {    
    ySpeed = -ySpeed;
  }

  //0 LIFE 400-381
  if (life >= 391 && life <=400) {
  }  
  if (life >= 381 && life <=390) {
    score = "010";
  }

  //1 LIFE 360-351 *change bk & colorful rain*
  if (life >= 351 && life <=380) {

    colorMode(HSB, 360, 100, 100);
    fill(90, 100, random(100));
    ellipse(x1, y1, 25, 25);
    fill(180, 100, random(100));
    ellipse(x2, y2, 25, 25);
    fill(270, 100, random(100));
    ellipse(x3, y3, 25, 25);
    fill(360, 100, random(100));
    ellipse(x4, y4, 25, 25);
    fill(0, 100, random(100));
    ellipse(x5, y5, 25, 25);
    x2=x2+x2Speed;
    x3=x3+x3Speed;
    x4=x4+x4Speed;
    x5=x5+x5Speed;
    y1=y1+y1Speed;
    y2=y2+y2Speed;
    y3=y3+y3Speed;
    y4=y4+y4Speed;
    y5=y5+y5Speed;

    start = imgbk0;
    Life = "life";
    score = "";
    alpha = 255;
    mom = "ERROR 404 - Cannot find anything named imgbk";
  }
  //2 LIFE 350-321 *change bk*
  if (life >= 341 && life <=350) {
    start = imgbk1;
    mom = "";
  }
  if (life >= 321 && life <=340) {
    start = imgbk1;
    tx1 = 250;
    ty1 = 100;
    tx2 = 300;
    ty2 = 250;
    mom = "Enjoy the game I recode for you?";
  }
  //3 LIFE 320-281 *smaller ball*
  if (life >= 291 && life <=320) {
    ySpeed = ySpeed * 1.001;
    mom = "Since when your interest became so narrow?";
    tx1 = 150;
    ty1 = 200;
    tx2 = 200;
    ty2 = 250;

    balldiameter = 10;
  }
  //4 LIFE 260-221 *shorter stick*
  if (life >= 251 && life <=290) {
    stickwidth = 90;
    mom = "so did your world";
  }
  //5 LIFE 220-181 *change bk*
  if (life >= 201 && life <=250) {
    start = imgbk2;
    tSize = random(10, 40);
    mom = "U know nothing";
    tx1 = random(width-30);
    ty1 = random(height-30);
    tx2 = random(width-30);
    ty2 = random(height-30);
  }
  //6 LIFE 160-141 *3 extra balls*
  if (life <=200) {
    tSize = 30;
    tx1 = 150;
    ty1 = 150;
    tx2 = 200;
    ty2 = 250;
    mom = "Do you know we're always around you";
    colorMode(RGB, 255);
    fill (255, m2);
    ellipse(bx1, by1, EBR, EBR);
    ellipse(bx2, by2, EBR, EBR);
    ellipse(bx3, by3, EBR, EBR);
    bx1 = bx1 + bx1Speed;
    by1 = by1 + by1Speed;
    bx2 = bx2 + bx2Speed;
    by2 = by2 + by2Speed;
    bx3 = bx3 + bx3Speed;
    by3 = by3 + by3Speed;
    if (bx1 > width - EBR || bx1 < EBR) {
      bx1Speed = -bx1Speed;
    }
    if (by1 < EBR || by1 > height - EBR) {
      by1Speed = -by1Speed;
    }  
    if (bx2 > width - EBR || bx2 < EBR) {
      bx2Speed = -bx2Speed;
    }
    if (by2 < EBR || by2 > height - EBR) {
      by2Speed = -by2Speed;
    }  
    if (bx3 > width - EBR || bx3 < EBR) {
      bx3Speed = -bx3Speed;
    }
    if (by3 < EBR || by3 > height - EBR) {
      by3Speed = -by3Speed;
    }
  }
  //7 LIFE 170-101
  if (life >= 121 && life <=160) {
    mom = "and worried about you";
  }
  //8 LIFE 100-61 *greatrer transparency*
  if (life >= 61 && life <=120) {
    tSize = 30;
    tx1 = 50;
    ty1 = 150;
    tx2 = 200;
    ty2 = 250;
    mom = "But you hide yourself and choose to ignore.";
    m = 150;
  }
  //9 LIFE 60-41 *all greatrer transparency*
  if (life >= 21 && life <=60) {
    mom = "even so, we are still with you";
    tSize = 35;
    tx1 = 100;
    ty1 = 100;
    tx2 = 500;
    ty2 = 500;

    m2 = 150;
  }
  //10 LIFE 20-0
  if (life >= 11 && life <=20) {
    mom = "BUT";
  }
  if (life >= 0 && life <=10) {
    mom = "NO TIME";
    tx1 = 200;
    ty1 = 200;
    tx2 = 350;
    ty2 = 500;
  }

  //gengeral GAME OVER
  if (y>height-balldiameter) {

    colorMode(RGB, 255);
    fill(255);
    ellipse(width/2, height/2, diameter, diameter);

    if (diameter <= width*1.5) {
      diameter = diameter + 10;
    }
    else {
      textSize(74);
      colorMode(RGB, 255);
      fill(255, 0, 0);
      text(NGU, 27, height/2-20);

      textSize(30);
      colorMode(RGB, 255);
      fill(255, 0, 0);
      text(ctc, 170, height/2+25);
    }
  }

  //avoid the life bar being longer after game over
  if (life < 0) {
    life = 0;
  }

  //final GAME OVER - GO TO STUDY!
  if (life <= 0) {
    colorMode(RGB, 255);
    fill(255);
    ellipse(width/2, height/2, diameter, diameter);

    if (diameter <= width*1.5) {
      diameter = diameter + 10;
    }
    else {
      image(imgend, 0, 0);
    }
  }
}


