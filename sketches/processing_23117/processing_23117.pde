
class Ball {
  
  float tX = 0.2;
  float tY = 0.0;
  float incrementX = 0.01;
  float incrementY = 0.01;
  float theta = 0.0;
  float aX,aY;
  float aXspeed,aYspeed;
  
  Ball (float _tX, float _tY, float _incrementX, float _incrementY, float _theta) {
    tX = _tX;
    tY = _tY;
    incrementX = _incrementX;
    incrementY = _incrementY;
    theta = _theta;
    aX=random(width);
    aY=random(height);
    aXspeed = random(-5,5);
    aYspeed = random(-5,5);
  }
  
  
  void circle(float x, float y, float rad, float r, float g, float b) {
   
   theta += 0.02;
  
   float osc = (sin(theta)+1)*25;  
   
    x = x + noise (tX)*width;
    y = y + noise (tY)*height;
    
    tX += incrementX;
    tY += incrementY;
    
    //stroke (r,g,b, osc+25);
    noStroke();
    fill (r,g,b, osc);
    ellipse (x, y, rad, rad);
  }
}

/*void move() {
    aX += aXspeed; // Increment x
    aY += aYspeed; // Increment y
    
    // Check horizontal edges
    if (aX > width || aX < 0) {
      aXspeed *= - 1;
    }
    //Check vertical edges
    if (aY > height || aY < 0) {
      aYspeed *= - 1;
    }
  }
  */

