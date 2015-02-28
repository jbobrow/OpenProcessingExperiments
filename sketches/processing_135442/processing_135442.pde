
Bubble b;
Bubble b2;

void setup(){
  size(300, 800);
  smooth();
  colorMode(HSB, 360,100,100);
  
  b = new Bubble();
  b2 = new Bubble();
}

void draw(){
  background(50);

  b.run();  
  b2.run();
}
class Bubble {
  float x, y, xoff; //position
  float r; //radius
  float h; //hue
  float speed;

  Bubble() {
    init();
  }

  void init() {
    r = random(10, 50);
    x = random(width);
    y = height+r; 
    h = random(360);
    speed = map(r, 10, 50, 8, 2);
  }

  void floatUp() {
    y -= speed;
    xoff = sin(frameCount/r) * r/3.0;
  }
  void wrap() {
    if (y <= -r) {
      init();
    }
  }
  
  void render() {
    fill(h, 90, 90);
    noStroke();
    ellipse(x+xoff, y, r*2, r*2);
  }
  void run() {
    floatUp();
    wrap();
    render();
  }
}



