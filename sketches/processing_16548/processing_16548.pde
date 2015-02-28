

Ball ball;

float xoff = 0.0;
int r = 155;
int r_back = 1;
int g = 123;
int g_back = 1;
void setup(){
  size(400,400);
  ball = new Ball();
  smooth();
  background(255);
}

void draw(){
  stroke(0,r,g,30);
  ball.update();
  ball.draw();
  if(r > 100 || r < 0){
   r_back  = -r_back;
  }
  if(g > 122 || g < 0){
   g_back  = -g_back;
  }
  g += g_back;
  r += r_back;
}

class Ball {
  float speedX;
  float speedY;
  float x = 0;
  float y = 397;
  float x1;
  float y1;
  float a = 0;
  float b = height/2;
  Ball(){
    speedY = 20;   
    speedX = 40; 
  }
  void update(){
    x+= speedX  / frameRate;
    if(x > width || x < 0){
      x = constrain(x,0,width);
      speedX = -speedX;
    }
    y+= speedY / frameRate;
    if(y > height || y < 0){
      speedY = -speedY;
    }
  }
  void draw(){
    xoff = xoff + 0.005;
    float n = noise(xoff) * 1.3;
    line(x/1.5,200,x * n,y );    
 }
}

