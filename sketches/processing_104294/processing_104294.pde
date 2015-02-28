
ball[] balls = new ball[0];

void setup(){
 size(600,600);
 frameRate(30);
}


void draw(){
  background(0);
  if (mousePressed){
    ball b = new ball(mouseX,mouseY);
    balls = (ball[]) append(balls, b);
  }
  for (int i = 0; i < balls.length; i++){
    balls[i].show();
    if (keyPressed){
      balls = (ball[]) shorten(balls);
    }
  }
}

class ball{
  float x;
  float y;
  float x_;
  float y_;
  float speed;
  int size;
  color c;
  float r; 
  float theta;
  
  ball(float tempX, float tempY){
    x = tempX;
    y = tempY;
    speed = 0.2;
    size = 30;
    r = 75;
    theta = 0;
    c = color(random(255),random(255),random(255));
  }
  
  void show(){
    fill(c);
    noStroke();
    x_ = r * cos(theta);
    y_ = r * sin(theta);
    ellipse(x_+x,y_+y,size,size);
    theta +=0.1;
  }
}


