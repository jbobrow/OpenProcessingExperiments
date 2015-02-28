
boolean pressed;
int count;
Snake[] snakes = new Snake[50];

void setup() {
  size(825, 490);
  background(200, 100, 0);
  noStroke();
  smooth();
  text("created by ChristianGeick 2011",825-250,490-50);
  
  count = 1;
  pressed = false;

  for (int i=0; i<snakes.length; i++) {
    snakes[i] = new Snake(random(825), random(490));
  }
}

void draw() {
  if(mousePressed) {
    pressed = true;
    background(0);
  }
  
  if(pressed) {
    if(frameCount%5 == 0) {
      fill(0,25);
      rect(0,0,825, 490);
    }
    
    if(frameCount%100 == 0 && count < snakes.length) {
      count++;
    }
    for (int i=0; i<count; i++) {
      snakes[i].crawl();
    }
  }
}

class Snake {
  
  float x, y, e, t, c1, c2, c3, s;
  
  Snake(float x, float y) {
    this.x = x;
    this.y = y;
    c1 = random(255);
    c2 = random(255);
    c3 = random(255);
    s = random(15);
  }
  
  void crawl() {
    x += random(12)-6;
    y += random(12)-6;
    e = s +random(10)+5;
    t = random(50)+200;

    fill(c1, c2, c3,t);
    ellipse(x, y, e, e);
  }
  
}

