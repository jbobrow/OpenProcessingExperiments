
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
  frameRate(120);
  background(255);
  bgImg = loadImage("tjm_podia.png");
}

void draw() {
      fill(255);
      rect(0,0,width,height);
      myBall1.move(); //update position of player ball (not displayed YET)
  pushMatrix();
    translate(-1*myBall1.xpos + 0.5*width,-1*myBall1.ypos + 0.5*height); //translate the arena so that player ball ends up in centre of screen
    //stroke(0,0);
    //fill(0,0,0);
    //rect(0,0, arenaWidth, arenaHeight); //draw the arena rectangle
    image(bgImg,0,0);
    myBall1.display();
    myBall2.move();
    myBall2.display();
    myBall3.move();
    myBall3.display();
    myBall4.move();
    myBall4.display();
    myBall5.move();
    myBall5.display();
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


