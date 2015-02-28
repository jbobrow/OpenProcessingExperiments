
//moving with arrowed or WASD

//use the A and D keys to move forward and backward, spacebar to jump

//initialize variables

//an array to store mario's x position
float marioXpos []= new float [20];

//mario location variables

float marioXlocation=0;
float marioYbase=415;
float marioYpos=marioYbase;
float marioXspeed=0;
float marioYspeed=0;
float gravity=0;
float marioAcc=.1;

//mario size and direction variables

int marioSize=50;
int facing;

//coin variables
float coinX=(random(35,1465));
float coinY=(random(25,400));

//background image

PImage cloudmap;
float cloudmapX=0;

//mario images 

PImage mario1;
PImage mario2;
PImage mario3;
PImage leftmario1;
PImage leftmario2;
PImage leftmario3;

//yoshi coin image

PImage yoshiCoin;


//setup loop

void setup () {

  //basic setup

    size(1500, 500);
  smooth();
  frameRate(30);

  //load images 

  mario1=loadImage("raccoonmario1.png");
  mario2=loadImage("raccoonmario2.png");
  mario3=loadImage("raccoonmario3.png");

  leftmario1=loadImage("raccoonmario1left.png");
  leftmario2=loadImage("raccoonmario2left.png");
  leftmario3=loadImage("raccoonmario3left.png");

  yoshiCoin=loadImage("yoshicoin.png");
  
  cloudmap=loadImage("cloudmap.png");

  //initialize array of xposition storage

    for (int i=0; i<marioXpos.length; i++) {
    marioXpos[i]=0;
  }
}

void draw () {

  //background scrolling

  image(cloudmap,cloudmapX,0,2000,500);
  cloudmapX=cloudmapX-marioXspeed;
  if (cloudmapX<-500) {
    cloudmapX=0;
  } 
  if (cloudmapX>0) {
    cloudmapX=-300;
  }
  //before we do anything else, shift xposition storage over by

  for (int i=0; i<marioXpos.length-1; i++) {
    marioXpos[i]=marioXpos[i+1];
  } 
  
  //then store mario's current location as the most recent item in the array
  marioXpos[marioXpos.length-1]=marioXlocation;


  //control how mario is displayed depending on his direction

    switch (facing) {

  case 1:  
    if (frameCount%3==0) {
      image(mario1, marioXpos[1], marioYpos, marioSize, marioSize);
    } 
    else if (frameCount%2==0) {
      image(mario2, marioXpos[1], marioYpos, marioSize, marioSize);
    }
    else if (frameCount%2!=0 && frameCount%3!=0) {
      image(mario3, marioXpos[1], marioYpos, marioSize, marioSize);
    }
    break;

  case 0: 
    if (frameCount%3==0) {
      image(leftmario1, marioXpos[1], marioYpos, marioSize, marioSize);
    } 
    else if (frameCount%2==0) {
      image(leftmario2, marioXpos[1], marioYpos, marioSize, marioSize);
    }
    else if (frameCount%2!=0 && frameCount%3!=0) {
      image(leftmario3, marioXpos[1], marioYpos, marioSize, marioSize);
    }
    break;
  }

  //mario motion

  constrain(marioXspeed, 0, 1);
  marioXlocation=marioXlocation+marioXspeed;
  marioYpos=marioYpos+marioYspeed;
  marioYspeed=marioYspeed+gravity;

//collision detection

  if (marioYpos>=marioYbase) {
    marioYpos=marioYbase;
    marioYspeed=0;
    gravity=0;
  }

//setting facing switch depending on speed and direction (aka velocity lol)
  if (marioXspeed>=0) {
    facing=1;
  } 
  else {
    facing=0;
  }
  
//yoshicoin stuff!
 
 image(yoshiCoin, coinX, coinY, 35,50);
  if(marioXpos[1]>=(coinX-50) && marioXpos[1]<=(coinX+50) && marioYpos >= (coinY-50) && marioYpos <= (coinY+50)) {
  coinY=1000;
  coinX=(random(35,1465));
}
if (coinY==1000) {
   coinY=(random(25,400));
}
coinX=coinX-marioXspeed;
}

//bye bye draw loop
//use keyPressed and keyReleased to control mario's speed

void keyPressed() {
  if (key=='a') {
    marioXspeed=marioXspeed-marioAcc;
  } 
  else if (key=='d') {
    marioXspeed=marioXspeed+marioAcc;
  }
  if (keyCode==32) {
    marioYspeed=-6;
    gravity=.2;
  }
}

void keyReleased() {
  if (key=='a' && marioXspeed<-.1) {
    marioXspeed=0;
  } 
  else if (key=='d' && marioXspeed>.1) {
    marioXspeed=0;
  }
}


