
Frog charlie;
Car [] cars=new Car [6];
Log [] logs=new Log [7];

void setup() {
  size(400, 600);
  float x=0;
  charlie = new Frog(width/2, 540);
  cars[0]=new Car(150, 340);
  cars[1]=new Car (-170, 380);
  cars[2]=new Car (250, 420);
  cars[3]=new Car (-270, 460);
  cars[4]=new Car(55, 500);
  cars[5]=new Car (250,350);


  logs[0]=new Log (250, 90);
  logs[1]=new Log (350, 90);
  logs[2]=new Log (250, 90);
  logs[3]=new Log (550, 90);
  logs[4]=new Log (250, 180);
  logs[5]=new Log (350, 180);
  logs[6]=new Log (-450,180);
  
}
void draw() {
  rectMode(CORNER);          
  drawBackground();
  if (keyPressed)drawGridLines();
  charlie.display();
  for (int i=0; i<6; i++) {

    cars[i].move();
    cars[i].display();
    if (cars[i].didHitFrog(charlie.x, charlie.y)) {
      println("SPLAT");
      charlie.x = width/2+20;
      charlie.y = 540;
    }
  }
  for (int i=0; i<6; i++) {
    logs[i].move();
    logs[i].display();
  }

  if (charlie.y<280) {
    boolean alive=false;
    for (int i=0; i<logs.length; i++) {
      if (logs[i].didHitFrog(charlie.x, charlie.y)) {
        charlie.x+=logs[i].speed;
        alive=true;
        break;
      }
    }
  }
}
void keyPressed() {
  if (key == 'w') {
    charlie.y -= 40;
  }
  if (key == 'd') {
    charlie.x += 40;
  }

  if (key=='a') {
    charlie.x -= 40;
  }

  if (key=='s') {
    charlie.y +=40;
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
  fill(0, 120, 0);
  rect(0, 0, width, 80);
  fill(0, 0, 300);
  rect(0, 80, width, 205);
  fill(0);
  rect(0, 280, width, 50);
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

  Car(float nx, float ny) {
    x =nx;
    y =ny;
    c = color(random(255), random(255), random(255));
    speed = 4;
  }
  void move () {
    x += speed;
    if (x>width)x=-100;
    else if (x<-100)x=width;
  }
  boolean didHitFrog(float fx, float fy) {
    // if the distance between fx, fy, which we are using for the frog
    // and the x & y coordinates of this car, is less than 20, SQUISH
    if (dist(x, y, fx, fy)<40) {
      return true;
    }
    return false;
  }

  void display () {
    fill(c);
    rect(x, y, 80, 30);
    fill(c);
    rect (x+20, y, 40, 30);
  }
}
class Frog {

  float x, y;

  color c;

  Frog(float nx, float ny) {
    x=nx;
    y=ny;
    c = color(10, 255, 100);
  }

  void display() {

    fill(c);
    rectMode(CENTER);
    rect(x, y, 40, 40);
    fill(10, 150, 10);
    fill(0);
    rect(x-4, y-9, 3, 3);
    rect(x+4, y-9, 3, 3);
  }
}

class Log {

  float x, y;
  color c;
  float speed;

  Log(float nx, float ny) {
    x=nx;
    y=ny;
    c= color(#552407);
    speed = (-2.9);
  }
  boolean didHitFrog(float fx, float fy) {
    // if the distance between fx, fy, which we are using for the frog
    // and the x & y coordinates of this car, is less than 20, SQUISH
    if (dist(x, y, fx, fy)<40) {
      return true;
    }
    return false;
  }
  void move () {
    x += speed;
    if (x<0)x=width;
  }

  void display () {
    fill(c);
    rectMode(CENTER);
    rect(x, y, 90, 20);
    //ellipseMode(CENTER);
    ellipse (x+45, y, 5, 15);
    //ellipse (x+5, y+5, 25, 25);
  }
}



