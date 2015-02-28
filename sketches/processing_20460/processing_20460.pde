
Ball[] ball = new Ball[100];
 
boolean pressed = false;
 
void setup() {
  size(400,400);
  background(0);
  smooth();
 
  for(int i=0; i<100; i++) {
    ball[i] = new Ball(mouseX, 
                       mouseY, 
                       random(1, 4), 
                       0);
  }
}
 
 
void draw() {
 
  //background(41);
  if(pressed){
    for(int i = 0; i<100; i++){
      ball[i].update();
    }
  }
  fill(0, 3);
  rect(0, 0, width, height);
  
}
 
void mousePressed(){
  
  
  for(int i=0; i<100; i++) {
    ball[i] = new Ball(mouseX, mouseY, random(1, 4), 0);
  }
  
  for(int i = 0; i<100; i++){
    ball[i].posX = mouseX;
    ball[i].posY = mouseY;
  }
  
  
  pressed = true;
  
  // background(0);
  fill(0, 50);
  rect(0, 0, width, height);
}
 
class Ball {
 
  float posX = 0;
  float posY = 0;
  float velX = 0;
  float velY = 0;
  float radius = 20;
  float gravity = 0;
  float accX = 0;
  float accY = 0;
  color ballColor;
 
  Ball(float inputX, float inputY, float inputR, float inputG) {
    posX = inputY;
    posY = inputX;
    radius = inputR;
    velX = random(-5, 5);
    velY = random(-2, 2);
    gravity = inputG;
    accX = 0.05;
    accY = 0.02;
    ballColor = color(random(30),random(50,255),random(200,255));
  }
 
 
  void update() {
    bounce();
    move();
    ballshape();
  }
 
  void bounce() {
 
    if(posY > height-radius ) {
      posY = height - radius;
      velY *= -0.8;
      //
    }
    if(posY-radius < 0) {
      PosY = 0+ radius;
      velY *= -1;
    }
    if(posX > width-radius ) { 
      posX = width - radius;
      velX *= -0.8;
    }
    if(posX-radius < 0) { 
      posX = 0 + radius;
      velX *= -0.8;
    }
  }
 
 
  void move() {
    posY += velY*3;
    posX += velX*1;
    velY += (accY + gravity);
    velX += accX/25;
  }
 
  void ballshape() {
    fill(ballColor, 150);
    noStroke();
    ellipse(posX, posY, radius*2, radius*2);
  }
}
