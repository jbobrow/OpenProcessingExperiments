
int diam, x_speed, y_speed;
Ball[] balls = new Ball[17];

void setup(){
  size(600,600);
  for(i=0;i<17;i++){
    diam = random(60);
    x_speed = random(10);
    y_speed = random(10);
    balls[i] = new Ball(random(width),random(height),diam,x_speed,y_speed);
  }
}

void draw(){
  fill(255);
  rect(0,0,600,600);
  fill(0);
  for(i=0;i<17;i++){
    balls[i].move();
    balls[i].draw();
  }
}

class Ball{
  float x,y;
  int diam, x_speed, y_speed;
  
  Ball(float Class_X, float Class_Y, int Diam, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;
    diam = Diam;
    x_speed=X_Speed;
    y_speed=Y_Speed;
  }
  
  void draw(){
    ellipse(x,y,diam,diam);
  }
  
  void move(){
    if (x>width || x<0){
      x_speed = -x_speed;
    }
    if (y<0) {
      y_speed += 1;
    }
    if (y>height) {
      y_speed -=1;
    }
    x+=x_speed;
    y+=y_speed;
  }
}


