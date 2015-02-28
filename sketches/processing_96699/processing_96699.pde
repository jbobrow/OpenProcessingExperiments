
//Alien Game v.1.0 by Aga Banach

Alien big;
Alien medium;
Alien small;

int numberOfStars = 60;
Star [] theStars = new Star[numberOfStars];

PImage background;
PFont f;
int score;
float rockSize = 100;
boolean fire = false;
int gameOver = 0;//Initialise gameOver variable 
int getRandomX() { //int startGame;
return int(random(950));// int score;
}
float [] rockx = {getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX(),  getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX()};
float [] rocky = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
PImage img;

import ddf.minim.* ;
Minim minim;

AudioPlayer aliens;
AudioPlayer laser;
AudioPlayer blast;

void setup() {
  size(1000, 600);
  f = createFont("Arial Bold",16,true);
  background = loadImage("background7.jpg");
  
  minim = new Minim(this);
  aliens = minim.loadFile("Aliens3.wav");
  aliens.play();
  
  img = loadImage("rock2.gif");
  smooth();
  noStroke();
  small = new Alien(120, 120, 70, 70, 5, 4);
  medium = new Alien(175, 175, 100, 100, 6, 3);
  big = new Alien(300, 300, 175, 175, 7, 2);
  
  int starColourR;
  int starColourG;
  int starColourB;
  int xLoc;
  int yLoc;
  int speed;
  
   for(int loop = 0; loop < theStars.length; loop++) {
     starColourR = (int) random(0, 250); 
     starColourG = (int) random(0, 100);
     starColourB = (int) random(0, 30);
     xLoc = (int) random(width);
     yLoc = (int) random(height);
     speed = (int) random(1, 8);
     
     theStars[loop] = new Star(color(starColourR, starColourG, starColourB), xLoc, yLoc, speed);
  }
}

