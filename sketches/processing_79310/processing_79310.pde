
Ball bBall1;
Ball bBall2;
float vx = 2;
float vy = 1;
float x = 0;
float y = 10;
float frictionx = .998;
float frictiony = -.75;
float gravity = .04;

void setup(){
  size(600,600);
  bBall1 = new Ball(100,100,100,4);
  bBall2 = new Ball(300,300,150,10);
}

void draw(){
  background(255);
  vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;
  
  if(y > height){
    y = height;
    vy *= frictiony;
  }
  
  bBall1.move();
  bBall1.display();
  bBall2.move();
  bBall2.display();
}

class Ball{
  color c;
  float xpos;
  float ypos;
  float xspeed;
  
  Ball(color tempC, float tempXpos, float tempYpos, float tempXspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }
  
  void display(){
    stroke(0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,50,75);
    
  }
  
  void move(){
    xpos = xpos + xspeed;
    if(xpos > width){
      xpos = 0;
    }
  }
}

