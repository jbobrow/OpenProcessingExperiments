
Car[] cars = new Car[5];
Log[] logs = new Log[3];
wFrog[] wfrogs = new wFrog[3];


int fx = 200;
int fy = 555;
void setup() {
  size(400, 600);

     
  for (int i=0; i<cars.length; i++) {
    cars[0] = new Car(0, 325);
    cars[1] = new Car(0, 365);
    cars[2] = new Car(0, 405);
    cars[3] = new Car(0, 445);
    cars[4] = new Car(0, 525);
  }
  for (int i=0; i<logs.length; i++) {
    logs[0] = new Log(0, 50);
    logs[1] = new Log(0, 130);
    logs[2] = new Log(0, 200);
  }
  for (int i=0; i<wfrogs.length; i++) {
    wfrogs[0] = new wFrog(0, 250);
    wfrogs[1] = new wFrog(0, 100);
    wfrogs[2] = new wFrog(0, 180);
  }
}

void draw() { 
  drawBackground();
  for (int i=0; i<cars.length; i++) {

    cars[0].move();
    cars[0].display();
    cars[1].move();
    cars[1].display();
    cars[2].move();
    cars[2].display();
    cars[3].move();
    cars[3].display();
    cars[4].move();
    cars[4].display();
  }
  for (int i=0; i<logs.length; i++) {
    logs[0].move();
    logs[0].display();
    logs[1].move();
    logs[1].display();
    logs[2].move();
    logs[2].display();
  }
  for (int i =0; i<wfrogs.length; i++){
    wfrogs[0].move();
    wfrogs[0].display();
    wfrogs[1].move();
    wfrogs[1].display();
    wfrogs[2].move();
    wfrogs[2].display();
  }

  drawFrog();
  if (fy<0) {
    fy=560;
  }
 if(fy>height) {
   fy*=-1;
 }
}


void drawBackground() {
  background(255);
  //Starting Safety
  fill(0);
  rect(0, 550, 399, 50);
  //road
  noFill();
  fill(65);
  rect(0, 325, 399, 225);
  //2nd safety
  noFill();
  fill(0);
  rect(0, 275, 399, 50);
  //water
  noFill();
  fill(0, 0, 180);
  rect(0, 50, 399, 225);
  //Goals
  noFill();
  fill(0, 180, 0);
  rect(0, 0, 399, 50);
  noFill();
}
void drawFrog() {
  fill(0, 150, 0);
  rect(fx, fy, 30, 30);
  noFill();
  if(keyPressed){
  if (key=='w' || key=='W') {
    fy=fy-10;
  }
  if (key=='s' || key=='S') {
    fy=fy+10;
  }
  }
}

class Car {
  float x, y;
  color c;
  float speed;
  Car(float nx, float ny) {
    x=nx;
    y=ny;
    c=color(random(255), random(255), random(255));
    speed= random(.25, 1);
  }
  void move() {
    x+=speed;
    if (x>width) x=-100;
  }
  void display() {
    fill(c);
    rect(x, y, 80, 20);
    ellipse(x+20, y+20, 15, 15);
    ellipse(x+60, y+20, 15, 15);
  }
}
class Log{
  float x, y;
  color d;
  float speed;
  Log(float Lx, float Ly) {
    x=Lx;
    y=Ly;
    d=color(150,75,0);
    speed= random(.25, 1);
  }
  void move() {
    x+=speed;
    if (x>width) x=-100;
  }
  void display() {
    fill(d);
   rect(x,y,100,30);
   rect(x-200,y,100,30);
   rect(x+200,y,100,30);
  }
}

class wFrog {
  float x, y;
  float speed;
  wFrog(float wfx, float wfy) {
    x=wfx;
    y=wfy;
    speed= random(.25, 1);
  }
  void move() {
    x+=speed;
    if (x>width) x=-100;
  }
  void display() {
    fill(0,200,0);
    ellipse(x-30,y,30,30);
    ellipse(x,y,30,30);
    ellipse(x+30,y,30,30);
    
    
  }
}


