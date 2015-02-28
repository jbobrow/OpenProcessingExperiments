
PImage back, middle, front, psy, bike, homer_1, homer_2, homer_3, homer_4, homer_5, homer_6, homer_7, homer_8, homer_9, homer_10;
PVector vback, vmiddle, vfront;
int counter;
PImage[] homer;
boolean leftPressed;
boolean rightPressed;
boolean upPressed;
boolean downPressed;
boolean flipped;
boolean speedVolume;
boolean qPressed;
boolean wPressed;
int frontSpeed;
int middleSpeed;
int backSpeed;
int xMovement;
int yMovement;
boolean screenMovement;
int volumeCounter;
boolean backwards;



import ddf.minim.*;
AudioPlayer song;
Minim minim;


void setup() {
  minim = new Minim(this);
  song = minim.loadFile("gangnam.mp3", 2048);
  homer = new PImage[10];
  back = loadImage("back.png");
  middle = loadImage("middle.png");
  front = loadImage("front.png");
  psy = loadImage("psy.png");
  bike = loadImage("bike.png");
  leftPressed = false;
  qPressed=false;
  rightPressed = false;
  upPressed = false;
  downPressed = false;
  speedVolume=false;
  flipped = false;
  backwards=true;
  wPressed=false;
  frontSpeed = 0;
  middleSpeed = 0;
  backSpeed = 0;
  xMovement = 0;
  yMovement = 0;
  screenMovement=false;
  volumeCounter=0;


  homer[0] = loadImage("homer_1.png");
  homer[1] = loadImage("homer_2.png");
  homer[2] = loadImage("homer_3.png");
  homer[3] = loadImage("homer_4.png");
  homer[4] = loadImage("homer_5.png");
  homer[5] = loadImage("homer_6.png");
  homer[6] = loadImage("homer_7.png");
  homer[7] = loadImage("homer_8.png");
  homer[8] = loadImage("homer_9.png");
  homer[9] = loadImage("homer_10.png");
  counter =1;


  size(800, 850);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); //just fixing the position of the image
  song.loop();

  frameRate(20);
}

void paraDraw(PImage img, PVector pos, float vel) {
  pos.sub(vel, 0, 0);

  int r = (int)pos.x+img.width;

  if (r < width) image(img, r, pos.y);
  if (pos.x < width) image(img, pos.x-img.width, pos.y);  
  if (pos.x < -img.width) pos.x = width;
  //println("r: " + r + ", pos.x: " +pos.x);
  imageMode(CORNER);
  image(img, pos.x, pos.y);
  //fill(#ff0000);
  //rect(pos.x, 0, img.width, img.height);
}

