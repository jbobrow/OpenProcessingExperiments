
Sakura[] sakura = new Sakura[20];

void setup() {
  size(800,400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0; i < sakura.length;i++) {
    sakura[i] = new Sakura();
  }

  noStroke();
}

void draw() {
  background(360);
  for (int i = 0; i < sakura.length;i++) {
    sakura[i].move();
    sakura[i].display();
  }
}

class Sakura {
  float s ;
  float inner_s;
  float ch;
  int cs;
  int cv;

  float x;
  float y;
  float spd;

  float color_theta;

  float t;

  float flg;

  Sakura() {
    s = random(0.3, 1);
    ch = random(360);

    x = random(width);
    y = random(height);

    spd = 2 - s;
    flg = random(1);
    
    color_theta = random(360);
  }

  void display() {


    pushMatrix();
    translate(x, y);
    rotate(radians(t));
    for (int j = 0 ; j < 3;j++) {
      if (j == 0) {
        inner_s = 1.2 * s;
        cs = 80;
        cv = 80;
      }
      else if (j == 1) {
        inner_s = 1 * s;
        cs = 50;
        cv = 100;
      }
      else {
        inner_s = 0.5 * s;
        cs = 20;
        cv = 100;
      }
      for (int i = 0; i < 5;i++) {
        pushMatrix();
        //translate(x, y);
        rotate(radians(360 * i / 5));
        fill(ch, cs, cv);
        heart(0, -30*inner_s, 45*inner_s, 75*inner_s);
        popMatrix();
      }
    }
    popMatrix();
  }

  void move() {
    y += spd;
    color_theta += spd;

    if (flg >= 0.5) {
      t += spd;
    }
    else {
      t -= spd;
    }

    if (y > height + 75*s) {
      y = -75*s;
      x = random(width);
      ch = random(360);
    }
  }

  //お借りしました
  //Proce55ing.walker,blog Processingで五角形・六角形・ハート形を描く 
  //http://blog.p5info.com/?p=28
  void heart(float centerX, float centerY, float width, float height) {
    final float WIDTH = width / 2 * 0.85;
    final float HEIGHT = height / 2;
    final float OFFSET = centerY - (HEIGHT / 6 * 5);
    beginShape();
    for (int i = 0; i < 30; i++) {
      float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
      float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
      vertex(tx, ty);
    }
    endShape(CLOSE);
  }
}


