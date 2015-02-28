
Bounce[] jumper = new Bounce[500];

void setup(){
  size(500,500);
  smooth();
  
  for (int i =0; i<jumper.length; i++){
    jumper[i] = new Bounce(random(width), random(height));
  }
}

void draw(){
  background(#04DEB4);
  
  for (int i=0; i<jumper.length; i++){
    jumper[i].update();
    jumper[i].display();
    jumper[i].move();
  }
  

}

class Bounce {
  float ball_x;
  float ball_y;
  float x_speed = 5;
  float y_speed = 7;

  
  Bounce(float x, float y){
    ball_x = x;
    ball_y = y;


  }

  void update(){
    ball_x += x_speed;
    ball_y += y_speed;
  }
    
  void display(){
    fill(255,80);
    noStroke();
    ellipse(ball_x, ball_y, 30, 30);
    }
  
  
  void move(){
    
    if (ball_x > width -15) {
      x_speed = x_speed * -1;
      ball_x = width-15;
      x_speed = x_speed + random(-0.8, 0.8);
      
      }
    if (ball_x < 15 ) {
      x_speed = x_speed * -1;
      ball_x = 15;
      x_speed = x_speed + random(-0.8, 0.8);

    }
    
    if (ball_y > height -15) {
      y_speed = y_speed * -1;
      ball_y = height-15;
      y_speed = y_speed + random(-0.8, 0.8);

      }
    if (ball_y < 15) {
      y_speed = y_speed * -1;
      ball_y=15;
      y_speed = y_speed + random(-0.8, 0.8);

    }
  }
}
