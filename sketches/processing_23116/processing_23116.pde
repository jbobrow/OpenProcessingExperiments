
class Ball {
  float osc;
  float x, y;
  float tX;
  float tY;
  float incrementX = 0.01;
  float incrementY = 0.01;
  float theta = 0.0;
  float aX, aY;
  float aXspeed;
  float aYspeed;
  float aXdir = 1;
  float aYdir = 1;

  
  Ball (float _tX, float _tY, float _incrementX, float _incrementY, float _theta) {
    tX = _tX;
    tY = _tY;
    incrementX = _incrementX;
    incrementY = _incrementY;
    theta = _theta;
  }
  
  
  void circle() {
   

    
    //stroke (r,g,b, osc+25);
    //noStroke();
    //fill (r,g,b, osc);
    //ellipse (x, y, rad, rad);
  }


  void move(float _aX, float _aY, float _aXspeed, float _aYspeed) {
    aX = _aX;
    aY = _aY;
    aXspeed = _aXspeed;
    aYspeed = _aYspeed;
  
    aX += aXspeed * aXdir;
    aY += aYspeed * aYdir;
  
    if (aX > width || aX < 0) {
      aXdir *= - 1;
    }
  
    if (aY > height || aY < 0) {
      aYdir *= - 1;
    }
  }
  
  void display(float rad, float r, float g, float b) {
    
    theta += 0.02;   
   
    x = noise (tX)*width;
    y = noise (tY)*height;
    
    tX += incrementX;
    tY += incrementY;
    
    noStroke();
    osc = (sin(theta)+1)*25;
    fill (r,g,b, osc);
    ellipse (x, y, rad, rad);
  }
}


