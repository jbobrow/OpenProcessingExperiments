

//coin variables

float coinY;
float coinX;
PImage yoshiCoin;

//color variables

float r=0;
float g=0;
float b=0;

//rainbow variables
float rainbowCenterX=250;
float rainbowCenterY=250;

float rainbowRad;

float rainbowLeft=3*PI/2;
float rainbowRight=3*PI/2;

//rainbow arc motion variables
float deltaL=.005;
float deltaR=.005;
float changeRate=320;

//star path variables
float starPathX=525;
float starPathY=250;
float starRad=262.5;
float a=PI/2;
float deltaA=.005;

//star size and position variables
float starPositionX=40;
float starPositionY=25;
float starSize=100;

//images and shapes variables
PImage mario1;
PImage mario2;
PImage mario3;
PImage capeMario1;
PImage capeMario2;
PImage capeMario3;
PShape star;

//mario size variable
float marioSize=65;

//for loop
int t=6;




void setup () {
  size(500, 500);
  mario1=loadImage("raccoonmario1.png");
  mario2=loadImage("raccoonmario2.png");
  mario3=loadImage("raccoonmario3.png");

  capeMario1=loadImage("capemario1.png");
  capeMario2=loadImage("capemario2.png");
  capeMario3=loadImage("capemario3.png");
  star=loadShape("onestar.svg");
  
  yoshiCoin=loadImage("yoshicoin.png");
  
  coinX=random(30,470);
  coinY=random(50,450);
  
  frameRate(20);
  smooth();
}


void draw () {

  background(126, 189, 255);
  smooth();

  float i;

  for (i=0; i<t; i=i+1) {

    rainbowRad=525-(20*i);
    if (i<(t/3) || i>(2*t/3)) {
      r=255;
    }
    else {
      r=80;
    }
    if (i>=t/6 && i<=t/2) {
      g=255;
    }
    else {
      g=80;
    }
    if (i>t/3) {
      b=255;
    }
    else {
      b=80;
    }

    smooth();
    stroke(r, g, b);
    noFill();
    strokeWeight(10);
    arc(rainbowCenterX, rainbowCenterY, rainbowRad, rainbowRad, rainbowRight, rainbowLeft);
    rainbowLeft=rainbowLeft+deltaL;
    rainbowRight=rainbowRight-deltaR;
    deltaL=(changeRate*deltaL/(changeRate+1));
    deltaR=(changeRate*deltaR/(changeRate+1));
  }

  //star path 
  starPathX=250+starRad*sin(a);
  starPathY=250+starRad*cos(a);
  a=constrain(a+deltaA, PI/2, 3*PI/2);
  if (a>=3*PI/2) {
    deltaA=deltaA*-1;
  } else if(a<=(PI/2)) {
    deltaA=abs(deltaA);
  }

  shape(star, starPathX-starPositionX, starPathY-starPositionY, starSize, starSize);



  //clouds
  noStroke();
  fill(255);
  ellipse(10, 275, 200, 100);
  ellipse(490, 275, 200, 100);

//mario animation
  if (mousePressed && (pmouseY-mouseY)>0) {
    image(capeMario1, mouseX-20, mouseY-20, marioSize, marioSize);
  }
  else if (mousePressed && (pmouseY-mouseY)>=-10) {
    image(capeMario2, mouseX-20, mouseY-20, marioSize, marioSize);
  }
  else if (mousePressed && (pmouseY-mouseY)<-10) {
    image (capeMario3, mouseX-20, mouseY-20, marioSize, marioSize);
  }
  else if (frameCount%3==0) {
    image(mario1, mouseX-20, mouseY-20, marioSize, marioSize);
  } 
  else if (frameCount%2==0) {
    image(mario2, mouseX-20, mouseY-20, marioSize, marioSize);
  }
  else if (frameCount%2!=0 && frameCount%3!=0) {
    image(mario3, mouseX-20, mouseY-20, marioSize, marioSize);
  }

//coin behavior

image(yoshiCoin, coinX, coinY, 35,50);
  if (mouseX>=(coinX-50) && mouseX<=(coinX+50) && mouseY>=(coinY-50) && mouseY<=(coinY+50)) {
    coinY=1000;
  }
  
} 

//resetting screen with key press

void keyPressed() {
      if (coinY==1000) {
      coinY=random(50,450);
      coinX=random(30,470);
    }
  }


