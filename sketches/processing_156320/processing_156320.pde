
float starPosX;
float starPosY;
float starSize;

float cometPosX;
float cometPosY;
float cometSize;
float cometPosDX = 10;
float cometPosDY = 10;
int cometBlue;

float paddlePosX;
float paddlePosY;

color bgColor;
color cometColor;

int seedVal;

boolean sinTrue = true;


//float earthPosY; <earth will be bottom of frame
//float oldFrameCount;
//PImage earth;



void setup() {
  size (1000, 1000);
  
  bgColor = color(30,20,100,10);
  //oldFrameCount = frameCount;
  //earth = loadImage("earth.jpg");

}

void draw() {

  background(bgColor);

  //stars

  fill(255);
  noStroke();

  ellipseMode(CENTER);
  randomSeed(seedVal);
  starPosY = 10;
  
  //stars
  
  while (starPosY <= height) {
    
    starPosX = random(0, width);
    
    //pulses star by sin or cos, depending on boolean
    if (sinTrue) {
      starSize = random(0,5) + sin(frameCount * random(0,1));
      sinTrue = false;
    } else {
       starSize = random(0,5) + cos(frameCount * random(0,1));
    }

    //draw a star
    ellipse(starPosX, starPosY, starSize, starSize);
    
    //if mouseOver a star, change randomSeed value
    if ((dist(mouseX,mouseY,starPosX,starPosY))<=20){
      println("starred");
      seedVal++;
    }
    starPosY += 10;
  }
  

  
  //comet
  //cometBlue += 20 % 255;
  cometColor = color(30,40,200);
  cometSize = 75 + (sin(frameCount*0.01) * 30);
  
  //cometPosDX = sin(random(0,100)*0.0001);
  cometPosX = (cometPosX + cometPosDX) % (width + cometSize/2);
  cometPosY = (cometPosY + cometPosDY) % (width + cometSize/2);
  
  fill(cometColor);
  ellipse (cometPosX,cometPosY,cometSize,cometSize);
  
  /*rectangle to save earth
  noStroke();
  fill(0);
  paddlePosX = mouseX;
  paddlePosY = mouseY-10;
  rectMode(CENTER);
  rect(paddlePosX,paddlePosY-10,100,5);*/
  
  //earth
  
  //fill(bgR,bgG+55,bgB-55);
  //rectMode(CENTER);
  //earthPosY = height - mouseY*.2;
  //rect(width/2,earthPosY,width,400);
  
  
  //if (cometPosY >= earthPosY) {
    //'SPLODE!!
    //fade to black
    /*int crashTime = second();
    float fadeAlpha = 0;
    while (second() - crashTime < 10) {
        /*fill(0,fadeAlpha);
        rectMode(CENTER);
        rect(width/2,height/2,width,height);
        fadeAlpha += 0.1;
        println(second());
    }*/

    
    //load earth
    //imageMode(CENTER);
    /*for (int earthAlpha=0;earthAlpha<100;earthAlpha++){
      tint(255,earthAlpha);
      image(earth, width/2, height/2);
    }*/
  }
  
  





