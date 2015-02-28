
ArrayList balls;    
float t = 0;
int f = 0;
 
void setup() {  
  size(400,400,P2D);
  fill(255,0,0);
  noStroke();
  smooth();
  colorMode(RGB);
  frameRate(60);  
  balls = new ArrayList();
}

void draw(){
  t = t + .02;
  fill(255);
  rect(0, 0, width, height);
  drawBalls();
}
 
void drawBalls(){
  int maxBalls = 6;
  float factor;
  while (balls.size() < maxBalls) {
    factor = random(0,3); 
    println(factor);
    balls.add(new Ball(random(0, width), random(0, height), factor));
  }
     
  for (int i = balls.size() - 1; i >= 0; i--) {
    Ball ball = (Ball) balls.get(i);
    ball.update(t);   
    ball.display(f);
  }  
}

class Ball {
  float x, y;
  float step;
  float step2;
  float factor;
  
  Ball(float x, float y, float f) {
    this.x = x;
    this.y = y; 
    this.factor = f;   
    this.step = random(1.0, 2.0);
    this.step2 = random(2.0, 2.5);
  }
  
  void update(float t) {
    if (this.factor <= 1){
    this.x = sin(step2*t) * 120 + width/2;
    this.y = cos(step*t) * 120 + height/2;
    } else if (this.factor <= 2){
    this.x = sin(step*t) * 120 + width/2;
    this.y = cos(step2*t) * 120 + height/2;
   } else if (this.factor <= 3){
    this.x = sin(step*t) * (110 + sin(.01*t) * 110) + width/2;
    this.y = cos(step*t) * (110 + sin(.01*t) * 110) + height/2;
    }
  }

  void display(float f) {
    fill(f);    
    ellipse(this.x, this.y, 40, 40);
  } 
}
