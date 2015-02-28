
//bricks
int b1x=152, b2x=152, b3x=172, b4x=239, b5x=239, b6x=290, b7x=290, b8x=310, b9x=310, b10x=378, b11x=378, b12x=398, b13x=398, b14x=398;
int b1y=187, b2y=237, b3y=267, b4y=187, b5y=237, b6y=187, b7y=237, b8y=187, b9y=217, b10y=187, b11y=237, b12y=187, b13y=217, b14y=267;
int b1w=20, b2w=20, b3w=50, b4w=20, b5w=20, b6w=20, b7w=20, b8w=50, b9w=50, b10w=20, b11w=20, b12w=50, b13w=50, b14w=50;
int b1h=50, b2h=50, b3h=20, b4h=50, b5h=50, b6h=50, b7h=50, b8h=20, b9h=20, b10h=50, b11h=50, b12h=20, b13h=20, b14h=20;

// BGM & soundeffect
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/110498*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import ddf.minim.*;
Minim minim;
AudioPlayer BGM;
AudioSample bound;

//basic elements
int life = 410, stickwidth = 150;
float m=255, m2 = 255;
float balldiameter = 20; 
float diameter = 0;
float xSpeed = 0, ySpeed = 0;
float x = 300, y = 340;
float scorealpha = 255;

//life bar
String Life = "Score : ";
int score = 0;
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
boolean end = false;

void mousePressed() {
  if (xSpeed == 0 && score == 0) {
    xSpeed = -4;
    ySpeed = 5;
    start = imgbk;
  }
  if (diameter > 900 && end!= true) {
    diameter = 0;
    NGU = "";
    ctc= "";
    x = 300;
    y = 150;
  }
}

void setup() {
  size(600, 600);
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

  //music
  minim = new Minim(this);
  BGM = minim.loadFile("smb-underground1.mp3");
  BGM.loop();

  minim = new Minim(this);
  bound = minim.loadSample("bound.mp3");
}

