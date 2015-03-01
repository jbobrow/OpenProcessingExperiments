
int numballs = 500;   //100
Ball balls[] = new Ball[numballs];
boolean borderWhite = false;
boolean borderExist = false;
boolean borderFade = false;
boolean capture = false;
float borderWidth = 1;
int minsize = 5;
int maxsize = 30;

void setup() {
  size(600, 600);
  colorMode(HSB);
  background(0, 0, 0);
  strokeWeight(borderWidth);
  stroke(0, 0, 255);
  for (int i = 0; i < numballs; i++) {
    balls[i] = new Ball();
  }
}

void draw() {

  noStroke();
  fill(0, 0, 0, 2);  //10
  rect(0, 0, width, height);
  if (borderExist) {
    if (borderWhite) {
      stroke(0, 0, 255);
    } else {
      stroke(0, 0, 0);
    }
  } else {
    noStroke();
  }

  for (int i = 0; i < numballs; i++) {
    balls[i].run();
  }

  if (capture) {
    saveFrame("frames/####.png");
  }
}

void keyPressed() {
  if (key == 'b') { 
    borderWhite = !borderWhite;
  }
  if (key == 'n') { 
    borderExist = !borderExist;
  }
  if (key == 'f') { 
    borderFade = !borderFade;
  }

  if (key == 'r') { 
    maxsize = 30;
    reset();
  }
  if (key == 't') {
    maxsize = 10;
    reset();
  }
  if (key == ',') { 
    borderWidth -= .1;
    if (borderWidth < .1) {
      borderWidth = .1;
    }
    strokeWeight(borderWidth);
  }
  if (key == '.') { 
    borderWidth += .1;
    strokeWeight(borderWidth);
  }
  if (key == 's') {
    saveFrame("frames/####.png");
  }
  if (key == 'c') {
    capture = !capture;
  }

}

void reset() {
  background(0, 0, 0);
  for (int i = 0; i < numballs; i++) {
    balls[i].x = random(width/2-1, width/2+11);
    balls[i].y = random(height/2-1, height/2+1);
    balls[i].ballsize = random(minsize, maxsize);
  }
}



class Ball {
  float x;
  float y;
  float xs;
  float ys;
  float bfill;
  float alph;
  float ballsize;

  Ball() {
    x = random(width/2-1, width/2+1);
    y = random(height/2-1, height/2+1);
    xs = random(1, 3);  //3
    ys = random(1, 3);  //3
    float temp;
    temp = random(-1, 1);
    if (temp < 0) { 
      xs *= -1;
    }
    temp = random(-1, 1);
    if (temp < 0) { 
      ys *= -1;
    }

    ballsize = random(minsize, maxsize);  //30
  }

  void run() {
    display();
    move();
  }

  void display() {

    bfill = map((width/2) - (dist(x, y, width/2, height/2)), 0, width/2, 0, 255);

    if (bfill < 0) {
      bfill = 0;
    }

     alph = map((width/2) - (dist(x, y, width/2, height/2)), 0, width/2, 0, 255);
    if (alph < 0) {
      alph = 0;
    }
    if (borderExist && borderWhite && borderFade){
     stroke(0,0,255,alph); 
    }
    fill(bfill, 255, 255, alph);
    ellipse(x, y, ballsize, ballsize);
  }

  void move() {
    x += xs;
    y += ys;

    if (x >= (width - ballsize/2)) {
      xs *=-1;
    }

    if (x <= (ballsize/2)) {
      xs *=-1;
    }

    if (y >= (height - ballsize/2)) {
      ys *=-1;
    }

    if (y <= (ballsize/2)) {
      ys *=-1;
    }
  }
}

