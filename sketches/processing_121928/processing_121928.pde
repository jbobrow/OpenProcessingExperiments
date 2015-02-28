
//Declare
Ball [] ballCollection = new Ball [100];
void setup() {
  size(600, 600);
  smooth();

  
  //Initialize
  for( int i = 0; i < ballCollection.length; i++){
  ballCollection[i] = new Ball(random(0,width),random(0,height));
  }
  
}
void draw() {
  background(190, 0, 0);
  
  
  //Call Functionality
  for(int i = 0; i < ballCollection.length; i ++){
ballCollection[i].run();
  }

}


  
 
  
  

class Ball {

  //Global Variables
  float x = 0;
  float y = 0;
  float speedX = 3;
  float speedY = 0.5;

  //Constructor
  Ball(float _x, float _y) {
    x = _x;
    y = _y;
  }

  //Functions
  void run() {
    display();
    move();
    bounce();
    gravity();
   
  }
  void gravity() {
    speedY += random(0.2, 1.7);
  }
  void move() {
    x += speedX; 
    y += speedY;
  }
  void bounce() {
    if (x > width) {
      speedX = speedX * -1;
    }
    if (x < 0 ) {
      speedX = speedX * -1;
    }
    if (y > height) {
      y= height;
      speedY = speedY * -0.95;
    }
    if (y < 0 ) {
      speedY = speedY * -1;
    }
  }
  //Drawing of the balls
  void display() {
    line(x,y,mouseX,mouseY);
    ellipseMode(RADIUS);
    fill(240, 190, 50);
    strokeWeight(1);
    ellipse(x, y, 12, 12);
    cursor(CROSS);
    fill(0);
    
    //fill(255);
    //float mx = constrain(mouseX, 0, 600);
    //float my = constrain(mouseY, 0, 600);
    //rect(mx, my, 25, 50);
 
  }
}



