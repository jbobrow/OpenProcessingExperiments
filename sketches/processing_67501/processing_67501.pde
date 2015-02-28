
PFont myFont;
//mouse arrays - xPos, yPos, xVel, 
PImage [] mice = new PImage [30];
float [] miceXPos = new float [30];
float [] miceYPos = new float [30];
float [] miceVel = new float [30];

//rat arrays
PImage [] rats = new PImage [30];
float [] ratsXPos = new float [30];
float [] ratsYPos = new float [30];
float [] ratsVel = new float [30];

//kitten arrays
PImage [] kittens = new PImage [10];
float [] kittensXPos = new float [10];
float [] kittensYPos = new float [10];
float [] kittensVel = new float [10];

float counter;
//life
boolean [] life = new boolean [30]; 

PImage cat; 
PImage miceImage;
PImage ratsImage;
PImage splat;
PImage kittensImage;
PImage start;
PImage intro1;
PImage intro2;
PImage intro3;

//variables that will change
int cPosX;
int totalScore; 
int Score;
boolean leftPressed;
boolean rightPressed;

boolean mdown = false;
//int gameStart; //0= pre game 1= in game 2=game over

//variables hat will not change
int cPosY; //cat at bottom of the screen only on y axis
int catSpeed;

void setup() {
  size(500, 500);
  frameRate(30);
  smooth();
  myFont = loadFont ("SnellRoundhand-Bold-30.vlw");
  totalScore = 0;

  cat = loadImage("tempcat.gif");
  ratsImage = loadImage("rat.png");
  miceImage = loadImage("mouse2.png");
  splat = loadImage("splat2.png");
  kittensImage = loadImage("kitten.png");
  intro1 = loadImage("meow1.jpg");
  intro2 = loadImage("meow2.jpg");
  intro3 = loadImage("meow3.jpg");
  // image(cat, 250, height); 
  //start = loadImage(
  
   
  cPosY= height;
  cPosX = width/2;
  catSpeed = 10;

  leftPressed = false;
  rightPressed = false;



  for (int i=0; i<30; i++) {
    miceXPos[i] = 30*(i-1);
    miceYPos[i] = random(0, height-100);
    miceVel[i] = random(1, 2.5);
    mice[i] = miceImage;
  }

  for (int i=0; i<30; i++) {
    ratsXPos[i] = 10*(i-1);
    ratsYPos[i] = random(0, height-100);
    ratsVel[i] = random(1, 2.5);
    rats[i] = ratsImage;
  }
  for (int i=0; i<10; i++) {
    kittensXPos[i] = 10*(i-1);  
    kittensYPos[i] = random(0, height-100);
    kittensVel[i] = random(1, 2.5);
    kittens[i] = kittensImage;
  }
}

