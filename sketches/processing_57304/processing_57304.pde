

class Bubble {
  
  float x, y=500, r, vx, vy, forBounce;
  color c;
  boolean canHurt = true;

 
  
  Bubble() {
    if(waveNum < 5)
      r = 1+random(2);
    
  }
  void resetVars() {
    r += random(1+3*meR*waveNum/100) + meR*waveNum/75+waveNum/20;
    x = r + random(width+1-2*r);
    y = -2*r;
    vx = 0;
    vy = (float)(Math.random()*7);
    c = color(colorBank[(int)random(colorBank.length)],190);
    forBounce = sqrt(vx*vx + vy*vy);
    canHurt = true;
  }
  void moveMe() {
    y += vy-grav/2;
    vy += grav;
    x+=vx;
    if (y > height+2*r && ((int)random(20)) == 0)
      resetVars();
  }
  void drawMe() {
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
}



