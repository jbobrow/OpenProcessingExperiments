
//class snowball
class Snowball {
  float x, y, vx, vy, ay;

  Snowball(float tx, float ty) {
    x = tx; //x position   
    y = ty; //y position   
    vx = 0.0;  
    vy = 0.0;  
    ay=0.02;  
  }

  void step() {
    x = x + vx;        
    y = y + vy;
    vy = vy + ay;
//let the snowballs stop on the ground
    if (y >= height) {  
      y = height;
    }
  }
//draw the snow balls
  void draw() {
    noStroke();
    fill(200);
    ellipse(x, y, 20, 20);
  }
}