void draw() {
  noStroke();
  background(175);
   
   image(background, 0, 0, 1000, 600);
  
  for(int loop = 0; loop < theStars.length; loop++) {
    theStars[loop].fall();
    theStars[loop].display();  
  }
 
  
  fill(100, 100, 100);
   small.drawBody(); // small alien
   small.drawHead();

   small.drawHand();
   small.drawHand2();
   small.drawHand3();
   small.drawHand4();
   small.draweye();
   small.drawMouth();
   small.drawBelly();
   small.drawFreckle();
   small.move();
   small.checkForBounce();
   
  fill(100, 100, 170);
   medium.drawBody(); // medium alien
   medium.drawHead();
   medium.move();
   medium.checkForBounce();
   medium.drawHand();
   medium.drawHand2();
   medium.drawHand3();
   medium.drawHand4();
   medium.draweye();
   medium.drawMouth();
   medium.drawBelly();
   medium.drawFreckle();
  
  
  fill(100, 100, 230);

  big.drawBody(); // big alien
  big.drawHead();
  big.move();
  big.checkForBounce();
  big.drawHand();
  big.drawHand2();
  big.drawHand3();
  big.drawHand4();
  big.draweye();
  big.drawMouth();
  big.drawBelly();
  big.drawFreckle();
 
    fill(255, 60, 0);
    triangle(mouseX-40, 600, mouseX+40, 600, mouseX, 550);
    fill(255, 90, 0);
    triangle(mouseX-20, 600, mouseX+20, 600, mouseX, 550);
    
    // display score
    fill(255, 175, 0);
    textAlign(RIGHT);
    textFont(f, 30);
    text("Your score:", 950, 40);
    text(score, 950, 80);
    if(fire){
     cannon(mouseX);
     fire = false;
     }
     rockFalling();
     gameFinish(); 
    }
    
  void mousePressed(){
    fire = true;
    minim = new Minim(this);
    laser = minim.loadFile("laser1.wav");
    laser.play();
    laser.rewind();
    
  }
   
  void rockFalling(){ 
   
    for (int i=0; i<10; i++){
     image(img, rockx[i], rocky[i]++, rockSize, rockSize);
    }
   }
  
   void cannon(int shotX){
    boolean strike = false;
    for (int i = 0; i < 10; i++){
      if((shotX >= (rockx[i]-rockSize/2)) && (shotX <= (rockx[i]+rockSize/2))) {
        strike = true;
       
        minim = new Minim(this);
        blast = minim.loadFile("blast1.wav");
        blast.play();
        blast.rewind();
        
        stroke(255, 220, 0);
        line(mouseX, 560, mouseX, rocky[i]);
        fill(255, 195, 0);
         stroke(175);
        ellipse(rockx[i], rocky[i], rockSize, rockSize);
        fill(255, 155, 0);
        ellipse(rockx[i], rocky[i], rockSize/2, rockSize/2);
        stroke(175);
        fill(255, 120, 0);
        ellipse(rockx[i], rocky[i], rockSize/4, rockSize/4);
        stroke(175);
        fill(255, 100, 0);
        ellipse(rockx[i], rocky[i], rockSize/6, rockSize/6);
        rockx[i] = getRandomX();
        rocky[i] = 0;
        score++;// update score
        }   
      }
      if(strike == false){
      line(mouseX, 565, mouseX, 0);
      } 
    }
   
  void gameFinish(){//GameOver
    for (int i=0; i< 10; i++){
      if(rocky[i]==600){
        fill(color(255, 150, 0));
        fill(255, 150, 0);
        textFont(f, 42);
        textAlign(CENTER);
        text("GAME OVER", width/2, height/2);
        text("Well done! Your score was : "+ score, width/2, height/2 + 50);
        noLoop();
        }
      }
    }
    
    class Alien {
  
  float bodyXLoc;
  float bodyYLoc;
  float bodyWidth;
  float bodyHeight;
  
  float headWidth;
  float headHeight;
  float headXLoc;
  float headYLoc;
  
  float handXLoc;
  float handYLoc;
  float handWidth;
  float handHeight;
  
  float hand2XLoc;
  float hand2YLoc;
  float hand2Width;
  float hand2Height;
  
  float hand3XLoc;
  float hand3YLoc;
  float hand3Width;
  float hand3Height;
  
  float hand4XLoc;
  float hand4YLoc;
  float hand4Width;
  float hand4Height;
  
  float eyeXLoc;
  float eyeYLoc;
  float eyeWidth;
  float eyeHeight;
  
  float freckleXLoc;
  float freckleYLoc;
  float freckleSize;
  
  float mouthXLoc;
  float mouthYLoc;
  float mouthZLoc;
  
  float mouthX1Loc;
  float mouthY1Loc;
  float mouthX2Loc;
  float mouthY2Loc;
  float mouthX3Loc;
  float mouthY3Loc;
  
  float bellyXLoc;
  float bellyYLoc;
  float bellyHeight;
  float bellyWidth;
  
  float speedX;
  float speedY;
  
  Alien(float x, float y, float alienWidth, float alienHeight, float sx, float sy) {
     bodyXLoc = x;
     bodyYLoc = y;
     bodyWidth = alienWidth;
     bodyHeight = alienHeight;
     speedX = sx;
     speedY = sy;
  }  
  void drawBody() {
    rectMode(CENTER);
    rect(bodyXLoc, bodyYLoc, bodyWidth, bodyHeight);       
  }

  void drawHead() {
    headWidth = bodyWidth;
    headHeight = headWidth ;
    headXLoc = bodyXLoc;
    headYLoc = bodyYLoc - (bodyHeight / 6) - (headHeight / 3) ;
    ellipseMode(CENTER);
    ellipse(headXLoc, headYLoc, headWidth, headHeight);  
  }  

 void drawHand() {
    handXLoc = bodyXLoc;
    handYLoc = bodyYLoc - (bodyHeight / 4)  ;
    handWidth = bodyWidth + (bodyWidth / 5);
    handHeight = bodyHeight / 2;
    ellipse( handXLoc,  handYLoc, handWidth, handHeight);
     
 }
 
  void drawHand2() {
    hand2XLoc = bodyXLoc;
    hand2YLoc = bodyYLoc ;
    hand2Width = bodyWidth + (bodyWidth / 4);
    hand2Height = bodyHeight / 2;
    ellipse( hand2XLoc,  hand2YLoc, hand2Width, hand2Height);
     
 }
 
  void drawHand3() {
    hand3XLoc = bodyXLoc;
    hand3YLoc = bodyYLoc + (bodyHeight / 4);
    hand3Width = bodyWidth + (bodyWidth / 3);
    hand3Height = bodyHeight /2;
    ellipse( hand3XLoc,  hand3YLoc, hand3Width, hand3Height);
       
  }

  void drawHand4() {
    hand4XLoc = bodyXLoc;
    hand4YLoc = bodyYLoc + (bodyHeight / 2 );
    hand4Width = bodyWidth + (bodyWidth / 2);
    hand4Height = bodyHeight /2;
    ellipse( hand4XLoc,  hand4YLoc, hand4Width, hand4Height);
       
  }
  
  void draweye() {
   eyeXLoc = bodyXLoc;
   eyeYLoc = headYLoc - (headHeight /4);
   eyeWidth = headWidth / 7;
   eyeHeight = eyeWidth;
   fill(255);
   ellipse(eyeXLoc, eyeYLoc,  eyeWidth,  eyeHeight); //eye white
   fill(0);
   ellipse(eyeXLoc - (float) random (1, 4), eyeYLoc , eyeWidth / 2 , eyeHeight / 2); //eye - black
  }
 
  void drawMouth(){
   mouthX1Loc = headXLoc - (headXLoc / 45);
   mouthY1Loc = headYLoc + (headWidth / 30);
   mouthX2Loc = headXLoc + (headXLoc / 25);
   mouthY2Loc = headYLoc + (headWidth / 20);
   mouthX3Loc = headXLoc - (headWidth / 10);
   mouthY3Loc = headYLoc + (headYLoc / 25);
   fill(175, 75, 55);
   triangle(mouthX1Loc, mouthY1Loc, mouthX2Loc, mouthY2Loc, mouthX3Loc, mouthY3Loc);
 }
 
 void drawFreckle(){
   fill(275, 265, 105);
   freckleSize = bodyWidth / 14;
   freckleXLoc = bodyXLoc + (float) random( - bodyWidth  / 6, bodyWidth / 7);
   freckleYLoc = bodyYLoc + (float) random( - bodyWidth / 7, bodyWidth / 6);
   ellipse(freckleXLoc, freckleYLoc,  freckleSize,  freckleSize); 
 }
 
 
  void drawBelly(){
   bellyXLoc = bodyXLoc;
   bellyYLoc = bodyYLoc;
   bellyHeight = bodyHeight / 2;
   bellyWidth = bodyWidth / 2;
   fill(125, 100, 130);
   ellipse(bellyXLoc, bellyYLoc, bellyHeight, bellyWidth);
  }
 
    void move() {
     bodyXLoc = bodyXLoc + speedX;
     bodyYLoc = bodyYLoc + speedY;
  }
  
  
  void checkForBounce() {
    if(bodyXLoc > width - (hand4Width / 2 )) {
       speedX = speedX * -1;
    } 
    if(bodyXLoc < 0 + (hand4Width / 2 )) {
       speedX = speedX * -1;  
    }
  
    if(bodyYLoc > height - ((bodyHeight/2) + (hand4Height/2))) {
       speedY = speedY * -1;
    } 
    if(bodyYLoc < 0 + ((bodyHeight/2) + (headHeight/2) )) {
       speedY = speedY * -1;
   
  }
  }
  
}//end class

class Star {
  
  color theColour;
  int xLoc;
  int yLoc;
  int speed;
  
  Star(color tempColor, int tempX, int tempY, int tempSpeed) {

    theColour = tempColor;
    xLoc = tempX;
    yLoc = tempY;
    speed = tempSpeed;  
  }
  
  void display() {
    int starHeight = 5;
    int starLength = 5;
  
    ellipseMode(CENTER);
    fill(theColour);
    ellipse(xLoc, yLoc, starLength, starHeight);
  }

  void fall() {
    yLoc = yLoc + speed;
    if (yLoc > width) {
      yLoc = 0;
    }
  }
  
}// end star
    
