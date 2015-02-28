
Balls[] ball = new Balls[100];

void setup() {
  size(500,500);
  smooth();
  
  for (int i=0; i<ball.length; i++){
    ball[i] = new Balls(random(width), random(height));
  }
  
}

void draw() {
   background(#82DFF7);
   
   for (int i=0; i<ball.length; i++){
     ball[i].update();
     ball[i].display();
     ball[i].move();
   }
}

class Balls {

  float ball_x; 
  float ball_y;   
  float speed = 0;
  float gravity = 0.1; 
  
  Balls(float x, float y){
    ball_x = x;
    ball_y = y;
  }
    
 
  void update() {
    ball_y += speed;
    speed += gravity;

 
}
 
void display() {
  fill(255,100);
  noStroke();
  ellipse(ball_x,ball_y,20,20);
  }
   

void move(){
   
 
if (ball_y > height) {
  speed = speed * -0.95; 
  }
}
}

    
