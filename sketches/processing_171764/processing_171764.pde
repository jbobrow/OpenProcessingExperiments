
Frog ted;
//Cars
Car [] cars = new Car[9];
Car [] boats = new Car[9];
Car [] trains = new Car[9];
Car [] autobots = new Car[9];
Car [] malcolms = new Car[9];
//Logs
Log [] logs = new Log[3];
Log [] logs2 = new Log[3];
Log [] logs3 = new Log[3];
Log [] logs4 = new Log[3];
Log [] logs5 = new Log[3];
//
Pad [] pads = new Pad[3];
//
int count[] = new int [3];
boolean alive = true;
int lives = 3;

void setup() {
  size(440, 600);
  ted = new Frog(520, 200);
  float x =  0;
  //Pads
  for (int i = 0; i < pads.length; i++) {
    x += 120;
    count[i] = 0;
    pads[i] = new Pad(x-40, 40);
  }
  //CARS
  x = 0;
  for (int i = 0; i < boats.length; i++) {
    boats[i] = new Car(x, 360);
    x += 200;
    boats[i].speed = -2;
  }
  x = 0;
  for (int i = 0; i < cars.length; i++) {
    cars[i] = new Car(x, 480);
    x += 200;
    cars[i].speed= 2;
  }
  x = 0;
  for (int i = 0; i < trains.length; i++) {
    trains[i] = new Car(x, 440);
    x += 200;
    trains[i].speed = 1;
  }
  x = 0;
  for (int i = 0; i < autobots.length; i++) {
    autobots[i] = new Car(x, 400);
    x += 200;
    autobots[i].speed = -.5;
  }
  x = 0;
  for (int i = 0; i < malcolms.length; i++) {
    malcolms[i] = new Car(x, 320);
    x += 200;
    malcolms[i].speed = 2;
  }
  //LOGS
  x = 0;
  for (int i = 0; i < logs.length; i++) {
    logs[i] = new Log(x, 240);
    x += 200;
    logs[i].speed = 1;
  }
  x = 0;
  for (int i = 0; i < logs2.length; i++) {
    logs2[i] = new Log(x, 200);
    x += 200;
    logs2[i].speed = -2;
  }
  x = 0;
  for (int i = 0; i < logs3.length; i++) {
    logs3[i] = new Log(x, 160);
    x += 200;
    logs3[i].speed = 4;
  }
  x = 0;
  for (int i = 0; i < logs4.length; i++) {
    logs4[i] = new Log(x, 120);
    x += 200;
    logs4[i].speed = -2;
  }
  x = 0;
  for (int i = 0; i < logs5.length; i++) {
    logs5[i] = new Log(x, 80);
    x += 200;
    logs5[i].speed = 1.5;
  }
}

