
Bubble[] bubs;
Paddle paddle;

void setup() {
  size(300, 800);
  smooth();
  colorMode(HSB, 360, 100, 100);

  bubs = new Bubble[100];
  paddle = new Paddle();
  for (int i=0; i<bubs.length; i++) {
    bubs[i] = new Bubble();
  }
}

void draw() {
  background(0);  

  paddle.run();

  for (int i=0; i<bubs.length; i++) {
    bubs[i].run();
    boolean touch = rectCircleIntersect(paddle.x, paddle.y, paddle.w, paddle.h, 
              bubs[i].x, bubs[i].y, bubs[i].r);
    if(touch && bubs[i].speed > 0){
       bubs[i].speed *= -1; 
    }
  }
}


boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
  rx = rx - (rw/2);
  ry = ry - (rh/2);
  
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);

  if (circleDistanceX > (rw/2 + cr)) { 
    return false;
  }
  if (circleDistanceY > (rh/2 + cr)) { 
    return false;
  }
  if (circleDistanceX <= rw/2) { 
    return true;
  }
  if (circleDistanceY <= rh/2) { 
    return true;
  }

  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
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
    r = random(10, 20);
    x = random(width);
    y = height+ random(r, 100); 
    h = random(360);
    speed = map(r, 10, 20, 10, 1);
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

class Paddle {
  float x, y;
  float w, h;

  Paddle() {
    x = -1000;
    y = -1000;
    w = 100;
    h = 25;
  } 
  void run() {
    x = mouseX;
    y = mouseY;

    fill(255);
    rect(x-w/2, y-h/2, w, h);
  }
}



