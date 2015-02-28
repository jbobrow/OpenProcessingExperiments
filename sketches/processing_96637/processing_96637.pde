
Butterfly[] chou  = new Butterfly[300];

void setup() {
  size(250,250);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  
  for(int i = 0 ; i < chou.length;i++){
    chou[i] = new Butterfly();
  }
  
  noStroke();
}

void draw() {
  //background(360);
  fill(360,100);
  rect(0,0,width,height);
  
  for(int i = 0 ; i < chou.length;i++){
    chou[i].move();
    chou[i].display();
  }
}
class Butterfly {
  float x = random(width);
  float y = random(height);
  int w;
  float h;
  float t;
  float hue = random(360);
  float alp = random(10,255);

  Butterfly() {
    w = 1;
    h = random(5, 20);
    t = random(TWO_PI);
  }

  void move() {
    x += random(-0.5, 0.5)*3;//1.5;
    y += random(-0.5, 0.5)*2;

    if (x < 0) {
      x = 0;
    }
    if (y < 0) {
      y = 0;
    }
    if (x > width) {
      x = width;
    }
    if (y > height) {
      y = height;
    }
  }

  void display() {
    fill(hue, 50, 100, alp);
    for (int i = 0; i < 2; i++) {
      pushMatrix();
      translate(x, y);
      if (i == 0) {
        rotate(t);
      }
      else {
        rotate(-t);
      }
      rect(0, 0, w, h);
      popMatrix();
    }
    t += 0.1;
  }
}



