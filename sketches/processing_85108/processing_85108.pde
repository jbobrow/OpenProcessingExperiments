
Can can;
ArrayList<Perticle> perticles;
 
float splashX, splashY;
PImage img1;
 
void setup() {
  size(500, 500);
  img1 = loadImage("image3-remix.jpg");

  // smooth();
 
  can = new Can();
  perticles = new ArrayList<Perticle>();
 
  splashX = width / 2;
  splashY = 2*height / 3;
}
 
void draw() {
  // println(frameRate);
 
  image(img1,0,0);
  rect(0, 0, width, height);
 
  // if (mousePressed) {
  //   splash();
  // }
  splash();
 
  can.update();
  can.draw();
 
  for (Perticle p : perticles) {
 
    p.update();
    p.draw();
  }
 
  for (int i = 0; i < perticles.size(); i++) {
    if (perticles.get(i).isOutOfScreen()) {
      perticles.remove(i);
    }
  }
}
 
void splash() {
  int n = (int)random(4, 16);
 
  for (int i = 0; i < n; i++) {
    int s = (int)random(8, 24);
    float vx = (splashX - mouseX) / 10;
    float vy = (splashY - mouseY) / 10;
 
    vx -= random(-50, 50) / 50;
    vy -= random(-50, 50) / 50;
 
    // if (perticles.size() < 256) {
    //   perticles.add(new Perticle(width/2, 2*height/3, s, s, vx, vy));
    // }
    perticles.add(new Perticle(width/2, 2*height/3, s, s, vx, vy));
  }
}
class Can {
 
  int remain;
  int power;
 
 
  Can() {
    init();   
  }
 
  void init() {
    remain = 255;
    power = 0;
  }
 
  void shake() {
    if ((power+=3) > 256) {
      power = 256;
    }
  }
 
  void update() {
    if (keyPressed) {
      shake();
    } else if (--power < 0) {
      power = 0;
    }
  }
 
  void draw() {
    // println(power);
  }
}
class Perticle {
 
  private float x, y;
  private float w, h;
  private float vx, vy;
  private boolean outOfScreen;
 
 
  Perticle(float x, float y, float w, float h, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vx = vx;
    this.vy = vy;
  }
 
  boolean isOutOfScreen() {
    return outOfScreen;
  }
 
  void update() {
    x += vx;
    y += vy;   
    vy += 0.5;
 
    if (0 > x || x >= width || y >= height) {
      outOfScreen = true;
    }
  }
 
  void draw() {
    noStroke();
    fill(255, 255, 255, 15);
    ellipse(x, y, w, h);
  }
}


