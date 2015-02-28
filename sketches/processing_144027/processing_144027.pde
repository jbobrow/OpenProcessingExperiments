
boolean Stoptime = false; // Set Stoptime to false 
boolean Stopball = false; // Set Stopball to false
int currentPage = 0;
int yPos = 0;
int time = 0;
int xPos = 2000;
int SPB = -30;//Speed of the balls
int incDec = 20;//player movement speed
float r;
PImage PurpleSpaceTitle;
PImage StartButton;
PImage LevelOne;
PImage Player;
PImage BallSmall; 
void setup (){
  size (1366,768);
  PurpleSpaceTitle = loadImage ("PurpleSpaceTitle.jpg"); //loads the start page
  StartButton = loadImage ("StartButton.png"); //loads the start button    
  LevelOne = loadImage ("LevelOne.jpg"); //loads the background after starting  
  Player = loadImage ("Player.png"); //loads the nyan cat player model
  BallSmall = loadImage ("BallSmall.png"); //loads the ball npc
  r = random (800);
  fill(0,0,255);
}
void draw (){
  if(currentPage == 0){
    image(PurpleSpaceTitle,-380,0);
    image(StartButton,570,450);
    fill(0);
    text("Start!", 620, 490);
  }
  else if (currentPage == 1) {
    drawLevelOne();
  }
  if(Math.abs(150-xPos) <58 && Math.abs(325+yPos-r) <58){
   Stoptime = true;
   Stopball = true; 
  }
}
void drawLevelOne() { //movement for player model
  image(LevelOne,-380,-100);
  if(325 + yPos > -140 && 295 + yPos < 550){ //barriers for the top and bottom 
    image(Player,150,325 + yPos);
  }
  else{
    incDec = - incDec;
  }
  BallWall();
  SingleBall();
  
  //image(BallSmall, 2025 + xPos, 325 + r);
   if(Stopball == false){
     
      xPos = xPos - 10;
      if(xPos < 0){
        xPos = 1000;
        r = random(800);
      }
   }
  yPos = yPos+incDec;//move nyan cat vertically
  fill(255,153,0);
  text("Timer:"+(time/100),550,100);
  if (Stoptime == false){
    time = time + 1;
  }
}

void mousePressed(){ //loads first level
   if(currentPage == 0 && mouseX > 400 && mouseX < 650 && mouseY > 400 && mouseY < 600){
      currentPage = 1;
   } 
}
void keyPressed (){
  incDec = - incDec;
}
void BallWall(){
    image(BallSmall, 2025 + xPos, 100 + r);
    image(BallSmall, 2025 + xPos, 200 + r);
    image(BallSmall, 2025 + xPos, 300 + r);
    image(BallSmall, 2025 + xPos, 400 + r);
    image(BallSmall, 2025 + xPos, 500 + r);
    image(BallSmall, 2025 + xPos, 600 + r);
}
void SingleBall(){
  image(BallSmall, xPos,r);
}

