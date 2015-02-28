
Ball ball;
SplingBall splingBall;

void setup(){
  size(450,450);
  smooth();
  
  ball = new Ball(mouseX,mouseY);
  splingBall = new SplingBall(ball);
}

void draw(){
  noStroke();
  fill(0,4);
  rect(0,0,width,height);
  ball.setPos(mouseX,mouseY);
  splingBall.stretch();
  ball.draw();
  splingBall.draw();
  
}

class Ball{
  PVector pos;
  PVector vel;
  PVector acc;
  
  float radius = 20;
  
  Ball(float x,float y){
    this.pos = new PVector(x,y);
    this.vel = new PVector(0.0,0.0);
    this.acc = new PVector(0.0,0.1);
  }
  
  void stretch(){
    this.vel.x += (this.acc.x - (this.pos.x-mouseX)/100);
    this.vel.y += (this.acc.y - (this.pos.y-mouseY)/100);
    this.vel.mult(0.94);
    this.pos.add(this.vel);
  }
  
  void setPos(float x,float y){
    this.pos.x = x;
    this.pos.y = y;
  }
  
  void draw(){
    fill(255);
    ellipse(this.pos.x,this.pos.y,this.radius,this.radius);
  }
  
}

class SplingBall extends Ball{
  
  Ball ball;
  float distance = 100;
  PVector last = new PVector();
  
  SplingBall(Ball ball){
    super(ball.pos.x,ball.pos.y);
    this.ball = ball;
  }
  
  void stretch(){
    this.vel.x += (this.acc.x - (this.pos.x-this.ball.pos.x)/10);
    this.vel.y += (this.acc.y - (this.pos.y-this.ball.pos.y)/10);
    this.vel.mult(0.94);
    this.pos.add(this.vel);
    this.radius = this.last.dist(this.pos);
  }
  
  void draw(){
    super.draw();
    stroke(255);
    line(this.pos.x,this.pos.y,this.ball.pos.x,this.ball.pos.y);
    last.set(this.pos);
  }
  
}

