
//Bounce.....
//Reference(s) + - 
//-http://processing.org/learning/topics/simpleparticlesystem.html

//-Bouncing ball tutorial
//-http://www.firstyeardesign.com/index.php?/pages/dsdn142resources/ 

//-I referred to the code from the link below to get an idea of how to
//layout the particle generator and how to create variables to move particles;
//-http://openprocessing.org/visuals/?visualID=5654

ArrayList<Ball> balls;
 
void setup() {
  
  size(700, 400);
  smooth();  
  cursor(HAND);
  frameRate(30);
  
  balls = new ArrayList();
  
}
 
void draw() {
  
 background(0);
 noStroke();
 
  for (Ball b : balls)
  {
    b.bouncy();
  }
}
 
//Generates particles at coursor position/removes balls. 
void mousePressed() {
  
  if (mouseButton == LEFT) {
    balls.add(new Ball(mouseX, mouseY));
  }
  else if ((mouseButton == RIGHT)&&(balls.size() > 0)) {
    balls.remove(0);
  }
}

class Ball { 

//Postion  
  float x, y;
//Speed  
  float xSpeed;
  float ySpeed;
//Gravity effect and how long particles last  
  float gravity = 0.2;
//Bounce development  
  float bounce = 0.8;
  
//Define the variables; initial x,y positions(values):  
  Ball(float inX, float inY ) {
 //Position    
    x = inX;
    y = inY;
    xSpeed = 0;
  }
  
//Updates the value of the varibles for the particles  
  void update() {
    x += xSpeed;
    y += ySpeed;
    ySpeed += gravity;   
 
    if ((y > height -1) && (ySpeed > 5)) {
      ySpeed *= -bounce;
    }
  }
//Draws balls 
  void bouncy() {
    
    update();
 
    noStroke();
    fill(255,255,255);
    ellipse(x, y, 20, 20);
  }
  
}



