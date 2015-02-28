
int numBalls;
ArrayList balls;

void setup(){
  size(800,450);
  smooth();
  background(255);
  balls = new ArrayList();
}

void draw(){
  background(255);
  for(int i=0;i<balls.size();i++){
    Ball thisBall = (Ball) balls.get(i);
    thisBall.checkPos();
    thisBall.update();
    thisBall.display();
  }
}

void mousePressed(){
  for(int i = 0;i<10;i++){
    balls.add(new Ball(mouseX,mouseY));
  }
}

class Ball{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  int r;
  color c;
  
  Ball(int _x,int _y){
    location = new PVector(_x,_y);
    velocity = new PVector(random(-2,2),random(-2,2));
    r = round(random(5,50));
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
  void update(){
    location.add(velocity);
  }
  
  void display(){
    noStroke();
    fill(c,175);
    ellipse(location.x,location.y,r,r);
  }
  
  void checkPos(){
    if(location.x > width-r/2){
      // location.x = width;
      velocity.x *=-1;
    }else if(location.x < 0+r/2){
      // location.x = r;
      velocity.x *=-1;
    }else if(location.y > height-r/2){
      // location.y = height-r;
      velocity.y *=-1;
    }else if(location.y < 0+r/2){
      velocity.y *=-1;
    }
  }

}
