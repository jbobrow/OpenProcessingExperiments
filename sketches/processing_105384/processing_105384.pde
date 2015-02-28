
float bSize = 30;
float r = bSize/2;
float startPosY = 20;
float endPosY = 500-(bSize/2);
float ballPosX,ballPosY;
float vY =.1;
float gravity = .98;
float weight = .02;
float vX;
float friction = .7;
color bgColor;

void setup(){
  //frameRate(5);
  bgColor = color(0);
  size(500,500);
  vX = random(40);
  vY = random(-15,60);
  ballPosY = height/2;
  ballPosX = width/2;
}

void draw(){
  background(bgColor);
  
// Up/Down Motion
  if((ballPosY < endPosY) && (vY > 0)){
    vY += gravity; //going down!
  } else if((ballPosY > endPosY) && (vY > 0)) {
    vY = -vY; //flip to up
    bgColor = color(random(255),random(255),random(255));
  } else if((vY < 0)) {
    vY += gravity; // going up
    vY = vY*(1-weight);
  } else if((ballPosY <= r) && (vY <= 0)) {
    vY = -vY; // flip to down
  }
  
// Left/Right Motion
  if((ballPosX >= width-r) && (vX > 0)) {
    vX = -vX;
    vX = vX*(friction);
    bgColor = color(random(255),random(255),random(255));
  } else if ((ballPosX <= r) && (vX < 0)) {
    vX = -vX;
    vX = vX*(friction);
    bgColor = color(random(255),random(255),random(255));
  }
  
  if(mousePressed) {
    vX+=random(40);
    vY+=random(-15,0);
  }
    
  ballPosY += vY;
  ballPosX += vX;
  fill(0);
  ellipse(ballPosX,ballPosY,bSize,bSize);
}


