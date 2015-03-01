
float starPosX;
float starPosY;
float starSize;
float cometPosX;
float cometPosY;
float cometSize;
float earthPosY;

float oldFrameCount;


float bgR = 0;
float bgG = 0;
float bgB = 0;


void setup() {
  size (1000, 1000);
  oldFrameCount = frameCount;

}

void draw() {

  bgR = map(mouseY, 0, 1000, 0, 100);
  bgG = map(mouseY, 0, 1000, 0, 100);
  bgB = map(mouseY, 0, 1000, 0, 170);

  background(bgR, bgG, bgB);

  //stars

  fill(255);
  noStroke();

  randomSeed(1000);

  starPosY = 10;
  
  while (starPosY <= height) {
    starPosX = random(0, width);
    starSize = 3 + sin(frameCount * 0.1);

    ellipse(starPosX, starPosY-mouseY, starSize, starSize);
    
    
    starPosY += 10;
  }
  
  //comet
  cometSize = 175 + sin(frameCount);
  //cometPosX = (cometPosX + 10) % (width + cometSize/2);
  cometPosY = (cometPosY + 10) % (width + cometSize/2);
  cometPosX = mouseX % width;
  

  ellipse (cometPosX,cometPosY,cometSize,cometSize);
  
  
  //earth
  
  fill(bgR,bgG+55,bgB-55);
  rectMode(CENTER);
  earthPosY = (height+400) - mouseY*.5;
  rect(width/2,earthPosY,width,400);
  
  
}



