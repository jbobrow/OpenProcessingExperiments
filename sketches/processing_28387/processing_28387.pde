
PImage img;
Ball[] balls = new Ball[1];
float gravity = 0.1;
 
float y;
 
void setup(){
  size (800,600);
img = loadImage ("pink.jpg");
frameRate(30);
balls [0] = new Ball (50,0,200);
}
 
 
void draw(){

  loadPixels();
  img.loadPixels();
  image(img,0,0);
  for (int i = 0; i < balls.length; i ++){
   balls[i].gravity();
  balls[i].move();
  balls[i].display();
   
}
}
void mousePressed (){
  Ball b = new Ball (mouseX,mouseY,200);
   
  balls = (Ball[]) append (balls,b);
   
}


class Ball {
  float x;
  float y;
  float speed;
  float w;
   
  Ball (float tempX,float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
  }
   
  void gravity (){
    speed = speed + gravity;
  }
   
  void move () {
    y = y + speed;
    if (y > height) {
      speed = speed * - 0.95;
      y = height;
    }
  }
   
  void display () {
    fill(random(210,230),random(100,138),random(180,210),random(30,130));
    noStroke();
    ellipse (x,y,w,w);
  }
}

