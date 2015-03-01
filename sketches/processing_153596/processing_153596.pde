
Walker[] walker = new Walker[20];

color c;
boolean flg = true;

void setup() {
  size(400, 400);
  frameRate(1000);
  colorMode(HSB, 360, 100, 100);
  background(0);
  //noLoop();
  float st_c = random(360-130);

  for (int i = 0; i < walker.length; i++) {
    if (i == walker.length-1 || i == walker.length-2 || i == walker.length-3) {
      c = color(360, 5);
    } else {
      c = color(random(st_c, st_c+130), 80, 100, 10);
    }
    walker[i] = new Walker(width/2, height/2, c, random(5, 8));// 360*i/walker.length);
    walker[i].draw();
  }
}

void draw() {
  if (flg == true) {
    for (int p = 0; p < 800; p++) {
      float st = random(10, 200);
      stroke(st);
      strokeWeight(random(2));//(st/200);
      point(random(width), random(height));
    }

    for (int j = 0; j < 5000; j++) {
      for (int i = 0; i < walker.length; i++) {
        walker[i].walk();
        walker[i].draw();
      }
    }
  }
  flg = false;
}

void mousePressed() {
  float st_c = random(360-130);

  for (int i = 0; i < walker.length; i++) {
    if (i == walker.length-1 || i == walker.length-2 || i == walker.length-3) {
      c = color(360, 5);
    } else {
      c = color(random(st_c, st_c+130), 80, 100, 10);
    }
    walker[i] = new Walker(width/2, height/2, c, random(5, 8));// 360*i/walker.length);
    walker[i].draw();
  }
  background(0);
  flg = true;

  redraw();
}

class Walker {
  float x, y;
  float t;
  float hue;
  float rect_w = 1;
  float rect_h = 5;
  color c;

  Walker(float x, float y, color tmpC, float h) {
    this.x = x;
    this.y = y;
    this.hue = hue;
    rect_h = h;
    c = tmpC;
    t = random(TWO_PI);
  }

  void walk() {
    this.x += random(-1, 1)*2;
    this.y += random(-1, 1)*2;

    if (this.x < 0) {
      this.x = 0;  //width;
    }
    if (this.y < 0) {
      this.y = 0;  //height;
    }
    if (this.x > width) {
      this.x = width;  //0;
    }
    if (this.y > height) {
      this.y = height;  //0;
    }
  }

  void draw() {
    pushMatrix();
    translate(x, y);
    rotate(t);
    noFill();
    stroke(c);//(hue, 80, 100, 10); 
    strokeWeight(1);
    rect(0, 0, rect_w, rect_h);
    popMatrix();

    t += 0.5;
  }
}

