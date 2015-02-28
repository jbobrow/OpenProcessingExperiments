
int numballs = 100;
Ball balls[] = new Ball[numballs];
boolean borderWhite = true;
boolean borderExist = true;
float borderWidth = 1;

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
  //  background(0, 0, 0);
  noStroke();
  fill(0, 0, 0, 10);
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
}

void keyPressed() {
  if (key == 'b') { 
    borderWhite = !borderWhite;
  }
  if (key == 'n') { 
    borderExist = !borderExist;
  }
  if (key == 'r') { 
    reset();
  }
  if (key == ',') { 
    borderWidth -= .1;
    if (borderWidth < .1){borderWidth = .1;}
    strokeWeight(borderWidth);
  }
  if (key == '.') { 
    borderWidth += .1;
    strokeWeight(borderWidth);
  }
  
}

void reset() {
background(0,0,0);
  for (int i = 0; i < numballs; i++) {
    balls[i].x = random(width/2-1, width/2+11);
    balls[i].y = random(height/2-1, height/2+1);
  }
}
  
  
  class Ball {
  float x;
  float y;
  float xs;
  float ys;
  float bfill;
  float alph;
  float size;

  Ball() {
    x = random(width/2-1, width/2+1);
    y = random(height/2-1, height/2+1);
    xs = random(1, 3);
    ys = random(1, 3);
    float temp;
    temp = random(-1, 1);
      if (temp < 0) { 
        xs *= -1;
      }
    temp = random(-1, 1);
      if (temp < 0) { 
        ys *= -1;
      }

    size = random(5,30);
  }

  void run() {
    display();
    move();
  }

  void display() {
    bfill = map(x, 0, width, 0, 255);
    alph = map(y, 0, height, 0, 255);
    fill(bfill, 255, 255, alph);
    ellipse(x, y, size, size);
  }

  void move() {
    x += xs;
    y += ys;

    if (x >= (width - size/2)) {
      xs *=-1;
    }

    if (x <= (size/2)) {
      xs *=-1;
    }

    if (y >= (height - size/2)) {
      ys *=-1;
    }

    if (y <= (size/2)) {
      ys *=-1;
    }
  }
}

