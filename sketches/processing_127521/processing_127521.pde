

 
Ball myBall1;
Ball myBall2; // Three objects!
Ball myBall3;
 
//int windowSize = 400;
 
void setup() {
  size(400,200);
  myBall1 = new Ball(color(255,0,0),0,0,4,5,1); // Parameters go inside the parentheses when the object is constructed.
  myBall2 = new Ball(color(0,0,255),0,0,2,4,0);
  myBall3 = new Ball(color(0,255,0),0,0,5,2,0);
  frameRate(120);
  background(0);
}
 
void draw() {
  stroke(0,0);
  fill(0,0,0,30);
  rect(0,0,width,height);
  myBall1.move();
  myBall1.display();
  myBall2.move();
  myBall2.display();
  myBall3.move();
  myBall3.display();
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
        xspeed = xspeed + 1;
        }
         
        if (key == 'a' || key == 'A') {
        xspeed = xspeed - 1;
        }
         
        if (key == 's' || key == 'S') {
        yspeed = yspeed + 1;
        }
         
        if (key == 'w' || key == 'W') {
        yspeed = yspeed - 1;
        }
      } else {
        xspeed = 0.99*xspeed; //attenuate speed in absence of keyboard command
        yspeed = 0.99*yspeed;
      }
    }
    xpos = xpos + xspeed;
    ypos = ypos + yspeed;
    if (xpos > width && xspeed > 0) {
      xspeed = -1*xspeed;
       
    }
     
    if (xpos < 0 && xspeed < 0) {
      xspeed = -1*xspeed;
       
    }
    if (ypos > height && yspeed > 0) {
      yspeed = -1*yspeed;
    }
     
    if (ypos < 0  && yspeed < 0) {
      yspeed = -1*yspeed;
    }
  }
}

