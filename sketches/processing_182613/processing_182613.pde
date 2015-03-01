
Car[] cars = new Car[9];
Log[] logs = new Log[15];
LilyPad[] pads = new LilyPad[5]; 
Frog frog;
void setup() {
  size(400, 600);
  frog = new Frog(width/2, 280);
  for(int i = 0; i < 5; i ++){
    pads[i] = new LilyPad(i*80, 0);
  }
  cars[0] = new Car(100, 320, 2);
  cars[1] = new Car(200, 320, 2);
  cars[2] = new Car(300, 320, 2);
  cars[3] = new RaceCar(200, 360, -4);
  cars[4] = new RaceCar(300, 360, -4);
  cars[5] = new RaceCar(400, 360, -4);
  cars[6] = new Car(200, 400, 2);
  cars[7] = new Car(300, 400, 2);
  cars[8] = new Car(400, 400, 2);

  logs[0] = new Log(120, 120, 1);
  logs[1] = new Log(220, 120, 1);
  logs[2] = new Log(1320, 120, 1);

  logs[3] = new Turtle(100, 80, -1);
  logs[4] = new Turtle(240, 80, -1);
  logs[5] = new Turtle(400, 80, -1);

  logs[6] = new Turtle(100, 160, -2);
  logs[7] = new Turtle(240, 160, -2);
  logs[8] = new Turtle(400, 160, -2);
  
  
  logs[9] = new Log(120, 1200, 1);
  logs[10] = new Log(220, 200, 1);
  logs[11] = new Log(320, 200, 1);
  
  logs[12] = new Log(120, 240, 2);
  logs[13] = new Log(220, 240, 2);
  logs[14] = new Log(320, 240, 2);
}

void draw() {
  drawBackground();
  for (int i = 0; i < cars.length; i++) {
    cars[i].move();
    cars[i].display();
    if (cars[i].didHitFrog(frog.x, frog.y)) {
      println("SQUISH");
      // Reset the Frog to the bottom of the screen!
      frog.x = width/2;
      frog.y = 520;
    }
  }
  for (int i = 0; i < logs.length; i++) {
    logs[i].move();
    logs[i].display();
  }
  if (frog.y < 280 ) {
    boolean alive = false; 
    for (int i = 0; i < logs.length; i++) {
      if ( logs[i].didHitFrog(frog.x, frog.y)) {
        frog.x += logs[i].speed;
        alive = true;
        break;
      }
    }
    if (!alive) {
      println("BLOOP");      // Reset the Frog to the bottom of the screen!
      frog.x = width/2;
      frog.y = 520;
    }
  }
    for(int i = 0; i < 5; i ++){
      pads[i].display();
    }



  frog.display();
}


void drawGridLines() {
  for (int x = 0; x <= width; x +=40) {
    for (int y = 0; y <= height; y += 40) {
      noFill();
      stroke(255);
      rect(x, y, 40, 40);
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    frog.y -= 40;
  }
  if (key == 'd') {
    frog.x += 40;
  } 
  if (key == 'a') {
    frog.x -= 40;
  }
  if (key == 's') {
    frog.y += 40;
  }
}













void drawBackground() {
  background(0);
  strokeWeight(0);
  noStroke();
  //grass & lilly pads!
  fill(10, 120, 10);
  stroke(255);
  rect(0, 0, width, 80);
  //water!
  fill(60, 60, 255);
  rect(0, 80, width, 200);
  //sidewalk!
  fill(100);
  rect(0, 280, width, 40);
  //roads!
  fill(150);
  rect(0, 320, width, 200);
  for (int x = 20; x < width; x += 80) {
    for (int y = 360; y < 520; y += 40) {
      stroke(255, 255, 0);
      line(x, y, x + 20, y);
    }
  }
  stroke(255);
  // sidewalk!
  fill(50);
  rect(0, 520, width, 40);
  // score!
  fill(255);
  text("Score: ", 50, 580);
}

class Car {
  float x, y;
  color c;
  float speed;

  Car(float nx, float ny, float nspeed ) {
    x = nx; 
    y = ny; 
    c = color(random(50,100),random(50,100),random(50,100));
    speed = nspeed;
  }
  void move() {
    x += speed;
    if (x > width) x = -100;
    else if (x < -100) x = width;
  }
  boolean didHitFrog(float fx, float fy){
    if( abs(x-fx)<40 && abs(y - fy) < 20){
      return true;
    }
    else return false;
  }
  void display() {
    fill(c);
    strokeWeight(1);
    rect(x, y, 80, 35, 8);
    fill(c);
    rect(x+20, y, 40, 35);
  }
}

class Frog {

  float x, y;

  color c;
  Frog(float nx, float ny) {
    x = nx;
    y = ny;
    c = color (10, 255, 100);
  }
  void display() {
    fill(c);
    stroke(0, 200, 0);
    strokeWeight(2);
    //top legs
    line(x - 5, y +15, x+25, y+15);
    line(x - 5, y +15, x-5, y+5);
    line(x + 25, y +15, x+25, y+5);
    //bottom legs
    line(x - 5, y +25, x+25, y+25);
    line(x - 5, y +25, x-5, y+35);
    line(x + 25, y +25, x+25, y+35);
    //body
    rect(x, y+10, 20, 20);
    //eyes
    ellipse(x+5, y+15, 3, 3);
    ellipse(x+15, y+15, 3, 3);
  }
}

class LilyPad {

  float x, y;
  boolean full;
  Frog f;

  LilyPad(float nx, float ny) {
    x = nx; 
    y = ny;
    full = false;
    f = new Frog(x + 40, y);
  }


  void display() {
    noStroke(); 
  fill(60, 60, 255);
    rect(x+10, y+21, 60, 60, 10);
    fill(100, 250, 80);
    rect(x+25, y+40, 30, 30,10);
    if (full) {
      // draw a frog!
      f.display();
    }
  }
}

class Log {
  float x, y;
  color c;
  float speed;

  Log(float nx, float ny, float nspeed ) {
    x = nx; 
    y = ny; 
    c = color(125,75,6);
    speed = nspeed;
  }
  void move() {
    x += speed;
    if (x > width) x = -100;
    else if (x < -100) x = width;
  }
  boolean didHitFrog(float fx, float fy){
    if( abs(x+40-fx)<50 && abs(y - fy) < 20){
      return true;
    }
    else return false;
  }
  void display() {
    fill(c);
    noStroke();
    rect(x,y+5,80,25);
    ellipse(x,y+20,10,25);
    ellipse(x+80,y+20,10,25);
  }
}

class RaceCar extends Car{
  
  RaceCar(float nx, float ny, float nspeed){
    super(nx,ny,nspeed);
  }
  
  void display(){
    fill(c);
    rect(x, y, 80, 35,8);
    fill(255,80);
    rect(x+20, y, 40, 35,5);
  }
}
class Turtle extends Log {
  Turtle(float nx, float ny, float nspeed) {
    super(nx, ny, nspeed);

    c = color(20, 180, 20);
  }

  void display() {
    fill(c);
    //legs:
    strokeWeight(4);
    stroke(40);
    for (float nx = x; nx < x+ 120; nx += 40) {
      line(nx, y+4, nx+36, y+36);
      line(nx+40, y+4, nx, y+36);
    }
    strokeWeight(1);
    ellipse(x + 20, y + 20, 30, 30);
    ellipse(x + 60, y + 20, 30, 30);
    ellipse(x + 100, y + 20, 30, 30);
  }
}



