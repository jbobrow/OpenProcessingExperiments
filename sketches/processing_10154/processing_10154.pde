
class bal{
  float x, y;
  float kleurR, kleurG, kleurB;
  float xs, ys;
  
  public bal(float r, float g, float b) {
    x = width/2;
    y = random(1, 600);
    xs = 0;
    ys = 0;
    kleurR = r;
    kleurG = g;
    kleurB = b;
  }
  
  void run(){
    x += xs;
    y += ys;
    
    if (y >= 600) {
      x = width/2;
      y = 599;
      ys = random(-11, -5);
      xs = random(-1.4, 1.4);
    }
  }  
  
  void gravity(){
    ys += 0.1;
  }
  
  float getBallX() {
    return x;
  }
  
  float getBallY() {
    return y;
  }
  
  float getKleurR() {
    return kleurR;
  }
   float getKleurG() {
    return kleurG;
  }
   float getKleurB() {
    return kleurB;
  }
}

