
Frog g;
Car[] cars = new Car [9];
Log[] logs = new Log [6];

void setup() {
  size(400, 600);
  g = new Frog (width/2, 520);
  cars[0] = new Car(100, 350, 2);
  cars[1] = new Car(200, 350, 2);
  cars[2] = new Car(300, 350, 2);
  cars[3] = new Car(200, 430, -4);
  cars[4] = new Car(300, 430, -4);
  cars[5] = new Car(400, 430, -4);
  cars[6] = new Car(200, 480, 2);
  cars[7] = new Car(300, 480, 2);
  cars[8] = new Car(400, 480, 2);

  logs[0] = new Log(200, 120, 1);
  logs[1] = new Log(500, 120, 1);
  logs[2] = new Log(900, 120, 1);
  logs[3] = new Log(400, 120, 1);
  logs[4] = new Log(600, 120, 1);
  logs[5] = new Log(1000, 120, 1);
}

void draw() {
  rectMode(CORNER);
  drawBackground();
  g.display();
  for (int i = 0; i < cars.length; i++) {
    cars[i].move();
    cars[i].display();
    if (cars[i]. didHitFrog(g.x, g.y)) {
      println ("SQUISH");
      g.x = width/2;
      g.y = 520;
    }
  }

  for (int i =0; i < logs.length; i ++) {
    logs[i].move();
    logs[i].display();
    if (logs[i]. didHitFrog(g.x, g.y)) {
      g.x+= logs[i].speed;
    }
  }
}
void keyPressed() {
  if (key == 'w') {
    g.y -= 40;
  }
  if (key == 'd') {
    g.x += 40;
  }

  if (key=='a') {
    g.x -= 40;
  }

  if (key=='s') {
    g.y +=40;
  }
}

void drawGridLines() {
  for (int x=0; x<= width; x +=40) {
    for (int y=0; y<=height; y +=40) {
      noFill();
      stroke(255);
      rect(x, y, 40, 40);
    }
  }
}


void drawBackground() {
  fill(#24641A);
  rect(0, 0, width, 80);
  fill(#153BCE);
  rect(0, 80, width, 208);
  fill(0);
  rect(0, 280, width, 48);
  fill(150);
  rect(0, 320, width, 280);
  fill(150);
  rect(0, 520, width, 50);
  fill(150);
  rect(0, 320, width, 200);
  for (int x = 10; x < width; x +=80) {
    for (int y = 360; y < 520; y +=40) {
      stroke(255, 255, 0);
      line(x, y, x+20, y);
    }
  }
  stroke(255);
  fill(0);
  rect(0, 520, width, 40);
  fill(0);
  text("Score: ", 50, 570);
}

class Car {
  float x, y;
  color c;
  float speed;

  Car (float nx, float ny, float nspeed) {
    x=nx;
    y=ny;
    speed= nspeed;
    c = color(random(230), random(205), random(245), random(600));
  }
  void move() {
    x += speed;
    if (x > width) x = -100;
    else if (x <-100) x = width;
  }
  boolean didHitFrog(float fx, float fy) {
    if (abs(x-fx) <40 && abs(y-fy) < 20) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    rect(x, y, 55, 30);
    fill(c);
    rect(x+20, y, 50, 30);
  }
}

class Log {
  float x, y;
  color c;
  float speed;

  Log (float nx, float ny, float nspeed) {
    x=nx;
    y=ny;
    speed= nspeed;
    c = color(#520707);
  }
  void move() {
    x += speed;
    if (x > width) x = -100;
    else if (x <-100) x = width;
  }
  boolean didHitFrog(float fx, float fy) {
    if (abs(x-fx) <40 && abs(y-fy) < 20) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    rect(x, y, 90, 30);
    fill(c);
  }
}

class Frog {

  float x, y;

  color c;

  Frog(float nx, float ny) {
    x=nx;
    y=ny;
    c = color(#00FF3D);
  }

  void display() {

    fill(c);
    rectMode(CENTER);
    rect(x, y, 40, 40);
    fill(10, 150, 10);
    line(x+8, y+5, x+12, y+5);
    line(x-8, y+5, x-12, y+5);
    line(x+12, y+5, x+12, y+10);
    line(x-12, y+5, x-12, y+10);
    line(x+8, y-5, x+12, y-5);
    line(x-8, y-5, x-12, y-5);
    line(x+12, y-5, x+12, y-10);
    line(x-12, y-5, x-12, y-10);
    fill(500, 0, 0);
    ellipse(x-4, y-9, 3, 3);
    ellipse(x+4, y-9, 3, 3);
  }
}


