
Walker w;
boolean sketchFullScreen() {
  return true;
}

void setup() {
    size(640, 640);
    w = new Walker();
    background(#000000);
    frameRate(120);
    smooth();
    colorMode(HSB, 100);
}

class Walker {
    float pos_x;
    float pos_y;
    float x;
    float y;
    float dx;
    float dy;
    float size;
    float choice;
    float easing;
    float ppf;
    float r;
    float theta;
  Walker() {
    x = width - (width/2);
    y = height - (height/2);
    dx = width - (width/2);
    dy = height - (height/2);
    size = width / 50;
    ppf = size + 5;
    choice = floor(random(4));
    easing = 0.05;
    r = 100;
    theta = 0.5;
  }
  void display() {
      noStroke();
      fill(this.x / (width / 100), 100, 100, 10);
      ellipse(this.x, this.y, this.size, this.size);
      fill(this.dx / (width / 100), 100, 100, 10);
      ellipse(this.dx, this.dy, this.size, this.size);
  }
  void walk() {
      this.choice = floor(random(4));
      if (choice == 0 || this.x < 0) {
          this.x+=ppf;
          this.dx-=ppf;
      } else if (choice == 1 || this.dx < 0 || this.x > width) {
          this.x-=ppf;
          this.dx+=ppf;
      } else if (choice == 2 || this.y < 0) {
          this.y+=ppf;
          this.dy-=ppf;
      } else if (choice > 2 || this.dy > height || this.y > height) {
          this.y-=ppf;
          this.dy+=ppf;
      }
  }
}

void draw() {
    w.walk();
    w.display();
};
