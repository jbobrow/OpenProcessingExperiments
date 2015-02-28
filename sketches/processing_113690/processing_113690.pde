
float w = 900;
float h = 500;
int num = 1500;
bubble[] b1 = new bubble[num];


void setup() {
  noStroke();
  size(900, 500);
  for (int i = 0; i < num; i++) {
    b1[i] = new bubble(random(w), random(h));
  }
}

void draw() {

  background(0);
  for (int i = 0; i < num; i++) {
    b1[i].drawBubble();
    for (int j = i+1; j < num; j++) {

      b1[i].collide(b1[j]);
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    for (int i = 0; i < num; i++) {
      b1[i].x += 10;
      b1[i].xspd++;
    }
  }
  if (keyCode == LEFT) {
    for (int i = 0; i < num; i++) {
      b1[i].x -= 10;
    }
  }
}

class bubble {
  float x;
  float y;
  float sz;
  float yspd = 1;
  float xspd = 0;

  bubble(float _x, float _y) {
    x = _x;
    y = _y;
    sz = 1;
  } 

  void drawBubble() {
    display();
    fill(random(255), random(255), random(255));
    move();
  }

  void move() {
    x+=xspd;
    y-= yspd;
    if (y<0) {
      y=height;
    }
    if (x>width){
     x = 0; 
    }
    if (x<0){
      x=width;
    }
  }

  void display() {
    ellipse(x, y, sz, sz);
  }
  
  void collide(bubble other) {
    if (dist(x, y, other.x, other.y) < sz*2) {
      other.yspd = -other.yspd;
      xspd = 1;
    }
  }
}


