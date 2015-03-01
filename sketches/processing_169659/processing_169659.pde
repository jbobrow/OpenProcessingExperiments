
ArrayList<Ball> balls = new ArrayList<Ball>();

void setup(){
  size(640, 480);
  background(0);
}

void draw(){
  background(0);
  
  for(int i=0; i<10; ++i){
    balls.add(new Ball(mouseX, mouseY));
  }
  
  for(Ball b : balls){
    b.draw();
  }
  
  for(int i=0; i<balls.size(); ++i){
    if(balls.get(i).isDead()){
      balls.remove(i);
      --i;
    }
  }
}

void mouseReleased(){
  balls.add(new Ball(mouseX, mouseY));
}

class Ball{
  float x, y;
  float vx, vy;
  float v;
  float angle;
  float alpha = 255;
  
  Ball(float _x, float _y){
    x = _x;
    y = _y;
    angle = random(0, TWO_PI);
    v = random(0, 5);
    vx = v * cos(angle);
    vy = v * sin(angle);
  }
  
  boolean isDead(){
    return alpha <= 0;
  }
  
  void draw(){
    x += vx;
    y += vy;
    alpha -= 5;
    fill(255, 0, 0, alpha);
    triangle(x, y-10, x+10, y+5, x-10, y+5);
  }
}
