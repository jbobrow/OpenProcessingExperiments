
int StageW = 950;
int StageH = 650;

int sum = 1000;
Ball[] balls;

int left = 0;
int right = StageW;
int top = -200000;
int bottom = StageH-200;

float spring = .3;
float gravity = .9;
float bounce = .2;
float drag = .98;

float r = 255;
//rand() * 128 + 127;
float g = 0;
//rand() * 128 + 127;
float b = 0;
//rand() * 128 + 127;
float w = 0;
float ri = 0.1;
//rand() * 0.05;
float gi = PI/sum*1.4;
//rand() * 0.05;
float bi = 0.1;

int step = 0;

void setup(){
  size(924,450);
  background(0);
  smooth();
  frameRate(40);



  balls = new Ball[sum];


  for (int i = 0; i < sum; i++) {  
    float w = random(3)+1;
    color c = color(255, sin(g += gi)*255, 0);
    balls[i] = new Ball(100,-3*i-200,w,w,c);   
  }


}

void draw(){  
  if(paused) return;
  
  background(0);
  if(step == 159){
    playTowards = false;
  }
  else if(step == 0){
    playTowards = true;
  }

  if(playTowards){
    towardsplay(); 
  }
  else{
    rewindPlay();
  }
}

void rewindPlay(){
  for (int i = 0; i<sum; i++) {
    Ball ball =  balls[i];
    checkWalls(ball); 
    ball.vx *= drag;
    ball.vy += gravity;   
    ball._x = ball.xh[step];
    ball._y =  ball.yh[step];
    ball.vx= ball.vxh[step];
    ball.vy= ball.vyh[step] ;
    ball.draw(); 
  }
  step--;
}

void towardsplay(){
  for (int i = 0; i<sum-1; i++) {
    Ball ballA = balls[i];
    for (int j = i+1; j<sum; j++) {
      Ball ballB =balls[j];
      checkCollision(ballA, ballB);
    }
  }

  for (int i = 0; i<sum; i++) {
    Ball ball =  balls[i];
    checkWalls(ball); 
    ball.vx *= drag;
    ball.vy += gravity;   
    ball.xh[step] = ball._x;
    ball.yh[step] = ball._y;
    ball.vxh[step] = ball.vx;
    ball.vyh[step] = ball.vy;
    ball.draw(); 
  }
  step++;
}

void checkCollision(Ball ballA,Ball ballB){
  float desX = ballA._x - ballB._x;
  float desY = ballA._y - ballB._y;
  float dis = sqrt(desX*desX + desY*desY) ;
  float len = ballA._width + ballB._width;
  if(dis < len){
    float angle = atan2(desY, desX);
    float sine = sin(angle);
    float cosine = cos(angle);

    Point2D pos0 = new Point2D(0,0);
    // rotate ball1's position
    Point2D pos1 = rotate(desX, desY, sine, cosine, true);
    // rotate ball0's velocity
    Point2D vel0 = rotate(ballA.vx, ballA.vy, sine, cosine, true);
    // rotate ball1's velocity
    Point2D vel1 = rotate(ballB.vx, ballB.vy, sine, cosine, true);


    float vxTotal = vel0.x-vel1.x;
    vel0.x = ((ballA.mass-ballB.mass)*vel0.x+2*ballB.mass*vel1.x)/(ballA.mass+ballB.mass);
    vel1.x = vxTotal+vel0.x;

    float absV = Math.abs(vel0.x)+Math.abs(vel1.x);
    float overlap = (ballA._width/2+ballB._width/2)-Math.abs(pos0.x-pos1.x);
    pos0.x += vel0.x/absV*overlap;
    pos1.x += vel1.x/absV*overlap;

    Point2D pos0F = rotate(pos0.x, pos0.y, sine, cosine, false);
    Point2D pos1F = rotate(pos1.x, pos1.y, sine, cosine, false);
    // adjust positions to actual screen positions
    // ballB._x += pos1F.x;
    // ballB._y += pos1F.y;
    // ballA._x += pos0F.x;
    // ballA._y += pos0F.y;
    // rotate velocities back
    Point2D vel0F = rotate(vel0.x, vel0.y, sine, cosine, false);
    Point2D vel1F = rotate(vel1.x, vel1.y, sine, cosine, false);
    ballA.vx = vel0F.x;
    ballA.vy = vel0F.y;
    ballB.vx = vel1F.x;
    ballB.vy = vel1F.y;
  }  
}

void checkWalls(Ball ball) {
  ball._x += ball.vx;
  if (ball._x<left+ball._width/2) {
    ball._x = left+ball._width/2;
    ball.vx *= -1*bounce;
  } 
  else if (ball._x>right-ball._width/2) {
    ball._x = right-ball._width/2;
    ball.vx *= -1*bounce;
  }
  ball._y += ball.vy;
  if (ball._y<top+ball._height/2) {
    ball._y = top+ball._height/2;
    ball.vy *= -1*bounce;
  } 
  else if (ball._y>bottom-ball._height/2) {
    ball._y = bottom-ball._height/2;
    ball.vy *= -1*bounce;

    if(ball.vx <= 0.5){
    }
  }


}


Point2D rotate(float x,float y, float sine,float cosine,Boolean reverse) {
  Point2D result = new Point2D(0,0);
  if (reverse) {
    result.x = x*cosine+y*sine;
    result.y = y*cosine-x*sine;
  } 
  else {
    result.x = x*cosine-y*sine;
    result.y = y*cosine+x*sine;
  }
  return result;
}

class Point2D{
  float x,y;
  Point2D(float x,float y){
    this.x = x;
    this.y = y; 
  }
}

class PointHis{
  float _x,_y,vx,vy;
  PointHis (float _x,float _y,float vx,float vy){
    this._x = _x;
    this._y = _y;
    this.vx = vx;
    this.vy = vy;
  }
}

class Ball{
  float _x,_y;
  float vx =0;
  float vy = 0;
  float _width,_height;
  float mass;

  color _rgb;

  float[] xh;
  float[] yh;
  float[] vxh;
  float[] vyh;

  Ball(float _x,float _y,float _width,float _height,color _rgb){
    this._x = _x;
    this._y = _y;
    this._width = _width;
    this._height = _height;
    this._rgb = _rgb;
    this.mass = _width;

    this.xh = new float [1000];
    this.yh = new float [1000];
    this.vxh = new float [1000];
    this.vyh = new float [1000];
  }

  void draw(){
    noStroke();
    fill(this._rgb);   
    ellipse(this._x, this._y, this._width, this._height);
  }
}


Boolean playTowards = true;
Boolean paused = false;

void mousePressed(){
  playTowards = !playTowards;
}

void keyPressed(){
  paused = !paused;
}