void draw() {
  background(start);
  //game over words
  if (life <= 410) {
    ctc = "click to continue";
    NGU = "NEVER GIVE UP";
  }

  //cursor
  image (cursor01, mouseX-5, mouseY-5);
  if (life<=380) {
    cursor01 = cursor02;
  }

  //life bar
  noStroke();
  colorMode(RGB, 255);
  fill(255);
  textFont (font, 30);
  text(Life, 20, 40);
  fill(255, scorealpha);
  text(score, 140, 40);
  fill(255, 0, 0, alpha);
  rect(120, 25, life, 10, 7);

  //ball and stick
  noStroke();
  colorMode(RGB, 255);
  fill(255, m);
  ellipse(x, y, balldiameter, balldiameter);
  colorMode(RGB, 255);
  fill(255);
  rect(mouseX-stickwidth/2, 500, stickwidth, 15, 7);

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

  //ball bounds the stick
  if ((x <= mouseX + stickwidth/2 && x >= mouseX- stickwidth/2) && (y >= 495 && y <= 510)) { 
    ySpeed = -ySpeed;
    life = life - 10;
    bound.trigger();
  }
  if (x == mouseX - stickwidth/2 && (y >= 495 && y <= 510)) {
    ySpeed = -ySpeed;
  }
  if (x == mouseX + stickwidth/2 && (y >= 495 && y <= 510)) {    
    ySpeed = -ySpeed;
  }

  //0 LIFE 400-381
  if (life >= 391 && life <=400) 
  {
  }

  if (life >= 381 && life <=390) {
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
    scorealpha = 0;
    score = 0;
    alpha = 255;
    mom = "ERROR 404 - Cannot find anything named imgbk";
  }
  //2 LIFE 350-321 *change bk*
  if (life >= 341 && life <=350) {
    start = imgbk1;
    b1w=0; 
    b2w=0;
    b3w=0;
    b4w=0;
    b5w=0;
    b6w=0;
    b7w=0;
    b8w=0;
    b9w=0; 
    b10w=0;
    b11w=0; 
    b12w=0; 
    b13w=0;
    b14w=0;
    b1h=0; 
    b2h=0;
    b3h=0;
    b4h=0;
    b5h=0;
    b6h=0;
    b7h=0;
    b8h=0; 
    b9h=0;
    b10h=0; 
    b11h=0;
    b12h=0;
    b13h=0;
    b14h=0;

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
    b1w=0; 
    b2w=0;
    b3w=0;
    b4w=0;
    b5w=0;
    b6w=0;
    b7w=0;
    b8w=0;
    b9w=0; 
    b10w=0;
    b11w=0; 
    b12w=0; 
    b13w=0;
    b14w=0;
    b1h=0; 
    b2h=0;
    b3h=0;
    b4h=0;
    b5h=0;
    b6h=0;
    b7h=0;
    b8h=0; 
    b9h=0;
    b10h=0; 
    b11h=0;
    b12h=0;
    b13h=0;
    b14h=0;

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
      end = true;
      BGM.close();
    }
  }

  //hit bricks
  strokeWeight(5);
  stroke(255);
  fill(253, 147, 0);
  rect(b1x, b1y, b1w, b1h, 7);
  rect(b2x, b2y, b2w, b2h, 7);
  rect(b3x, b3y, b3w, b3h, 7);
  rect(b4x, b4y, b4w, b4h, 7);
  rect(b5x, b5y, b5w, b5h, 7);
  rect(b6x, b6y, b6w, b6h, 7);  
  rect(b7x, b7y, b7w, b7h, 7);  
  rect(b8x, b8y, b8w, b8h, 7);  
  rect(b9x, b9y, b9w, b9h, 7);  
  rect(b10x, b10y, b10w, b10h, 7);  
  rect(b11x, b11y, b11w, b11h, 7);  
  rect(b12x, b12y, b12w, b12h, 7);  
  rect(b13x, b13y, b13w, b13h, 7);  
  rect(b14x, b14y, b14w, b14h, 7);

  if ( (x> b1x && x<(b1x+b1w)) && ((y> b1y && y<(b1x+b1h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b1w = 0;
    b1h = 0;    
    bound.trigger();
  }
  if ( (x> b2x && x<(b2x+b2w)) && ((y> b2y && y<(b2x+b2h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b2w = 0;
    b2h = 0;    
    bound.trigger();
  }
  if ( (x> b3x && x<(b3x+b3w)) && ((y> b3y && y<(b3x+b3h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b3w = 0;
    b3h = 0;    
    bound.trigger();
  }
  if ( (x> b4x && x<(b4x+b4w)) && ((y> b4y && y<(b4x+b4h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b4w = 0;
    b4h = 0;    
    bound.trigger();
  }
  if ( (x> b5x && x<(b5x+b5w)) && ((y> b5y && y<(b5x+b5h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b5w = 0;
    b5h = 0;    
    bound.trigger();
  }
  if ( (x> b6x && x<(b6x+b6w)) && ((y> b6y && y<(b6x+b6h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b6w = 0;
    b6h = 0;    
    bound.trigger();
  }
  if ( (x> b7x && x<(b7x+b7w)) && ((y> b7y && y<(b7x+b7h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b7w = 0;
    b7h = 0;    
    bound.trigger();
  }
  if ( (x> b8x && x<(b8x+b8w)) && ((y> b8y && y<(b8x+b8h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b8w = 0;
    b8h = 0;    
    bound.trigger();
  }
  if ( (x> b9x && x<(b9x+b9w)) && ((y> b9y && y<(b9x+b9h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b9w = 0;
    b9h = 0;    
    bound.trigger();
  }
  if ( (x> b10x && x<(b10x+b10w)) && ((y> b10y && y<(b10x+b10h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b10w = 0;
    b10h = 0;    
    bound.trigger();
  }
  if ( (x> b11x && x<(b11x+b11w)) && ((y> b11y && y<(b11x+b11h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b11w = 0;
    b11h = 0;    
    bound.trigger();
  }
  if ( (x> b12x && x<(b12x+b12w)) && ((y> b12y && y<(b12x+b12h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b12w = 0;
    b12h = 0;    
    bound.trigger();
  }
  if ( (x> b13x && x<(b13x+b13w)) && ((y> b13y && y<(b13x+b13h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b13w = 0;
    b13h = 0;
    bound.trigger();
  }
  if ( (x> b14x && x<(b14x+b14w)) && ((y> b14y && y<(b14x+b14h)))) {
    xSpeed = -xSpeed;
    ySpeed = -ySpeed;
    score = score+10;
    b14w = 0;
    b14h = 0;
    bound.trigger();
  }
}


