
// Array of bouncing balls, pt. 4
// Create a new function inside Ball class to make it interactive

Ball[] ballArray;
// set a variable to change the number of balls
int numBalls = 5;

void setup(){
  size(800, 800);
  
  ballArray = new Ball[numBalls];
  
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball();
  } 
}

void draw(){
  background(98,3,255);
  for(int i=0; i < ballArray.length; i++){
     ballArray[i].update();
     ballArray[i].checkPos();
     ballArray[i].display();
  } 
}


void mouseClicked(){
  for(int i=0; i<ballArray.length; i++){
     ballArray[i] = new Ball();
  } 
}

// HOMEWORK = make a game.

// Ball Class
class Ball {

  // Every ball needs these values
  int posX;
  int posY;
  int speedX;
  int speedY;
  float size;
  
  color fillColor = color(35,255,3);
  

  // create the ball object with starting values
  Ball() {
     posX = int(random(0,width));
     posY = int(random(0,height));
     speedX = int(random(1,20));
     speedY = int(random(1,20));
     size = random(10,100);
  }
  
  // move the ball and check its position
  void update() {
    posX += speedX;
    posY += speedY;
    
    if (posX >= width || posX <= 0) {
      speedX *= -1;
    }

    if (posY >= height || posY <=0) {
      speedY *= -1;
    }
  }
  
  void checkPos() {
    if( dist(mouseX, mouseY, posX, posY) < size/2) {
      textSize(90);
      textAlign(CENTER);
      fill(255);
      text("GAME OVER :(", width/2,height/2);
      
   
    } 
  }

  // draw the ball
  void display() {
    noStroke();
    fill(fillColor);
    ellipse( posX, posY, size, size );
  }
  
}




