
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Modified by Tristan Miller
// Example 8-2: Two Ball objects

Ball myBall1;
Ball myBall2; // Three objects!
Ball myBall3;
Ball myBall4;
Ball myBall5;
Ball[] ballArray = new Ball[5];

char[] controlArray = new char[8];
String[] ballSelectArray = new String[ballArray.length];

int arenaWidth = 960; //set dimensions of box in which balls will bounce.
int arenaHeight = 540;

PImage bgImg;

void setup() {
  size(400,400);
  myBall1 = new Ball(color(255,0,0),100,100,0,0,1); // Parameters go inside the parentheses when the object is constructed.
  myBall2 = new Ball(color(0,0,255),0,0,2,4,0);
  myBall3 = new Ball(color(0,255,0),0,0,5,2,0);
  myBall4 = new Ball(color(0,255,255),0,0,1,1,0);
  myBall5 = new Ball(color(255,255,0),0,0,2,5,0);
  
  ballArray[0] = myBall1;
  ballArray[1] = myBall2;
  ballArray[2] = myBall3;
  ballArray[3] = myBall4;
  ballArray[4] = myBall5;
  
  for (int i = 0; i < ballSelectArray.length; i++) {
    ballSelectArray[i] = str(i+1);
  }
  //println(ballSelectArray);
  controlArray[0] = 'w';
  controlArray[1] = 'W';
  controlArray[2] = 'a';
  controlArray[3] = 'A';
  controlArray[4] = 's';
  controlArray[5] = 'S';
  controlArray[6] = 'd';
  controlArray[7] = 'D';
  //println(controlArray);
          
  
  frameRate(120);
  background(255);
  bgImg = loadImage("tjm_podia.png");
}

void draw() {
      fill(255);
      rect(0,0,width,height);
      
      
          //code to see if player control is to be handed to another ball.
    //see if keypress exists
    if (keyPressed){
    //then - if it matches any element in a 'ball number' array..if not, do nothing
      for (int i = 0; i < ballSelectArray.length; i++){
        if(str(key).equals(ballSelectArray[i])){
          for (int j = 0; j < ballArray.length; j++){
            if (i == j){  
              ballArray[j].player = 1;
            } else {
              ballArray[j].player = 0;
            }
           }
        }
      }
    //for each ball in ballArray, check which ball corresponds to the keypress
    //those that correspond, become the player, otherwise, become not a player
    }
      
      
      for (int i = 0; i < ballArray.length; i = i+1) { //update position of current player ball only
        if(ballArray[i].player == 1){
          ballArray[i].move();
        }
      }
      
      pushMatrix();
        for (int i = 0; i < ballArray.length; i = i+1) {
        if(ballArray[i].player == 1) {
           if(ballArray[i].xpos < 0.5*width)
          {
           // don't x-move the 'camera' if player ball is in the x-startzone of the arena
          }
          else if(ballArray[i].xpos > (arenaWidth - 0.5*width))
          {
             translate(-arenaWidth + width,0); //if player ball reaches the x-endzone of the arena, x-lock the camera
          }
          else
          {
            translate(-1*ballArray[i].xpos + 0.5*width, 0); //x-translate the arena so that player ball ends up in x-centre of screen
          }    
        
          if(ballArray[i].ypos < 0.5*height)
          {
           // don't y-move the 'camera' if player ball is in the y-startzone of the arena
          }
          else if(ballArray[i].ypos > (arenaHeight - 0.5*height))
          {
           translate(0,-arenaHeight + height); //if player ball reaches the y-endzone of the arena, y-lock the camera
          }
          else
          {
            translate(0, -1*ballArray[i].ypos + 0.5*height); //y-translate the arena so that player ball ends up in y-centre of screen
          }
        }
      }
        image(bgImg,0,0);
        
        for (int i = 0; i < ballArray.length; i = i+1) { //update positions of NPBs and display all Bs
          if(ballArray[i].player == 0){
            ballArray[i].move();
          }
          ballArray[i].display();
        }
       
    popMatrix();
    

}
        


class Ball { // Even though there are multiple objects, we still only need one class. No matter how many cookies we make, only one cookie cutter is needed.Isn’t object-oriented programming swell?
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  float player;

  Ball(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed, int tempPlayer) { // The Constructor is defined with arguments.
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
    player = tempPlayer;
  }

  void display() {

    fill(c);
    stroke(0, 0);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,20,20);
  }
  
  

  void move() {
    if (player == 1) { 
      
      if (keyPressed) { //set movement commands for player-controlled ball
        if (key == 'd' || key == 'D') {
        xspeed = xspeed + 0.3;
        }
        
        if (key == 'a' || key == 'A') {
        xspeed = xspeed - 0.3;
        }
        
        if (key == 's' || key == 'S') {
        yspeed = yspeed + 0.3;
        }
        
        if (key == 'w' || key == 'W') {
        yspeed = yspeed - 0.3;
        }
      } else {
        xspeed = 0.99*xspeed; //attenuate speed in absence of keyboard command
        yspeed = 0.99*yspeed;
      }
    }
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
    if (xpos > arenaWidth && xspeed > 0) {
      xspeed = -1*xspeed;
      
    }
    
    if (xpos < 0 && xspeed < 0) {
      xspeed = -1*xspeed;
      
    }
    if (ypos > arenaHeight && yspeed > 0) {
      yspeed = -1*yspeed;
    }
    
    if (ypos < 0  && yspeed < 0) {
      yspeed = -1*yspeed;
    }
  }
}


