
Car[]Cars=new Car [12];
Log[]Logs=new Log [12];
Frog d;

int x=0;
int y=0;
void setup() {
  size(400, 600);
  d=new Frog(width/2, height-40);

  // Cars!

  Cars[0]=new Car(-150, 487.4);
  Cars[1]= new Car(-400, 487.4);
  Cars[2]= new Car(-501, 487.4);
  Cars[3]= new Car(-370, 447.4);
  Cars[4]= new Car(-480, 447.4); 
  Cars[5]= new Car(-670, 447.4);
  Cars[6]= new Car(-300, 407.4);
  Cars[7]= new Car(-505, 407.4);
  Cars[8]= new Car(-600, 407.4);
  Cars[9]= new Car(-900, 367.4);
  Cars[10]= new Car(-980, 367.4);
  Cars[11]= new Car(-1800, 327.4);

  // Logs!
  Logs[0]=new Log(480, 80,-2);
  Logs[1]=new Log(750, 80,-1.8);
  Logs[2]=new Log(960, 80,-1.5);
  Logs[3]=new Log(760, 120,-2);
  Logs[4]=new Log(830, 120,-1.7);
  Logs[5]=new Log(1000, 120,-1.8);
  Logs[6]=new Log(1300, 160,-1.3);
  Logs[7]=new Log(1450, 160,-1.5);
  Logs[8]=new Log(2400, 160,-2);
  Logs[9]=new Log(3300, 200,-1.6);
  Logs[10]=new Log(3400, 200,-2);
  Logs[11]=new Log(1100, 240,-1);


  x+=100;
}


void keyPressed() {
  if (key=='w') {
    d.y -=40;
  }
  if (key== 'd') {
    d.x +=40;
  }
  if (key=='a') {
    d.x -=40;
  }
  if (key=='s') {
    d.y +=40;
  }
}


void draw() {
  drawBackground();
  d.display();

  for (int i=0; i<12; i++) {
    Cars[i].display();
    Cars[i].move();
    Logs[i].move();
    Logs[i].display();
    if (Cars[i].didHitFrog(d.x, d.y)) {
      println("SQUISH");
      // Reset the Frog to the bottom of the screen!
      d.x=width/2;
      d.y=500;
    }
  }
  for (int i =0; i<Logs.length; i++) {
    Logs[i].move();
    Logs[i].display();
  }
  if (d.y <280) {
    boolean alive = false;
    for (int i =0; i<Logs.length; i++) {
      if (Logs[i].didHitFrog(d.x, d.y))
        d.x+=Logs[i].speed;
      alive=true;
      break;
    }
    if(!alive) {
      println("BL0P");
      d.x = width/2;
      d.y= 500;
    }
  }
}
void drawBackground() {
  fill(#0EB900);
  rect(0, 0, width, 80);
  fill(#0CE8E6);
  rect(0, 80, width, 208);
  fill(50);
  rect(0, 280, width, 48);
  fill(150);
  rect(0, 320, width, 280);
  fill(50);
  rect(0, 520, width, 50);
  //road
  fill(150);
  rect(0, 320, width, 200);
  for (int x=10; x<width; x+=80) {
    for (int y=360; y<520; y+=40) {
      stroke(255, 255, 0);
      line(x, y, x+20, y);
    }
  }
  stroke(255);
  //sidewalk
  fill(50);
  rect(0, 520, width, 40);
  //score
  fill(255);
  text("score:", 50, 570);
}

class Car {
  color c=color (random(255), random(255), random(255));
  float x = 0;
  float y = 420;
  float speed = 2;
  Car(float nx, float ny) {
    x=nx;
    y=ny;
  }

  void move() {
    x=x+ speed;
    if (x>width) {
      x=-100;
    }
  }
  boolean didHitFrog(float fx, float fy) {
    if (dist(x, y, fx, fy)<20) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    stroke(0, 100, 20);
    strokeWeight(1);
    rect(x, y, 50, 30);
    fill(#0680F3);
    rect(x+25, y+2, 15, 26);
    fill(0);
    rect(x+3, y-4, 8, 3);
    rect(x+3, y+31, 8, 3);
    rect(x+43, y-4, 8, 3);
    rect(x+43, y+31, 8, 3);
  }
}

class Frog {
  float x, y;
  color c;
  Frog(float nx, float ny) {
    x=nx;
    y=ny;
    c=color (10, 25, 100);
  }

  void display(){
  fill(10,255,20);
  stroke(0,100,0);
  strokeWeight(1);
  rect(x, y, 40, 40);
  fill(0);
  rect(x+5,y+7,10,10);
  rect(x+25,y+7,10,10);
  fill(#FFFFFF);
  rect(x+7,y+9,5,5);
  rect(x+27,y+9,5,5);
  fill(#F20769);
  rect(x+18,y-5,5,10);
  fill(10,255,20);
  ellipse(x-2,y+7,10,10);
   ellipse(x+42,y+7,10,10);
     ellipse(x-2,y+37,12,14);
   ellipse(x+42,y+37,12,14);
  
  
}
}
class Log {
  color c=color (#795F1C);
  float x = 0;
  float y = 400;
  float speed ;
  Log(float nx, float ny,float nspeed) {
    x=nx;
    y=ny;
    speed=nspeed;
  }

  void move() {
    x=x+ speed;
    if (x<0) {
      x=500;
    }
  }
  boolean didHitFrog(float fx, float fy) {
    if (dist(x, y, fx, fy)<30) {
      return true;
    } else return false;
  }
  void display() {
    fill(c);
    noStroke();
    strokeWeight(1);
    rect(x, y, 80, 35);
    stroke(1);
    fill(0);
    rect(x+5, y+3, 55, .5);
    rect(x+11, y+6, 40, .5);
    rect(x+13, y+8, 60, .5);
    rect(x+15, y+11, 50, .5);
    rect(x+17, y+14, 30, .5);
    rect(x+18, y+16, 62, .5);

    rect(x+5, y+32, 55, .5);
    rect(x+11, y+28, 40, .5);
    rect(x+13, y+26, 60, .5);
    rect(x+15, y+22, 50, .5);
    rect(x+17, y+16, 30, .5);
    rect(x+18, y+13, 62, .5);
  }
}