void draw() {
  background(255);
  imageMode(CORNER);
  //  paraDraw(back, vback, 1);
  //  paraDraw(middle, vmiddle, 2);
  //  paraDraw(front, vfront, 3);

  paraDraw(back, vback, backSpeed);
  paraDraw(middle, vmiddle, middleSpeed);
  paraDraw(front, vfront, frontSpeed);
  //  image(psy,width/2-100,height-500);
  //  image(bike,width/2-400,height-400);
    imageMode(CENTER);

  if (!flipped) {
    if (counter>0 && counter <3) image(homer[0], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>2 && counter <5) image(homer[1], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>4 && counter <7) image(homer[2], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>6 && counter <9) image(homer[3], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>8 && counter <11) image(homer[4], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>10 && counter <13) image(homer[5], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>12 && counter <15) image(homer[6], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>14 && counter <17) image(homer[7], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>16 && counter <19) image(homer[8], (width/2)+xMovement, (height-230)+yMovement);
    if (counter>18 && counter <22) image(homer[9], (width/2)+xMovement, (height-230)+yMovement);
  }

  if (flipped) {
    pushMatrix();
    scale(-1, 1);
    if (counter>0 && counter <3) image(homer[0], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>2 && counter <5) image(homer[1], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>4 && counter <7) image(homer[2], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>6 && counter <9) image(homer[3], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>8 && counter <11) image(homer[4], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>10 && counter <13) image(homer[5], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>12 && counter <15) image(homer[6], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>14 && counter <17) image(homer[7], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>16 && counter <19) image(homer[8], -1*(width/2)-xMovement, (height-230)+yMovement);
    if (counter>18 && counter <22) image(homer[9], -1*(width/2)-xMovement, (height-230)+yMovement);
    popMatrix();
  }

  if (counter>20) {
    counter=1;
  }
  if (counter<2 && leftPressed) {
    counter=17;
  }
  if (leftPressed) {
    counter--;
    if(qPressed){
      counter-=4;
    } 
    if(wPressed){
      counter-=8;
    }
    
    xMovement-=7;
  }
  if (rightPressed) {
    counter++;
    if(qPressed){
      counter+=6;
    }
    if(wPressed){
      counter+=10;
    }
    xMovement+=7;
  }
  if (upPressed) {
    yMovement-=4;
  }
  if (downPressed) {
    yMovement+=4;
  }

  if (xMovement>300) {
    screenMovement=true;
    xMovement=300;
  }
  if (xMovement<-300) {
    screenMovement=true;
    xMovement=-300;
  }
  if (xMovement>-300 && xMovement<300) {
    screenMovement=false;
  }
  if (yMovement<-44) {
    yMovement=-44;
  }
  if (yMovement>80) {
    yMovement=80;
  }
  println(counter);
  
//  if(speedVolume){
//    volumeCounter++;
//    song.play();
//  }
//  else if(!speedVolume) {
//    volumeCounter=0;
//    song.pause();
//  }
//  if(volumeCounter==0){
//    song.setGain(-50);
//  }
//  if (volumeCounter>0 && volumeCounter<20){
//      song.setGain(-30);
//  }
//  else if (volumeCounter>19 && volumeCounter<40){
//      song.setGain(-20);
//  }
//  else if (volumeCounter>39 && volumeCounter>60 ){
//      song.setGain(-10);
//  }
//  else if (volumeCounter>59){
//      song.setGain(0);
//  }
}


void keyPressed() {
  if (keyCode == LEFT) {
    leftPressed=true;
    if (screenMovement) {
      frontSpeed=-6;
      middleSpeed=-4;
      backSpeed=-2;
    }
    flipped=true;
    speedVolume=true;
  }
  if (keyCode == RIGHT) {
    rightPressed=true;
    if (screenMovement) {
      frontSpeed=6;
      middleSpeed=4;
      backSpeed=2;
    }
    flipped=false;
    speedVolume=true;
  }

  if (keyCode == UP) {
    upPressed=true;
  }
  if (keyCode == DOWN) {
    downPressed=true;
  }
  if (keyCode == 'S') {
    flipped=!flipped;
  }
  if (keyCode == 'Q') {
    qPressed=true;
  }
  if (keyCode == 'W') {
    wPressed=true;
  }
}

void keyReleased() {
  if (keyCode == LEFT) {
    leftPressed=false;
    screenMovement=false;
    frontSpeed=0;
    middleSpeed=0;
    backSpeed=0;
    speedVolume=false;
  }
  if (keyCode == RIGHT) {
    rightPressed=false;
    screenMovement=false;
    frontSpeed=0;
    middleSpeed=0;
    backSpeed=0;
    speedVolume=false;
  }
  if (keyCode == UP) {
    upPressed=false;
  }
  if (keyCode == DOWN) {
    downPressed=false;
  }
  if (keyCode == 'S') {
    flipped=!flipped;
  }
  if (keyCode == 'Q') {
    qPressed=false;
  }
  if (keyCode == 'W') {
    wPressed=false;
  }
}

/* 
Trees learned from:
Recursive Trees" by Nat Sarkissian, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 6641  

Clouds learned from: 
"Cloud Generator" by CgRobot, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 67665  

Parallax learned from: 
Simple Parallax" by Rodrigo Amaya, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID= 46976  
*/



