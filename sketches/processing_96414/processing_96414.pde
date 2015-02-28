
Ball myBall;
int bally = 300;
int ballx = 500;
int speed = 2;
int directx = speed;
int directy = speed;
float randplacing = 300;
float fast = 1.5;
boolean started = false;
PImage wallpaper;
 
void setup(){
  size (1000,600);
  myBall = new Ball();
  wallpaper= loadImage("pongLAfinal191.jpg");
    image(wallpaper,1000,600,width,height);
  frameRate(100);  
}

void draw(){
    background(0);
  if(started == false){  
    if(mouseY < 600 && mouseY > 600 && mouseX < 600 && mouseX > 600){
      fast = 1.5;
      speed = 2;
      started = true;
      myBall.display();
    }
    
  }
   
  //Ball
  bally = bally + directy;
  ballx = ballx + directx;
  rectMode(CENTER);
  rect(ballx, bally, 10,10);
  noStroke();
  if (ballx == 990 && bally <= mouseY+50 && bally >= mouseY-50) {
    //Ball Go upward
      if (bally < mouseY) {
         directx =  - speed;
         directy =  - speed;
      }
      //Ball Go Downward
      if (bally > mouseY) {
         directx =  - speed;
         directy =  + speed;
      }
      //Ball Stayput 
      if (bally == mouseY) {
         directx =  - speed;
         directy = 0  ;
      }
   }
   
  //Player Paddle
  rectMode(CENTER);
  rect(990, mouseY, 10 , 80);
  noStroke();
   
  //ComputerPaddle
   rectMode(CENTER);
   rect(10, randplacing, 10, 80);
   noStroke();
   //Make computerpaddle chase after ball
   if(randplacing < bally){
     randplacing = randplacing + fast ;
   }
   if(randplacing > bally){
     randplacing = randplacing - fast ;
   }
   
   //Computer Paddle Movement
   if (ballx == 20 && bally <= randplacing + 50 && bally >= randplacing - 50){
     // Go Up if ball does
    if (bally < randplacing) {
         directx =  speed;
         directy =  - speed;
      }
      // Go Down if ball does
      if (bally > randplacing) {
         directx =  speed;
         directy =  + speed;
      }
      // Stay if it stays
      if (bally == randplacing) {
         directx =  speed;
         directy = 0  ;
      }
   
   }
 
 //Wallbounces
   //Right
   if ( bally == 600) {
      directy =  - speed;
   }
   //Left
   if ( bally == 0) {
     directy =   speed;
   }
   //Reset when Right Scored 
   if (ballx < 0){
    ballx = 400;
    bally = 300;
 
   }
   //Reset when Left Scored
   if(ballx > 1000){
    ballx = 400;
    bally = 300;
  }
   
  }


