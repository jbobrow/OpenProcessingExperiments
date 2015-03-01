
Frog zero;

Car [] cars = new Car[10];
Car [] sandwhichs = new Car[10];
Car [] streetracer = new Car[10];
Car [] taxi = new Car[10];
Car [] cake = new Car[10];

Log [] logs = new Log[10];
Log [] arno = new Log[10];
void setup() {
  size(400, 600);
  zero = new Frog(520, 200);
  float x =  0;
  //Car
  for (int i = 0; i < sandwhichs.length; i++) {
    sandwhichs[i] = new Car(x, 360);
    x += 200;
    sandwhichs[i].speed = -2;
  }
  x = 0;
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car(x, 480);
    x += 200;
    cars[i].speed= 2;
  }
  x = 0;
  for (int i = 0; i < streetracer.length; i++) {
    streetracer[i] = new Car(x, 440);
    x += 200;
    streetracer[i].speed = 1;
  }
  x = 0;
  for (int i = 0; i < taxi.length; i++) {
    taxi[i] = new Car(x, 400);
    x += 200;
    taxi[i].speed = -.9;
  }
  x = 0;
  for (int i = 0; i < cake.length; i++) {
    cake[i] = new Car(x, 320);
    x += 200;
    cake[i].speed = 2;
  }

  x = 0;
  for (int i = 0; i < logs.length; i++) {
    logs[i] = new Log(x, 240);
    x += 200;
    logs[i].speed = 2;
  }
  x=0;
  for (int i = 0; i < logs.length; i++) {
    arno[i] = new Log(x,200);
    x += 200;
    arno[i].speed = 3;
  }
}

void draw() {

  drawBackground();
  for (int i = 0; i < logs.length; i++) {
    logs[i].move();
    logs[i].display();
  }
  if (zero.y < 280) { 
    boolean alive = false;
    for (int i=0; i<logs.length; i++) {
      if (logs[i].logdidHitFrog(zero.x, zero.y) || arno[i].logdidHitFrog(zero.x, zero.y)) {
        zero.x+= logs[i].speed;
        break;
      }
    } 
    if (!alive) {
      println("EXPLODE");
      zero.x=width/2;
      zero.y= 520;
    }
  }
  zero.display();
  for (int i = 0; i < cars.length; i++) {
    cars[i].move();
    cars[i].display();

    sandwhichs[i].move();
    sandwhichs[i].display();

    taxi[i].move();
    taxi[i].display();
  }
  for (int i = 0; i < streetracer.length; i++) {
    streetracer[i].move();
    streetracer[i].display();
  }


  for (int i = 0; i < sandwhichs.length; i++) {
    sandwhichs[i].move();
    sandwhichs[i].display();
    if (sandwhichs[i].didHitFrog(zero.x, zero.y)||cars[i].didHitFrog(zero.x, zero.y)||taxi[i].didHitFrog(zero.x, zero.y)||cake[i].didHitFrog(zero.x, zero.y)|| streetracer[i].didHitFrog(zero.x, zero.y)) {
      println("DEAD");
      zero.x = 200;
      zero.y = 520;
    }
  }
}
void keyPressed() {
  if (key=='w') {
    zero.y-= 40;
  }
  if (key=='d') {
    zero.x +=40;
  }
  if (key=='s') {
    zero.y +=40;
  }
  if (key=='a') {
    zero.x -=40;
  }
}

void drawBackground() {

  //Starting Safety
  line(0, 560, 400, 560);
  //2nd safety
  line(0, 325, 400, 325);
  // grass & lily pads;
  fill(10, 120, 10);
  rect(0, 0, width, 80);

  fill(10, 10, 200);
  rect(0, 80, width, 200);

  fill(50);
  rect(0, 280, width, 200);

  fill(150);
  rect(0, 320, width, 200);

  for (int x=10; x <width; x += 80) {
    for (int y= 360; y<520; y+=40) {
      stroke(255, 255, 0);
      line(x, y, x+20, y);
    }
  }
  stroke(255);

  fill(50);
  rect(0, 520, width, 40);
}

class Car {

  float x, y;
  color c;
  float speed;

  Car(float nx, float ny) {
    x=nx;
    y=ny;
    c=color(random(255), random(255), random(255));
    speed = 4;
  }



  void move() {
    x += speed;
    if (x>width) {
      x=-100;
    } 
    if (x<-100) {  
      x=100;
    }
  } 
  boolean didHitFrog(float fx, float fy) {
    if (abs(x-fx) < 40  && abs(y-fy)< 1 ) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    rect(x, y, 80, 20);
  }
}

class Frog {

  float x, y;
  color c;

  Frog(float nx, float ny) {
    x=nx;
    y=ny;
    c= color (10, 255, 100);
  }

  void display() {
    //upper
    line(x-5, y+5, x+45, y+5);
    line(x-5, y+5, x-5, y-5);
    line(x+45, y+5, x+45, y-5);
    //lower
    line(x-5, y+15, x+45, y+15);   
    line(x-5, y+15, x-5, y+35);
    line(x+45, y+15, x+45, y+35);
    //body
    rect(x, y, 40, 20);
  }
}

class Log {   
  int Length;
  float x, y;
  color c;
  float speed;

  Log(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(45);
    speed = 1;
    Length = 100;
  }
  void move() {
    x += speed;
    if (x > width) { 
      x = -200;
    }
    if (x < -200) { 
      x = 400;
    }
  }
  boolean logdidHitFrog(float fx, float fy) {
    if (abs(x-fx) < Length && abs(y - fy) < 80) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    rect(x, y+5, Length, 30);
  }
}



