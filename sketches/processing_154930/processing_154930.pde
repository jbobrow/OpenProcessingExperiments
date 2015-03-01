
int time;
Spike[] spikesL;
Spike[] spikesR;
Player player;


float g = 0.1;
int maxSpikeAge = 6000;
int spikesPerPlatform = 10;
float leftPlatformLeftEdge = 50;
float leftPlatformRightEdge = 150;
float rightPlatformLeftEdge = 200;
float rightPlatformRightEdge = 350;


void setup() {
  size(400, 600);
  background(0);
  time = 0;
  spikesL = new Spike[spikesPerPlatform];
  spikesR = new Spike[spikesPerPlatform];
  for (int i=0; i<spikesPerPlatform; i++) {
    spikesL[i] = new Spike(leftPlatformLeftEdge+i*(leftPlatformRightEdge - leftPlatformLeftEdge)/spikesPerPlatform, 0);
    spikesR[i] = new Spike(rightPlatformLeftEdge+i*(rightPlatformRightEdge - rightPlatformLeftEdge)/spikesPerPlatform, 0);
  }
  player = new Player((leftPlatformRightEdge + leftPlatformLeftEdge)/2);
}


void draw() {
  background(0);
  player.agePlayer();
  player.drawPlayer();
  int points = 0;
  for (int i=0; i<spikesPerPlatform; i++) {
    Spike spikeL = spikesL[i];
    spikeL.ageSpike();
    spikeL.drawSpike();
    points += (abs(spikeL.x1 - player.positionVector.x)<10 && spikeL.y1 > player.positionVector.y)? 1 : 0;
    
    Spike spikeR = spikesR[i];
    spikeR.ageSpike();
    spikeR.drawSpike();
    points += (abs(spikeR.x1 - player.positionVector.x)<10 && spikeR.y1 > player.positionVector.y)? 1 : 0;
    
  }
  if(player.isJumping())
    creditPoints(points);
  time++;
 showScore(); 
 drawplatforms();
}
int totalPoints = 0;
void creditPoints(int amt){
totalPoints += amt; 
}
void showScore(){
  fill(255);
  text("Score: "+totalPoints, leftPlatformRightEdge+5, 25);
}
void drawplatforms() {
  fill(25);
  stroke(100);
  rect(leftPlatformLeftEdge, height-100, (leftPlatformRightEdge-leftPlatformLeftEdge), 100);
  rect(rightPlatformLeftEdge, height-100, (rightPlatformRightEdge-rightPlatformLeftEdge), 100);
}
void mouseClicked() {
  player.setJump(mouseX, mouseY);
}

class Player {
  PVector positionVector;
  boolean jumping;
  int age = 0;
  float playerVelocity;
  PVector gravity;
  PVector jumpVector;

  Player(float startX) {
    positionVector = new PVector(startX, height-110);
    gravity = new PVector(0, g);
    jumpVector = new PVector(0, 0);
    playerVelocity = 1;
  }

  void drawPlayer() {
    fill(100, 100, 30);
    rect(positionVector.x-5, positionVector.y-2, 10, height-positionVector.y);
    fill(100, 255, 30);
    stroke(255);
    ellipse(positionVector.x, positionVector.y, 10, 10);
    
  }
  void agePlayer() {
    if (jumping)
      jump();
    age++;
    if (positionVector.y>height-100) {
      jumping = false;
      positionVector.y = height-110;
      if((positionVector.x < leftPlatformLeftEdge || positionVector.x >= rightPlatformRightEdge) ||
        (positionVector.x > leftPlatformRightEdge && positionVector.x < rightPlatformLeftEdge)){
        positionVector.x = (leftPlatformRightEdge + leftPlatformLeftEdge)/2;
        fill(200, 100, 100);
        rect(0,0,width,height);
        totalPoints = 0;
      }
    }
  }
  void jump() {
    jumpVector.add(gravity);
    positionVector.add(jumpVector);
  }

  void setJump(float xmouse, float ymouse) {
    float vertexX = xmouse - positionVector.x;
    float vertexY = abs(positionVector.y - ymouse);
    if (jumping)
      return;
    //float theta = atan(2*vertexY/vertexX);
    //float velocity = sqrt(2*g*vertexY)/sin(theta);
    float velocity = sqrt(2*g*vertexY)*sqrt(4*vertexY*vertexY+vertexX*vertexX)/(2*vertexY);
    jumpVector = new PVector(sqrt(2*g*vertexY)*(vertexX/(2*vertexY)), -sqrt(2*g*vertexY));
    jumping = true;
  }
  
  boolean isJumping(){
   return jumping; 
  }
}


class Spike {
  float x0, y0;
  float x1, y1;
  boolean falling;
  int age;
  float spikeStep;

  Spike(float startX, float startY) {
    x0 = startX;
    y0 = startY;
    x1 = x0;
    y1 = y0;
    falling = false;
    age = 0;
    spikeStep = 0;//random(5);
  }
  void drawSpike() {
    fill(100, 30, 255);
    stroke(0, 0, 0);
    rect(x1, y1, 10, 10);
  }
  void ageSpike() {
    if (falling)
      moveSpikeDown();
    age++;
    if (y1>height) {
      y1 = y0;
      falling = false;
      age = 0;
      spikeStep = 0;
    }
    if (age > random(maxSpikeAge)+200)
      falling = true;
  }
  void moveSpikeDown() {
    spikeStep += g;
    y1 += spikeStep;
  }
}

