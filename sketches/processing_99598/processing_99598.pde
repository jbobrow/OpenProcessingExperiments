
//Global variables 
boolean upPressed;
boolean downPressed;
boolean wPressed;
boolean sPressed;
int rBlockX;
int rBlockY;
int gBlockX;
int gBlockY;
PFont font;
int player1Score;
int player2Score;
int gameState;
int goal;
int randomNum;
int low = -10;
int high = 10;
int speed = 12;


//Creating class for vectos 
class PVector {
  float x;
  float y;
    
  PVector(float x_, float y_){
    x = x_;
    y = y_;
  }
  //adding the velocity
  void add(PVector v) {
    x = x + v.x;
    y = y + v.y;
  }
}
       
PVector location;
PVector velocity;
  
void setup() {
  //intializing variables
  player1Score = 0;
  player2Score = 0;
  gameState = 0;
  goal = 7;
  rBlockX = 50;
  rBlockY = 250;
  gBlockX = 735;
  gBlockY = 250;
  
  size (800,500);
  smooth ();
  background (255);
  
  location = new PVector (400,250);
  velocity = new PVector (random(low,high),random(low,high));
   
}
  
void draw() {
  //title when gamestate equals 0
  if(gameState == 0)
  {
    background (255);
    textSize(70);
    fill(0,255,0);
    text("Kame-hame-HA*!!!", 110,150);
    textSize(100);
    fill(0,255,0);
    text("Pong", 108,248);
    fill(0,150,255);
    text("Pong", 110, 250); 
    dropBox();
    textSize(20);
    fill(0);
    
    // press enter game starts
    text("Press ENTER to play", 210, 320);
    text("*Hidden Easter Egg", 310, 420);
    if (keyCode == ENTER ) {
      fill(255);
      rect(0,0,width,height);
      gameState = 1;
      }
  }
  if(gameState == 1)
  {// drawing out the blocks
    noStroke();
    fill(255,50);
    //fill(0,255,0);
    rect(0,0,width,height);
    updateScore();
    //GREEN BAR
    fill(0,255,0);
    rect gBlock = rect(gBlockX,gBlockY,10,100);
    //RED BAR
    fill(255,0,0);
    rect rBlock = rect(rBlockX,rBlockY,10,100);
    
    // add current speed to the location
    location.add(velocity);
    //when ball hits the back block
    if ((location.x > width) || (location.x < 0)) {
      int temp = location.x;
      velocity.x = 0;
      velocity.y = 0;
      location = new PVector (400,250);
      //determine who gets the points
      if(temp > width)
        player1Score += 1;
      
      else
        player2Score += 1;
        
      temp = null;
      
    }
    //changes directions when it hits something
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
    blockBoundaries();
    // display circle at x,y location
    stroke(random(0,255),255,0);
    fill(255,0,random(0,255));
    ellipse(location.x, location.y,16,16);
    
    dropBox();//method for background
    // decide how fast blocks go
    if (upPressed && (gBlockY > 0)) {
      gBlockY -= speed;
    }
    if (downPressed && (gBlockY + 100 < 500) ){
      gBlockY += speed;
    }
    if (wPressed && (rBlockY > 0)) {
      rBlockY -= speed;
    }
    if (sPressed && (rBlockY + 100 < 500)) {
      rBlockY += speed;
    }
    
  }
  // goes to winning or loooosing screen
  if(gameState == 2)
  {
    winOrLose();
  }
  
}
// boundaries for ball
void blockBoundaries(){
  if((location.x > gBlockX )&& (location.x < gBlockX + 10 ))
    if((location.y > gBlockY) && (location.y < gBlockY + 100))
      velocity.x = velocity.x * -1.05;
      
  if((location.x > rBlockX )&& (location.x < rBlockX ))
    if((location.y > rBlockY) && (location.y < rBlockY + 100))
      velocity.x = velocity.x * -1.05;

}


void keyPressed() {
  if (keyCode == 'W') {
    wPressed=true;
  }
  if (keyCode == 'S') {
    sPressed=true;
  }
  if (keyCode == UP) {
    upPressed=true;
  }
  if (keyCode == DOWN) {
    downPressed=true;
  }
  if(keyCode == SHIFT)
    {
      //velocity = new PVector (5,5)
      velocity = new PVector (random(low,high),random(low,high));
    }
}
 
void keyReleased() {
  if (keyCode == 'W') {
    wPressed=false;
  }
  if (keyCode == 'S') {
    sPressed=false;
  }
  if (keyCode == UP) {
    upPressed=false;
  }
  if (keyCode == DOWN) {
    downPressed=false;
  }
}
 

void winOrLose(){
   background (255);
   textSize(100);
   fill(0,255,0);
   textSize(60);
   fill(random(0, 255), random(0, 255), random(0, 255));
   
   if(player1Score == goal){
     text("Congratulations Red!!!", 100,200);
     fill(random(0, 255), random(0, 255), random(0, 255));
     text("Congratulations Red!!!", 98,198);
     
   }
   if(player2Score == goal){
     text("Congratulations Green!!!", 100,200);
     fill(random(0, 255), random(0, 255), random(0, 255));
     text("Congratulations Green!!!", 98,198);
   }
   
   textSize(20);
   fill(0);
   text("Press ENTER to play again", 250, 250); 

    if (keyCode == ENTER ) {
      fill(255);
      rect(0,0,width,height);
      gameState = 1;
      player1Score = 0;
      player2Score = 0;
      }
   
}

void buttons(){
  noStroke();
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(200, 350,115,115);
  fill(0,255,random(0,255));
  ellipse(200, 350,100,100);
  
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(400, 350,115,115);
  fill(255,random(0,255),0);
  ellipse(400, 350,100,100);
  
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(600, 350,115,115);
  fill(random(0,255),0,255);
  ellipse(600, 350,100,100);
  
  
}

void dropBox(){
  fill(random(0,255),random(0,255),random(0,255));
  randomNum = random(0,100);
  if(randomNum > 20){
    rect(random(0,800),random(0,500),10,10);
  }

}


void updateScore(){
   font = loadFont("CourierNewPSMT-36.vlw");
   textFont(font);
   textSize(50);
   fill(0, 0, 255);
   text("" + player1Score, 20, 50);
   text("" + player2Score, 750, 50);
   if((player1Score == goal) || (player2Score == goal)){
     gameState = 2;
   }

}
