
int numballs = 42;
Ball balls[] = new Ball[numballs];
float theta = 0;



void setup() {
  size(500, 500);
  colorMode(HSB);
  background(0, 0, 0);
  for (int i = 0; i < numballs; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  fill(0,0,0,60);
  rect(0,0,width,height);
//  background(0, 0, 0);

  for (int i = 0; i < numballs; i++) {
    balls[i].run();
  }

  theta++;
}

class Ball {
  float x, xc, xs;
  float y, yc, ys;
  float ch, cs, cb;
  float diam = 5;
  float rad = diam/2;
  int range = 20;

  //constructor
  Ball() {
    //    x = random(diam, width-diam);
    //    y = random(diam, height-diam);
    x = width/2 + random(-range, range);
    y = height/2 + random(-range, range);
    ch = random(16, 50);
    cs = random(200, 255);
    cb = random(200, 255);
    xs = random(1, 3);
    ys = random(1, 3);
    xc = 1.5;
    yc = 1.5;
  }

  void run() {
    display();
    move();
  }

  void move() {
    x = x + xc * ((random(2) + xs * sin(radians(theta))));
    y = y + yc * ((random(2) + ys * cos(radians(theta))));

    if (x > (width - rad)) {
      x = width-rad;
      xc *= -1;
    } 
    else if (x < rad) {
      x = rad;
      xc *= -1;
    }

    if (y > (height - rad)) {
      y = height-rad;
      yc *= -1;
    } 
    else if (y < rad) {
      y = rad;
      yc *= -1;
    }
  }

  void display() {
    fill(ch, cs, cb);
    ellipse(x, y, diam, diam);
  }
}



