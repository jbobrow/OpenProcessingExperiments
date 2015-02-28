
Spot[] sp = new Spot[10];
PImage bubble, bubble2;


void setup() {
  size(800, 600);
  frameRate(60);
  imageMode(CENTER);
  bubble = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/bubble.png"); //100x100pxの画像を読み込む
  bubble2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/bubble2.png"); 
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(0.05, 0.2), random(0.1, 0.2));
  }
}

void draw() {
 fill(0, 0, minute()*2*(sin(frameCount*PI/3600)+1));
 rect(0, 0, width, height);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }


  for (int i = 0; i < 1; i++) {
    fill(random(0, 20), random(80, 100), 255, 10);
    noStroke();
    ellipse(random(width), random(110), random(10, 30), random(10, 30));
    ellipse(random(width), random(590, 600), 20, 30);
  }
}

class Spot {
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ

  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }

  void move() {
    speed *= 1.001;
    y -= speed;
    if (y < - bubble.width*diameter/2) {
      x = random(width);
      y = height + bubble2.width*diameter/2;
      speed = random(0.05, 2);
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI*diameter);
    scale(diameter);
    tint(255, 255, 255, 125);
    image(bubble, width, height);
    image(bubble2, 0, 0);
    popMatrix();

    fill(0);
    noStroke();
    rect(0, 0, width, 100);
  }
}

Spot[] sp = new Spot[10];
PImage bubble, bubble2;


void setup() {
  size(800, 600);
  frameRate(60);
  imageMode(CENTER);
  bubble = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/bubble.png"); //100x100pxの画像を読み込む
  bubble2 = loadImage("https://7172388642956852363-a-go-jindai-ac-jp-s-sites.googlegroups.com/a/go.jindai.ac.jp/mathateken/uploads/bubble2.png"); 
  for (int i = 0; i < sp.length; i++) {
    sp[i] = new Spot(random(width), random(height), random(0.05, 0.2), random(0.1, 0.2));
  }
}

void draw() {
 fill(0, 0, minute()*2*(sin(frameCount*PI/3600)+1));
 rect(0, 0, width, height);
  for (int i = 0; i < sp.length; i++) {
    sp[i].move();
    sp[i].display();
  }


  for (int i = 0; i < 1; i++) {
    fill(random(0, 20), random(80, 100), 255, 10);
    noStroke();
    ellipse(random(width), random(110), random(10, 30), random(10, 30));
    ellipse(random(width), random(590, 600), 20, 30);
  }
}

class Spot {
  float x, y, diameter, speed; // x座標, y座標, 直径, 速さ

  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }

  void move() {
    speed *= 1.001;
    y -= speed;
    if (y < - bubble.width*diameter/2) {
      x = random(width);
      y = height + bubble2.width*diameter/2;
      speed = random(0.05, 2);
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(TWO_PI*diameter);
    scale(diameter);
    tint(255, 255, 255, 125);
    image(bubble, width, height);
    image(bubble2, 0, 0);
    popMatrix();

    fill(0);
    noStroke();
    rect(0, 0, width, 100);
  }
}
                