void draw() {
  drawbackground();
  for (int i = 0; i < pads.length; i++) {
    pads[i].display();
  }
  for (int i = 0; i < logs.length; i++) {
    logs[i].move();
    logs[i].display();
    logs2[i].display();
    logs2[i].move();
    logs3[i].display();
    logs3[i].move();
    logs4[i].display();
    logs4[i].move();
    logs5[i].display();
    logs5[i].move();
  }
  //$$$$$$$$$$$$
  ted.display();
  //&&&&&&&&&&&&
  for (int i = 0; i < cars.length; i++) {
    cars[i].move();
    cars[i].display();

    trains[i].move();
    trains[i].display();

    autobots[i].move();
    autobots[i].display();

    malcolms[i].move();
    malcolms[i].display();
  }
  for (int i = 0; i < boats.length; i++) {
    boats[i].move();
    boats[i].display();
    if (boats[i].didHitFrog(ted.x, ted.y)||cars[i].didHitFrog(ted.x, ted.y)||trains[i].didHitFrog(ted.x, ted.y)||autobots[i].didHitFrog(ted.x, ted.y)||malcolms[i].didHitFrog(ted.x, ted.y)) {
      alive = false;
    }
  }
  if (ted.y <280) {
    alive = false;
    for (int i = 0; i < logs.length; i++) {
      if (logs[i].logDidHitFrog(ted.x, ted.y)) {
        alive = true;
        ted.x += logs[i].speed;
        break;
      }
    }
  }
  if (ted.y <240) {
    alive = false;
    for (int i = 0; i < logs2.length; i++) {
      if (logs2[i].logDidHitFrog(ted.x, ted.y)) {
        alive = true;
        ted.x += logs2[i].speed;
        break;
      }
    }
  }
  if (ted.y <200) {
    alive = false;
    for (int i = 0; i < logs3.length; i++) {
      if (logs3[i].logDidHitFrog(ted.x, ted.y)) {
        alive = true;
        ted.x += logs3[i].speed;
        break;
      }
    }
  }
  if (ted.y <160) {
    alive = false;
    for (int i = 0; i < logs4.length; i++) {
      if (logs4[i].logDidHitFrog(ted.x, ted.y)) {
        alive = true;
        ted.x += logs4[i].speed;
        break;
      }
    }
  }
  if (ted.y <120) {
    alive = false;
    for (int i = 0; i < logs5.length; i++) {
      if (logs5[i].logDidHitFrog(ted.x, ted.y)) {
        count[i]=1;
        alive = true;
        ted.x += logs5[i].speed;
        break;
      }
    }
  }
  if (ted.y < 80) {
    alive = false;
    for (int i = 0; i < pads.length; i++) {
      if (pads[i].hitFrog(ted.x, ted.y)) {
        count[i] = 1;
        lives += 1;
        break;
      }
    }
  }

  if (keyPressed && key == ' ') {
    drawGridlines();
  }
  if (ted.x > width-5) {
    ted.x = 360;
  }
  if (count[0] == 1) {
    fill(#FF0000);
    ellipse(100, 60, 40, 40);
  }
  if (count[1] == 1) {
    fill(#FF0000);
    ellipse(220, 60, 40, 40);
  }
  if (count[2] == 1) {
    fill(#FF0000);
    ellipse(340, 60, 40, 40);
  }
  if (count[0] + count[1] + count [2] == 3) {
    textSize(50);
    text("YOU WIN", width/2-100, height/2+10);
    noLoop();
  }
  if (ted.x < -1) {
    ted.x = 0;
  }
  if (ted.y > 520) {
    ted.y = 520;
  }
  if (lives >= 1) {
    fill(#FF0000);
    ellipse(10, 580, 10, 10);
  }
  if (lives >= 2) {
    ellipse(25, 580, 10, 10);
  }
  if (lives >= 3) {
    ellipse(40, 580, 10, 10);
  }
  if (lives < 1) {
    textSize(50);
    text("YOU LOSE", width/2-100, height/2+10);
    noLoop();
  }
  if (alive == false) {
    ted.x = 200;
    ted.y = 520;
    lives -= 1;
    alive = true;
  }
}
void keyPressed() {
  if (keyCode == UP || key == 'w') {
    ted.y -= 40;
  }
  if (keyCode == DOWN || key == 's') {
    ted.y += 40;
  }
  if (keyCode == LEFT || key == 'a') {
    ted.x -= 40;
  }
  if (keyCode == RIGHT || key == 'd') {
    ted.x += 40;
  }
}
void drawGridlines() {
  for (int x = 0; x < width; x += 40) {
    for (int y = 0; y < height; y += 40) {
      noFill();
      strokeWeight(2);
      stroke(255);
      rect(x, y, 40, 40);
    }
  }
}
void drawbackground() {
  noStroke();
  //draw scoeing zone
  fill(#18ED39);
  rect(0, 0, width, 80);
  //draw lake
  fill(#18B2ED);
  rect(0, 80, width, 200);
  //draw side walk
  fill(#5B6064);
  stroke(#5B6064);
  rect(0, 280, width, 40);
  //draw street
  fill(0);
  stroke(0);
  rect(0, 320, width, 200);
  for (int z = 10; z < width; z += 40) {
    for (int w = 360; w < 520; w += 40) {
      strokeWeight(1);
      stroke(#FBFF21);
      line(z, w, z+15, w);
    }
  }
  //draw side walk 2
  fill(#5B6064);
  stroke(#5B6064);
  rect(0, 520, width, 40);
  //score board
  fill(#00FFFF);
  rect(0, 560, width, 40);
}
class Car {
  int Length;
  float x, y;
  color c;
  float speed;

  Car(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(255);
    speed = 2;
    Length = 50;
  }
  void move() {
    x += speed;
    if (x > width) { 
      x = -200;
    }
    if (x < -200) { 
      x = width;
    }
  }

  boolean didHitFrog(float fx, float fy) {
    if (abs(x-fx) < Length && abs(y - fy) < 1) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    rect(x, y+5, Length, 30);
  }
}
class Frog {
  float g = 40;
  float x, y;
  color c;
  Frog(float nx, float ny) {
    x=ny;
    y=nx;
    c = color(#FF0000);
  }
  void display() {
    fill(c);
    noStroke();
    ellipse(x+g/2, y+g/2, g, g);
  }
}
class Log {   
  int Length;
  float x, y;
  color c;
  float speed;
  int s;

  Log(float nx, float ny) {
    x = nx;
    y = ny;
    c = color(#FAA700);
    speed = 1;
    Length = 45;
    s = 255;
  }
  void move() {
    x += speed;
    if (x > width) { 
      x = -200;
    }
    if (x < -200) { 
      x = width;
    }
  }
  boolean logDidHitFrog(float fx, float fy) {
    if (abs(x+30-fx) < Length && abs(y - fy) < 40) {
      return true;
    } else return false;
  }
  void display() {
    noStroke();
    fill(c, s);
    rect(x+30, y+5, Length, 30);
    rect(x, y+5, Length + 60, 30);
  }
}
class Pad {
  float x, y;
  color c;
  Pad (float nx, float ny) {
    x=nx;
    y=ny;
    c = color(#0319FC);
  }

  boolean hitFrog(float fx, float fy) {
    if (abs(x-fx) < 40 && abs(y - fy) < 1) {
      return true;
    } else return false;
  }


  void display() {
    fill(c);
    noStroke();
    rect(x, y, 40, 40);
  }
}


