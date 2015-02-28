
int pMax = 200;  
ArrayList<Particle> particles = new ArrayList<Particle>();
float h = 0;
float s = 255;
float b = 128;
PImage img;
 
void setup() {
  size(450, 450);
  smooth ();
  frameRate(30);
  tint(200);
  img = loadImage("apple.png");
}
 
void draw() {
  background(240);
  image(img, 0, 0, 450, 450);
  colorMode(HSB);
  h = (h+random(3,10))%255;
  color c = color(h,s,b);
  particles.add(new Particle(c));
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.redraw();
    if (particles.size() > pMax) {
      particles.remove(0);
    }
  }
}
 
 

class Particle {
  float x; 
  float y;
  float moveX;
  float moveY;
  float gravity = 0.1;
  float resistance = 0.98;
  int initSpeed = 7;
  color c;
  int alpha = 200;
  int count = 0;
  Particle(color c) {  
    this.c = c;
    moveX = random(-initSpeed, initSpeed); 
    moveY = random(-initSpeed, initSpeed);
    x = mouseX+moveX; 
    y = mouseY+moveY;
  }
 
  void redraw() {
    if (x > width || x < 0) {
      moveX = -moveX;
    }
    if (y > height || y < 0) {
      moveY = -moveY;
    }
    moveX = moveX*resistance;
    moveY = moveY*resistance+gravity;
    if (dist(mouseX, mouseY, x, y)<30 && count > 4) {
      moveX = (x-mouseX)/3;
      moveY = (y-mouseY)/2;
      count = 0;
    }
    x = x + moveX;
    y = y + moveY;
    drawParticle();
    count++;
  }
 
  void drawParticle() {
    alpha--;
    fill (hue(c), saturation(c), brightness(c), alpha);
    strokeWeight(3);
    stroke(hue(c), saturation(c), brightness(c), alpha+100);
    ellipse (x, y, 30, 30);
  }
}



