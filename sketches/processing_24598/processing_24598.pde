
// Korea Univ. Inhee Kim

Ball[] b = new Ball[1000];
float x_size, y_size;
int cnt;

void setup() {
  size(500, 500);
  smooth();
}

void mousePressed() {
  x_size = random(40, 60);
  y_size = x_size;
  b[cnt++] = new Ball(mouseX, mouseY, x_size, y_size);
}

void draw() {
  background(255);

  for (int a=0; a<cnt; a++) {
    b[a].display();
  }
}

class Ball {
  float x, y, w, h;
  float speed;
  color c;
  
  Ball(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = 0;
    c = color(random(255), random(255), random(255));
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(this.x, this.y, this.w, this.h);

    if(this.y > height+10) {
      speed = 0;
    } else {
      speed = speed + 0.5;
    }
    this.y = this.y + speed;
    if(this.y > height-10) {
      speed = speed * -1;
    }
  }
}

