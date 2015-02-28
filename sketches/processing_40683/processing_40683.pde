

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
  frameRate(20);
  smooth();
  
}


void draw () {

  background(126, 189, 255);
  smooth();
  
  float i;

  for (i=0; i<t; i=i+1) {
    
    rainbowRad=525-(20*i);
    if(i<(t/3) || i>(2*t/3)) {
      r=255;
    }
    else{
      r=80;
    }
      if (i>=t/6 && i<=t/2) {
      g=255;
      }
      else{
        g=80;
      }
    if(i>t/3) {
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
  
  shape(star,starPathX-starPositionX, starPathY-starPositionY, starSize,starSize);
  
  
  
  //
  noStroke();
  fill(255);
  ellipse(10,275,200,100);
  ellipse(490,275,200,100);
  
  
if (mousePressed && (pmouseY-mouseY)>0) {
  image(capeMario1, mouseX, mouseY, marioSize,marioSize);
}else if(mousePressed && (pmouseY-mouseY)>=-10) {
  image(capeMario2, mouseX, mouseY, marioSize,marioSize);
}else if (mousePressed && (pmouseY-mouseY)<-10) {
  image (capeMario3, mouseX, mouseY, marioSize,marioSize);
}else if (frameCount%3==0) {
   image(mario1, mouseX,mouseY, marioSize, marioSize);
 } else if (frameCount%2==0) {
   image(mario2,mouseX,mouseY,marioSize,marioSize);
 }
 else if (frameCount%2!=0 && frameCount%3!=0){
   image(mario3,mouseX,mouseY,marioSize,marioSize);
 }

} 
     
 


