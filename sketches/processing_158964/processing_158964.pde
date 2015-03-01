
//Raven Kwok (aka Guo Ruiwen)
//ravenkwok.com

Paddle paddle;
Particle [] ps = new Particle[120];

void setup() {
  size(1900, 6000, P2D);
  frameRate(20);
  smooth();
  colorMode(HSB);
  rectMode(CENTER);
  
  for (int i=0;i<ps.length;i++) {
    ps[i] = new Particle();
  }
  
  paddle = new Paddle(1000,5);
}
void draw() {
  background(255);
  
  for (int i=0;i<ps.length;i++) {
    ps[i].update(paddle);
    
    for (int j=i+1;j<ps.length;j++) {
      for (int k=j+1;k<ps.length;k++) {
        ps[i].displayTriangle(ps[j], ps[k]);
      }
      ps[i].displayConnection(ps[j]);
    }
    ps[i].displayParticle();
  }
  
  paddle.update();
  paddle.display();
}
class Paddle{
  
  PVector loc;
  float w, h;
  
  Paddle(float w,float h) {
    this.w = w;
    this.h = h;
    loc = new PVector(width/2,height/2);
  }
  
  void update() {
    loc.x = lerp(loc.x, mouseX, 0.3);
    loc.y = lerp(loc.y, mouseY, 0.3);
  }
  
  void display() {
    fill(200,255,255,0);
    noStroke();
    rect(loc.x, loc.y, w, h);
  }
}

class Particle {
  
  PVector loc, vel, acc;
  float thres, areaThres;
  float saturation;
  color c;
  
  Particle() {
    
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(0.5, 3), random(0.5, 2));
    acc = new PVector(random(-0.1, 0.1), random(0.1, 0.4));
    thres = 50;
    areaThres = 9000;
    c = color(random(360), 255, 255);
  }
  
  void update(Paddle pd) {
    vel.add(acc);
    vel.limit(5);
    loc.add(vel);
    collide(pd);
  }
  
  private void collide(Paddle pd){
    if (loc.x<0 || loc.x>width) vel.x = -vel.x;
    if (loc.y>height) reset();
    if (loc.y>=mouseY-pd.h/2 && loc.y<=mouseY+pd.h/2 && loc.x>=mouseX-pd.w/2 && loc.x<=mouseX+pd.w/2) {
      loc.y = mouseY-pd.h/2;
      vel.y *= -0.95;
      saturation = 255;
    }
  }
  
  void displayParticle() {
    strokeWeight(3);
    stroke(c, 200);
    point(loc.x, loc.y);
  }
  
  void displayConnection(Particle p) {
    float dst = dist(loc.x, loc.y, p.loc.x, p.loc.y);
    if (dst < thres) {
      float avgHue = (hue(c)+hue(p.c))*0.5;
      float alpha = (thres-dst)/thres*255;
      strokeWeight((thres-dst)*0.1);
      stroke(avgHue, saturation, 255, alpha);
      line(loc.x, loc.y, p.loc.x, p.loc.y);
    }
  }
  
  void displayTriangle(Particle p1, Particle p2) {
    float dst1 = dist(loc.x, loc.y, p1.loc.x, p1.loc.y);
    float dst2 = dist(loc.x, loc.y, p2.loc.x, p2.loc.y);
    float dst3 = dist(p1.loc.x, p1.loc.y, p2.loc.x, p2.loc.y);
    float sp = (dst1+dst2+dst3)*0.5; //Semi-perimeter
    float area = sqrt(sp*(sp-dst1)*(sp-dst2)*(sp-dst3)); //Heron's formula via wikipedia: http://en.wikipedia.org/wiki/Heron%27s_formula
    if (area < areaThres ) {
      noStroke();
      float avgHue = (hue(c)+hue(p1.c)+hue(p2.c))*0.33;
      fill(avgHue, saturation, 255, (1-area/areaThres)*255);
      triangle(loc.x, loc.y, p1.loc.x, p1.loc.y, p2.loc.x, p2.loc.y);
    }
  }
  
  private void reset() {
    loc.set(random(width), 0);
    saturation = 0;
  }
}


