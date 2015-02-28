
Ball ball;

void setup(){
  background(255);
  size(320, 240);
  smooth();
  
  ball = new Ball(width/2, 0);

}

void draw(){
  noStroke();
  fill(255);
  rect(0, 0, width, height);
    
  ball.fall();
  
}



class Ball{
  
  
  
  float x, y;
  float gravity = 0.2;
  float vel_x;
  float vel_y = 0;
  float eee = 0.6;
  
  Ball(float xpos, float ypos ){
    x = xpos;
    y = ypos;
    vel_x = 0;
    
  }
  
  void update(){
    x += vel_x;
    y += vel_y;
    vel_y += gravity;
    
    if(y >= height - 2){
      
      if(vel_y > 0){
        vel_y *= -eee;
      }
      
    }
  }
  
  void fall(){
    update();
    
    noStroke();
    fill(0, 200, 0);
    ellipse(x, y, 20, 20);    
    
  }
    
}
