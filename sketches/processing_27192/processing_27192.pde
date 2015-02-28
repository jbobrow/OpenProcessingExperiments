
PImage bg;
int n = 5;

Heartbeat[] heartbeat = new Heartbeat[n];

void setup() {
  size(960,450);
  bg = loadImage("bg.png");

  for (int i=0; i < heartbeat.length; i++) {
    heartbeat[i] = new Heartbeat((i*(width/heartbeat.length)),height/2);
  }
}


void draw() {
  background(0);
  smooth();
  frameRate(30);

  for (int i=0; i < heartbeat.length; i++) {
    heartbeat[i].render();
  }
  image(bg,0,0);
}

class Heartbeat {
 
 //BASE LINE
  float by;
  float bx;
  //SPACER
  float x = (width/heartbeat.length)/9;
  float y;
  
  Heartbeat(float bx, float by) {
    this.x = x;
    this.y = y;
    this.by = by;
    this.bx = bx;
  }
  
  void render() {
    smooth();
    color from = color(15,200,215);
    color to = color(200,0,0);
    float amt = norm(mouseX,0,width);
    stroke(lerpColor(from, to, amt));
    strokeWeight(2);
    
    line(bx, by, bx+ 5*x, by);
    line(bx+ 5*x, by, bx + 5.5*x, by - y/8);
    line(bx + 5.5*x, by - y/8, bx + 6*x, by);
    line(bx + 6*x, by, bx + 6.25*x, by);
    line(bx + 6.25*x, by, bx + 6.5*x, by + y/10);
    line(bx + 6.5*x, by + y/10, bx + 7*x, by - y);
    line(bx + 7*x, by - y, bx + 7.2*x, by + 0.8*y);
    line(bx + 7.2*x, by + 0.8*y, bx + 7.35*x, by);
    line(bx + 7.35*x, by, bx + 8*x , by);
    line(bx+ 8*x, by, bx + 8.5*x, by - y/8);
    line(bx + 8.5*x, by - y/8, bx + 9*x, by);
    
    float my = (mouseX/10);
    y = 100 + 1*my;
    
    if (mouseX > 950) {y=0;}
    
    float speed = 3 + (mouseX / 192);
    bx += speed;
    if (bx > width) {
      bx=0;
    }
  }
}

