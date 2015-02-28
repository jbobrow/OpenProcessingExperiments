
/**************************************************
* Bouncy Ball Demo
* @author Travis Carlson
* @version 6/26/2013
************************************************/ 

// Media and library Objects
//Accelerometer meter;
//Maxim maxim;
//AudioPlayer audio;
PImage imgBall;

// Game constants
int speedGame = 200;
float g = -9.8;

// Speed thresholds
int maxSpeed = 5*speedGame;
int minSpeed = -maxSpeed;
int clickSpeed = speedGame *6;

// Ball constants
int ballSize;
float minPosX;
float maxPosX;
float minPosY;
float maxPosY; 
float friction = .99;
float frictionBounce = .72;

// Ball position
float posX = 0;
float speedX = 0;

// Ball speed
float posY = 0;
float speedY = 0;

// Ball deformity
float ballScaleX = 1;
float ballScaleY = 1;
float deformX = 0;
float deformY = 0;
float phaseBounceX = 0;
float phaseBounceY = 0;
float maxDeform = .3;

// Ball rotation
float speedRotate = .02;
float angle = 0;

float meterX = 0;
float meterY = 0;

void setup() {
      size(500, 500);
//  orientation(PORTRAIT);
 
  loadMedia();
  initBall();
 
  frameRate(100);
  imageMode(CENTER);
}

private void initBall(){
  posX = width/2;
  posY = height/2;
  ballSize = int(min(width, height)/7.0);
  minPosX = ballSize/2;
  maxPosX = width -ballSize/2;
  minPosY = ballSize/2;
  maxPosY = height -ballSize/2;  
}

private void loadMedia(){
  imgBall = loadImage("soccer.png");
  //meter = new Accelerometer();
 // maxim = new Maxim(this);

  //audio = maxim.loadFile("boing.wav");
  //audio.setLooping(false);
}

void draw() {
    updatePos();
    updateEffects();
    
    // draw background
    //clear();
    background(0, 125, 0);
    
    pushMatrix();
    translate(posX, posY);
    scale(ballScaleX, ballScaleY);
    rotate(angle);
    image(imgBall, 0, 0, ballSize, ballSize);
    popMatrix();
}

void updatePos(){
    float accelX = getAccel(-meterX);
    float accelY = getAccel(-meterY);

    speedX += accelX / frameRate;
    speedY += accelY / frameRate;
   
    speedX = speedX * friction;
    speedY = speedY * friction;
    
    float stepX = speedX / frameRate;
    float stepY = speedY / frameRate;
    
    posX += stepX;
    posY += stepY;  
}

float getAccel(float tilt){
     return speedGame*g*sin(map(tilt, -10, 10, -PI/2, PI/2));
}

void updateEffects(){
  
    // Horizontal collision
    if(posX < minPosX || posX > maxPosX){
      
      // Enforce bounds
      if(posX < minPosX){
        posX = minPosX;
      } else if (posX > maxPosX){
        posX = maxPosX;
      }
      
      deformX = -map(abs(speedX), 0, maxSpeed, 0, maxDeform);
      phaseBounceX = 0;
      speedX = -speedX * frictionBounce;
      collisionRotation(speedX, speedY);
      boing(speedX);
   }
    
    // Vertical collision
    if(posY < minPosY || posY > maxPosY){
       if(posY < minPosY){
         posY = minPosY;
       } else if (posY > maxPosY){
         posY = maxPosY;
       }
      
       deformY = -map(abs(speedY), 0, maxSpeed, 0, maxDeform );
       phaseBounceY = 0;
       speedY = -speedY * frictionBounce;
       collisionRotation(-speedY, speedX);
       boing(speedY);
    }
    
    ballScaleX = 1 + deformX * cos(phaseBounceX);
    ballScaleY = 1 + deformY * cos(phaseBounceY);
   
    phaseBounceX += 10 / frameRate;
    phaseBounceY += 10 / frameRate;
  
    deformX = min(deformX + .001, 0);
    deformY = min(deformY + .001, 0);
    
    speedRotate = sign(speedRotate) * min(abs(speedRotate), .1) ;
    angle += speedRotate;
}

void collisionRotation(float paralellSpeed, float perpendicularSpeed){
 speedRotate = (speedRotate + sign(paralellSpeed) * map(perpendicularSpeed, minSpeed, maxSpeed, -.1, .1)) /2;  
}

void boing(float speed){
    /*if(abs(speed) > speedGame){
       audio.stop();
       float soundFactor = abs(speed) /speedGame / 5;
       audio.speed(.5 + soundFactor);
       audio.volume(soundFactor);
       audio.play();
     }*/
}

void mousePressed() {
   touchSpeed(clickSpeed);
}

void mouseDragged(){
    meterX = map(mouseX, 0, width, -10, 10);
    meterY = map(mouseY, 0, height, -10, 10);
}

void mouseReleased(){
    meterX = 0;
    meterY = 0;
}

public void touchSpeed(float speed){
  float diffX = posX - mouseX;
  float diffY = posY - mouseY;
  float angle = atan( diffX / diffX);
  float clickRadius = ballSize;
  if(abs(diffX) < clickRadius && abs(diffY) < clickRadius){
      float addSpeedX =  (diffX / ballSize) * speed;
      float addSpeedY =  (diffY / ballSize) * speed;
      speedX += addSpeedX;
      speedY += addSpeedY;
      collisionRotation(speedX, speedY);
      boing(dist(0, 0, addSpeedX, addSpeedY));
  }
}

int sign(float val){
     if(val == 0){
        return 1;
     } else{
        return int(abs(val)/val);
     }
}


