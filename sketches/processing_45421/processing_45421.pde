
// Used for the splash

class Particle {
  PVector pos;
  PVector vel;
  
  float gravityX, gravityY;
  float radius = random(2, 5);

  int visible = 30;
  
  Particle() {
    pos = new PVector();
    vel = new PVector();
    gravityX = 0;
    gravityY = 0.05;
  }


  void setPos(int x, int y, float vx, float vy) {
    pos.x = x;
    pos.y = y;
    vel.x = vx;
    vel.y = vy;
  }

  void draw() {
    smooth();
    noStroke();
    fill(0, 0, 255, visible);
    ellipse(pos.x, pos.y, radius, radius);
  }

  boolean killWaterSplash() {
    if (visible == 0){
      return true;
    }
    else {
      return false;
    }
  }

  void update() {
    pos.add(vel);
    vel.x += gravityX;
    vel.y += gravityY;
    
    float gurd = (pos.y + vel.y);
    float gurd2 = (pos.x + vel.x);
    if (gurd >= 305) {
      visible = 0;
    }
    if (gurd2 <= 159){
      visible = 0;
    }

  }
}


