
public class Ball {
  
  float x;
  float y;
  
  float ballSize = 0;
  float ballMax = 5;
  float growSpeed = 0.01;
  
  
  float xspeed = 0;
  float yspeed = 0;
  float xaccel = 0;
  float yaccel = 1;
  
  Ball(float xp, float yp) {
    x = xp;
    y = yp;
    registerDraw(this);
    };
    
    void update() {
      
      xspeed += xaccel;
      yspeed += yaccel;
      
      x += xspeed;
      y += yspeed;
      
      //DEFINE THE Y AXIS FALL RATE
      if (y > height) {
        yspeed = -yspeed;
        };
      if (y < 0) {
        yspeed = - yspeed;
        };
      
      //DEFINE THE X AXIS FALL RATE
      if (x > width) {
        xspeed = -xspeed;
        };
      if (x < 0) {
        xspeed = -xspeed;
        };
      };
    
void draw() {
  
  if (ballSize < ballMax) {                        //If ball is less than max size GROW
    ballSize += growSpeed;
    }
    
  else {
    y += (ballSize * random(0.01,1));             //If ball is at Max size fall off the screen!
  };
  
  fill(255,255,255,90);
  image(ball, x, y, ballSize, ballSize);
  };
};

