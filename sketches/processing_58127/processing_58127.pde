
class Particle {
  float x,y;
  float vx = 0, vy = 0;
  float s = 10;
  int age = 0;
  int maxAge = (int) random(100,600);
  boolean alive = true;
  float col = random(20,40) + mainHue;
  float relAge = 0;
  float speedSq = 0;
  
  Particle(float xx, float yy) {
    x = xx;
    y = yy;
  }
  
  Particle(float xx, float yy, float vxx, float vyy) {
    x = xx;
    y = yy;
    vx = vxx;
    vy = vyy;
  }
  
  void update() {
    x += vx;
    y += vy;
    vx *= damping;
    vy *= damping;
    age++;
    relAge = ((float)age)/maxAge;
    speedSq = vx*vx + vy*vy;
    s = 10 * (1 - (relAge))*(1 - (relAge))*(1 - (relAge))+0.5;
    if (age > maxAge)
      alive = false;
  }
  
  void draw() {
    //fill(col,1-(10-s)*0.05,(10-s)/10+0.8);
    fill((int)(col + speedSq*10*relAge)%360,
              1 - relAge*0.3,
              speedSq*relAge*2+0.2,
              speedSq*relAge*255 + 255*relAge);
    ellipse(x,y,s,s);
  }
}

