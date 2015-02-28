
PImage myImage;                                

Ball[] balls;
 
boolean click;
 
void setup(){
  size(640,418);
  myImage = loadImage("Snorks12.jpeg");
  balls = new Ball[1000];  
  for(int i = 0; i < 1000; i++){
    balls[i] = new Ball(random(1,650),random(20,600),random(2,20));
  }
  }
 
void draw(){
  image(myImage, 0, 0);
  for(int i = 0; i < 1000; i++){
    balls[i].display();
    balls[i].move();
  }
}
 
class Ball {
  float x,y, vy, vx, gravity, friction;
   
  Ball(float xpos, float ypos, float dia){
    x = xpos;
    y = ypos;
    friction = random(-2,-0.9);
    gravity = random(0.025,1);
 
  }
   
  void display(){
    fill(198,210,240);
    smooth();
    ellipse (x,y,15,15);
  }
   
  void move(){
    vy += gravity;
    x += vx;
    y += vy;
    if (y > height){
      y = height;
      vy*=friction;
    }
    if (x>width){
      x = width;
      vx*=friction;
    }
  }
}
 
void mousePosition() {
   
}


