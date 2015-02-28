
// Setting up the variables
PingPong Ball; // Ping Pong ball for Ping Pong game
Player Bat; // Bat for the player

// Setup 
void setup(){ // Setup the size of the window
  size (500,500);
  smooth();
Bat = new Player(); // Initialise the bat and ball
  Ball = new PingPong();
   
}
 
void draw(){ // Set the background colour to random flashing colour
  background(random(0,255), 100, random(50,255)); 
Ball.moving(); // Initialise the balls movement
  Ball.display();
  Ball.rebound();
  Ball.reset();
  Bat.moving();
  Bat.display();
  
 if (Ball.y+20>Bat.y && dist(Ball.x,0,Bat.x,0)<40){
  Ball.speedy=-Ball.speedy;
 }
 
 
 }

class Player{ // Postition the bat
  float x = width/3;
  float y = 350;
  float speedx =8;
   
  Player(){
  }
   
  void moving(){ // When arrow keys are pressed the bat will move
    if(keyPressed && (key == CODED)){
     if(keyCode == LEFT){
      x=x-5;
     }else if (keyCode == RIGHT){
      x=x+5;
     }
    }
  }
   
  void display(){
    rect(x-30,y,90,90); // Size of the players bat
  }
   
   
   }

class PingPong{
  float x = 150;
  float y = 250;
  float speedx = 5; // Initialise the speed the ball travels at
  float speedy = 5;
   
  PingPong(){
    
  }
   
  void display(){
   ellipse(x,y,30,30);
  fill(237,33,57); // Set the size of the ball
    
  }
  void moving(){
   x+=speedx;
   y+=speedy;
  }
  void rebound(){ // Set the rebound boundaries
   if (x>width || x<0){
     speedx=-speedx;  
   }
   if (y<0){
     speedy=-speedy;  
   }
    
  }
  void reset(){ // Rest the game by presing 'r'
   if (keyPressed) {
    if (key == 'r') {
      x = 300;
      y = 0;
    }
   }
  }
   
}