void draw() {
  background(255);
  image(cat, cPosX, height-50);
//counter++;
//if (counter <= 30){
// loadImage("meow1.jpg");
//}
//
//else if (counter <=60){
//loadImage("meow2.jpg");
//}
//
//else if (counter <=90){
//  loadImage("meow3.jpg");
//}
// else {
 
  if (leftPressed == true) {
    if (cPosX >0 && cPosX < width) {
      cPosX -= catSpeed;
    }
  }

  if (rightPressed == true) {
    if (cPosX >= 0 && cPosX < width-50) {
      cPosX += catSpeed;
    }
  }

  if (mdown) {
    fill(250, 0, 0);
    ellipse(100, 100, 100, 100);
  }

  for (int i =0; i<30; i++) {
    if (miceXPos[i] >= cPosX-25 && miceXPos [i] <= cPosX+25) {
    }
  }

  for (int i =0; i<30; i++) {
    image(mice[i], miceXPos[i], miceYPos[i]);
    if (mice[i] != splat) {
      miceVel[i] = miceVel[i] + random(-.4, 0.4);
      miceXPos[i] = miceXPos[i] + miceVel [i];
    }
  }
  for (int i =0; i<30; i++) {
    image(rats[i], ratsXPos[i], ratsYPos[i]);
    if (rats[i] != splat) {
      ratsVel[i] = ratsVel[i] + random(-0.7, 0.7); //updating speed
      ratsXPos [i] = ratsXPos [i] + ratsVel[i];
      //using your current speed to update position //find out how and why things are moving.
    }
  }

  for (int i =0; i<10; i++) {
    image(kittens[i], kittensXPos[i], kittensYPos[i]);
    if (kittens[i] != splat) {
      kittensVel[i] = kittensVel[i] + random(-0.7, 0.7); //updating speed
      kittensXPos [i] = kittensXPos [i] + kittensVel[i];
      //using your current speed to update position //find out how and why things are moving.
    }
  }

  for (int i=0; i<30; i++) {
    if (ratsXPos [i] >= width+25 || ratsXPos [i] <= -50) {
      ratsVel[i] = ratsVel[i]*(-1);
    }
  }
  for (int i=0; i<30; i++) {
    if (miceXPos [i] >= width+25 || miceXPos [i] <= -50) {
      miceVel[i] = miceVel[i]*(-1);
      // println(miceVel[i]);
    }
  }
  for (int i=0; i<10; i++) {
    if (kittensXPos [i] >= width+25 || kittensXPos [i] <= -50) {
      kittensVel[i] = kittensVel[i]*(-1);
    }
  }

  for (int i=0; i<10; i++) {
    if (kittensYPos [i] >= width+25 || kittensYPos [i] <= -50) {
      kittensVel[i] = kittensVel[i]*(-1);
    }
  }

  text(totalScore, 400, 450);
  fill(255,0,0);
  text("score:", 360, 450);

  scoreCounter();
  println("totalScore is: " + totalScore);
  
  if(millis()<3000){
  image(intro1,0,0);
  }
  if(millis() >= 3000 && millis() <= 4000){
    image(intro2,0,0);
  }
  if(millis() >= 4000 && millis() <= 5000){
    image(intro3,0,0);
  }
//if (millis() >= 30000){
//  text("GAME OVER", 300,300);
//}

 }



void mousePressed() {
  lazerBeam();
} 

void lazerBeam() {
  //draw lazer beam
  pushStyle();
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(cPosX+25, height/2-45, 5, height);
  popStyle();  

  //check if rats/mice xpos are within a close proximity to the cats xpos
  //for number of rodents
  //if they are close to cat
  for (int i =0; i<30; i++) {
    if (ratsXPos[i] >= cPosX-25 && ratsXPos [i] <= cPosX+25) {
      rats[i] = splat;
      ratsVel[i] = 0;
    }
  }
  for (int i =0; i<30; i++) {
    if (miceXPos[i] >= cPosX-25 && miceXPos [i] <= cPosX+25) {
      mice[i] = splat;
      miceVel[i] = 0;
    }
  }



  for (int i =0; i<10; i++) {
    if (kittensXPos[i] >= cPosX-25 && miceXPos [i] <= cPosX+25) {
      kittens[i] = splat;
      kittensVel[i] = 0;
    }
  }
}

void scoreCounter() {
  int totalMice = 0;
  int totalRats = 0;
  int totalKittens = 0;
  for (int i =0; i<30; i++) {
    if (mice[i] == splat) {
      totalMice += 5;
    }
    if (rats[i] == splat) {
      totalRats += 10;
    }
  }
  for (int i=0; i<10; i++){
    if (kittens[i] == splat) {
      totalKittens -= 15;
    }
  }
  totalScore = totalMice + totalRats + totalKittens;
}

void mouseReleased() {
  mdown = false;
}

//
//void update(){
//  for(int i =0; i<10; i++){
//  image(mice[i], miceXPos[i], miceYPos[i]);
//  miceVel[i] = miceVel[i] + random(-0.4, 0.4);
// }


void keyPressed() {

  if (keyCode == LEFT) {
    println("thyu46gy");
    leftPressed = true;
  }
  println(leftPressed);

  if (keyCode == RIGHT) {
    rightPressed = true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  println(leftPressed);

  if (keyCode == RIGHT) {
    rightPressed = false;
  }
}


