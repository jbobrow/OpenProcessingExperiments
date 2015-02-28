
/*
  A Long Train Ride - Bryce Williams
  
  How to Play:
  Your goal is to get a seat on the train, before it gets lost in the crowd!
  You can either nudge through the crowd slowly by holding the Space bar, or by alternating A and L to push your way through the crowd.
  Push or nudge too quickly and the crowd will nudge back!
  
  Code and Art by Bryce Williams
*/

int xPos = 50;
int yPos;
int charWidth = 30;
int charHeight = 85;
int goalXpos;
int goalYpos;

int timeCount = 5400;
int crowdCounter = 100;
int playerCounter = 0;

PImage player;
PImage seat;
PImage bg1;
PImage bg2;
PImage fg1;

String gameState, endText;
boolean leftPush = true;
boolean rightPush = false;

void setup(){
  size(1024,128);
  smooth();
  gameState = "InGame";
  endText = "Yay! You found a seat!";
  
  player = loadImage("subwaychar.gif");
  seat = loadImage("subwayseat2.gif");
  bg1 = loadImage("subwaybg1.gif");
  bg2 = loadImage("subwaycrowd.gif");
  fg1 = loadImage("subwayfg1.gif");
}

void draw(){
  frameRate(60);
  background(155,155,155);
  timeCount--;
  
  image(bg1,0,0);
  image(bg1,bg1.width,0);
  image(bg1,bg1.width*2,0);
  image(bg1,bg1.width*3,0);
  
  image(bg2,0,0);
  image(bg2,bg2.width,0);
  image(bg2,bg2.width*2,0);
  image(bg2,bg2.width*3,0);
  
  //goal seat
  goalXpos = width-80;
  goalYpos = height-30;
  tint(255,timeCount/20);
  image(seat, goalXpos,height-seat.height);
  tint(255,255);
  fill(255,0);
  noStroke();
  rect(goalXpos,goalYpos , 30,30);

  //player character
  yPos = height-charHeight;
  //rect(xPos,yPos , charWidth,charHeight);
  image(player, xPos,yPos);
  
  //pushing mechanic
  playerCounter--;
  if(playerCounter >= crowdCounter){
    xPos-=50;
    playerCounter = 0;
    if (crowdCounter < 20){
      crowdCounter = 20;
    } else {
      crowdCounter -=20;
    }
  }
  
  image(fg1,0,0);
  image(fg1,fg1.width,0);
  image(fg1,fg1.width*2,0);
  image(fg1,fg1.width*3,0);
  
  fill(42, 39, 53, 50);
  rect(0,0,width,height);
  
  //Winning
  if (xPos+charWidth > goalXpos +15 && xPos < goalXpos+15){
    timeCount = 10;
    gameState = "EndGame";
  }
  if (timeCount <= 0){
    gameState = "EndGame";
    endText = "Oh no!  You lost the seat!";
  }
  
  //Win Screen
  if (gameState == "EndGame"){
    background(0,0,0);
    fill(255, 255, 255);
    text(endText, width/2, height/2);
  }
}

void keyPressed(){
  if(keyCode == 32){ //Javascript KeyCode for Space Bar
    xPos+=2;
    playerCounter+=2;
  }
}

void keyReleased(){
  if(keyCode == 65){ //Javascript KeyCode for A
    if (leftPush == true){
      xPos+=5;
      playerCounter+=5;
      leftPush = false;
      rightPush = true;
    }
  }
  
  if(keyCode == 76){ //Javascript KeyCode for L
    if (rightPush == true){
      xPos+=5;
      playerCounter+=5;
      rightPush = false;
      leftPush = true;
    }
  }
}


