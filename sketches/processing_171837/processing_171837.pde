
Frog isabel;
Log[] logs = new Log[30];
Car[]cars=new Car[30];
void setup() {
  size(400, 600);
  isabel = new Frog(width/2, 580);
  for (int i=0; i<logs.length; i++) {
    logs[i] = new Log(random(-500, width), 100  + (int)random(5)*40);
  }
  for (int i=0; i<cars.length; i++) {
    cars[i]=new Car(random(-500, width), 340 +(int)random(5)*40);
  }
}
void draw() {

  if (isabel.x<0) {
    isabel.y=580;
    isabel.x=width/2;
  }
  if (isabel.x>400) {
    isabel.y=580;
    isabel.x=width/2;
  }

  drawBackground();
  for (int i=0; i<cars.length; i++) {
    cars[i].display();
    cars[i].move();
    if (cars[i].didHitFrog(isabel.x, isabel.y)) {

      println("SQUISH");
      isabel.x=width/2;
      isabel.y=580;
    }
  }
  for (int i=0; i<cars.length; i++) {
    logs[i].display();
    logs[i].move();
  }
  isabel.display();
  if (isabel.y<=280 && isabel.y>=80) {

    boolean alive=false;

    for (int i=0; i<logs.length; i++) {
      if (logs[i].frogDrowns(isabel.x, isabel.y)) {
        isabel.x+=logs[i].speed;
        alive=true;
        break;
      }
    }
    if (!alive) {
      println("bloop");
      isabel.x=width/2;
      isabel.y=580;
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    isabel.y -= 40;
  }
  if (key == 's') {
    isabel.y += 40;
  }
  if (key == 'a') {
    isabel.x -= 40;
  }
  if (key == 'd') {
    isabel.x +=40;
  }
}


void drawBackground() {
  background(0);
  stroke(0);
  rectMode(CORNER);
  //hedgething
  fill(#037E1E);
  rect(0, 0, width, 80);
  //water
  fill(#0F1AD3);
  rect(0, 80, width, 200);
  //sidewalk
  fill(#A0A0A0);
  rect(0, 280, width, 40);
  //street
  fill(0);
  rect(0, 320, width, 120);
  //road
  rect(0, 320, width, 200);
  stroke(250);
  for (int x=10; x<=width; x+=40) {
    for (int y=360; y<=480; y+=40) {
      stroke(250);
      line(x+5, y, x, y);
    }
  }
  //sidewalk
  fill(#A0A0A0);
  rect(0, 520, width, 40);
  //score
  fill(0);
  rect(0, 560, width, 40);
}

class Car {
  float x, y;
  color c;
  float speed;
  Car(float nx, float ny) {
    x=nx;
    y=ny;
    c=color(#FC0AD1);
    speed=1;
  }
  void move() {
    x+=speed;
    if (x>width+100) x=-200;
  }

  boolean didHitFrog(float fx, float fy) {
    if(abs(fy-y) <= 5 && abs(fx-x) <= 20){
      return true;
    }
    return false;
  }

  void display() {
    //car
    rectMode(CENTER);
    fill(c);
    stroke(c);
    rect (x, y, 40, 20) ;
  }
}

class Frog {
  float x, y;
  color c;
  Frog(float nx, float ny) {
    x = nx;
    y = ny;
    c = color (#02AA00);
  }

  void display() {
    fill(c);
    stroke(c);
    rectMode(CENTER);
    rect(x, y, 20, 20);
    strokeWeight(2);

    line(x, y+10, x+20, y+10);
    line(x, y+10, x-20, y+10); 
    line(x+20, y+10, x+20, y+20);
    line(x-20, y+10, x-20, y+20);
    line(x-20, y-10, x+20, y-10);
    line(x+20, y-10, x+20, y-20);
    line(x-20, y-10, x-20, y-20);
    strokeWeight(1);
    stroke(0);
    fill(#FF0DC3);
    ellipse(x+10, y-10, 7, 7);
    ellipse(x-10, y-10, 7, 7);
  }
}

class Log {
  float x, y;
  color c;
  float speed;

  Log(float nx, float ny) {
    x=nx;
    y=ny;
    c=color(#432C2B);
    speed=1;
  }
  void move() {
    x+=speed;
    if (x>width+40) x=-200;
  }

  boolean frogDrowns(float fx, float fy) {
    if (abs(fy-y) <= 30 && abs(fx-x) <= 25) {
      return true;
    }
    return false;
  }
  
  void display() {
    //logs 
    rectMode(CENTER);
    stroke(c);
    fill(c);
    rect(x, y, 50, 20);
  }
}



