
class Ball {
  
  float x;
  float y;
  
  float xspeed;
  float yspeed = 1;
  
  float xaccel;
  float yaccel = 0.5;
  
  color col = 0;
  
  Ball() {
    
  };
  
void update() {
  
  xspeed += xaccel;
  yspeed += yaccel;
  
  x += xspeed;
  y += yspeed;
  
  if (y > height) {
    yspeed = -yspeed;
    };
  if (y < 0) {
    yspeed = -yspeed;
    };
    
  if (x > width) {
    xspeed = -xspeed;
    };
  if (x < 0) {
    xspeed = -xspeed;
    };
};


void draw() {
  fill(col);
  ellipse(x, y, 20, 20);
  };
};

