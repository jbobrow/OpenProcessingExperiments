
PImage sky;

Cloud[] clouds = new Cloud[10];  // array to store cloud objects and cycle information

int i = 0;                       // iterator variable
int score = 0;                   // keeps track of score
int gameState = 0;               // stores the game state, playing, won, lost
int timeLimit = 10;              // for game end time limit
int frameR = 0;                  // offsets framerate for timer
char firstKey;                   // used to check if the key was released before pressing a new key
int ONCE = 1;                    // used to limit functions
int playerX = 300;               // player object position
float waterLevel = 600;          // makes water rise and checks for lose condition
int AL = 100;                    // alpha value for backgound

void setup(){
  size(600,600);
  frameRate(60);
  sky = loadImage("cloudsky.png");
  textAlign(CENTER);                          // text origin setting
  
  for(i=0;i<10;i++){                          // Populate the cloud object array
    clouds[i] = new Cloud(0);                 // creates cloud, sets cloud state
    clouds[i].CX = int(random(400))+100;      // Random X pos
    clouds[i].CY = 500 - i*100;               // Y positions from 500 to -400
    clouds[i].Letter = char(random(65,91));   // sets the clouds char to ASCII A-Z
  }
  clouds[0].state = 1;                        // set first cloud to cleared state on start
  clouds[0].CX = 300;                         // first cloud always starts at 300
}

void draw(){

  if(gameState==0){                   // pre-game
  
    // draw title
    fill(200);
    rect(0,0,600,600);
    fill(76,64,255);
    textSize(100);
    text("cloud hopper",300,200);
    textSize(20);
    text("click screen to start",300,450);
    
    if(mousePressed){                 // if player clicks screen, start the game
      if(mouseX>=0&&mouseX<=600){
        if(mouseY>=0&&mouseY<=600){
          gameState = 1;
        }
      }
    }
  }
  else if(gameState==1){          // game is being played
  
    // background
    image(sky,0,0);
    noStroke();
    fill(100,AL);
    rect(0,0,600,600);
    
    // draw clouds
    for(i=0;i<10;i++){
      clouds[i].picture();
    }
    
    // draw player
    fill(76,64,255);
    stroke(237,152,24);
    ellipse(playerX,500,25,25);
    if(clouds[0].CX < playerX){
      playerX-=10;
    }
    if(clouds[0].CX > playerX){
      playerX+=10;
    }
    
    // draw water
    noStroke();
    fill(37,21,229,100);
    rect(0,waterLevel,600,150);
    waterLevel -= 1;
    
    // check water level
    if(waterLevel < 475){
      gameState = 3;
    }
    
    // draw score
    noStroke();
    fill(0);
    textSize(30);
    text(score,550,50);
    
    // draw timer
    text(timeLimit,50,50);
    
    // if timer = 0 end game to win screen
    if(timeLimit == 0){
      gameState = 2;
    }
    
    // decrement timer once a second, accounting for frame rate
    if(frameR++==60){
      frameR = 0;
      timeLimit -=1;
    }
  }
  
  else if(gameState==2){        // game win screen
    fill(255);
    rect(0,0,600,600);
    textSize(100);
    fill(76,64,255);
    text("time up!",300,200);
    textSize(60);
    text("score:" + score,300,400);
  }
  else if(gameState==3){        // game lose screen
    fill(0);
    rect(0,0,600,600);
    textSize(100);
    fill(237,220,24);
    text("blub blub!",300,300);
  }
}

void keyPressed(){
  if(ONCE==1&&gameState==1){                               // only checks if it can and game is playing
    firstKey = key;                                        // stores first key pressed
    ONCE = 0;                                              // can't check key again until first key released
    if(key==clouds[1].Letter||key==clouds[1].Letter+32){   // checks if key matches lower or upper val for Letter
      for(i=0;i<9;i++){
        clouds[i].CX = clouds[i+1].CX;
        clouds[i].Letter = clouds[i+1].Letter;
      }
      // redefine cloud 9 as new cloud
      clouds[9].CX = int(random(400))+100;                 // Random X pos
      clouds[9].CY = -400;                                 // Y positions from 500 to -400
      clouds[9].Letter = char(random(65,91));              // sets the clouds char to ASCII A-Z
      clouds[0].state = 1;                                 // cloud object now draws cleared cloud
      score++;                                             // +1 score for getting right letter
      waterLevel = 600;                                    // getting the right cloud decreases the water level
      AL-=20;                                                // makes sky lighter
    }
    else if((key >= 65 && key <=90) || (key >= 97 && key <= 122)){  // chaecks if key is a letter but wrong one
      for(i=0;i<9;i++){
        clouds[i].CX = clouds[i+1].CX;
        clouds[i].Letter = clouds[i+1].Letter;
      }
      // redefine cloud 9 as new cloud
      clouds[9].CX = int(random(400))+100;                 // Random X pos
      clouds[9].CY = -400;                                 // Y positions from 500 to -400
      clouds[9].Letter = char(random(65,91));              // sets the clouds char to ASCII A-Z
      clouds[0].state = 2;                                 // cloud object draws failed cloud
      AL+=20;                                                // makes sky darker 
    }
  }
}

void keyReleased(){             // allows key check if first key released
  if(key==firstKey){
    ONCE = 1;
  }
}

class Cloud {
  int CX;          // Cloud x position
  int CY;          // Cloud y position
  char Letter;     // Letter assigned to cloud object
  int state;       // Cloud state; normal, cleared, failed
  
  Cloud(int mode){
    state = mode;
  }
  
  void picture(){
    if(state==0){                // Rainy Cloud
      stroke(100);
      strokeWeight(3);
      fill(150);
      rect(CX-25,CY-25,50,50);
      ellipse(CX,CY-25,50,50);
      ellipse(CX-25,CY,50,50);
      ellipse(CX+25,CY,50,50);
      noStroke();
      rect(CX-25,CY-25,50,50);
      fill(0);
      textSize(30);
      text(Letter,CX,CY);
    }
    if(state==1){                 // Cleared Cloud and Rainbow
      stroke(170);
      strokeWeight(3);
      fill(255);
      rect(CX-25,CY-25,50,50);
      ellipse(CX,CY-25,50,50);
      ellipse(CX-25,CY,50,50);
      ellipse(CX+25,CY,50,50);
      noStroke();
      rect(CX-25,CY-25,50,50);
    }
    if(state==2){                 // Failed Stormy Cloud and Lightning
      stroke(0);
      strokeWeight(3);
      fill(50);
      rect(CX-25,CY-25,50,50);
      ellipse(CX,CY-25,50,50);
      ellipse(CX-25,CY,50,50);
      ellipse(CX+25,CY,50,50);
      noStroke();
      rect(CX-25,CY-25,50,50);
    }
  }
}
      


