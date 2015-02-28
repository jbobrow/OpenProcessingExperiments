
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer song;
Buildings newBuildings;
Street newStreet;
boolean on= false;
PImage bike;
PImage driver;
PImage car1;
PImage car2;
PImage car3;
PImage car4;
PImage car5;
PImage street;
PImage gameover;
float x1=100;
float x2=160;
float x4=230;
float x3=290;
float x5=340;
float y1=-50;
float y2=-50;
float y3=-50;
float y4=-50;
float y5=-50;
float w=50;
float h=100;
float wd=80;
float hd=100;
float speed1=random(2, 6);
float speed2=random(2, 6);
float speed3=random(2, 6);
float speed4=random(2, 6);
float speed5=random(2, 6);

void setup() {
  size(500, 700);
  minim= new Minim(this);
  song= minim.loadFile("song.mp3");
  song.loop();
  newBuildings = new Buildings();
  newStreet= new Street();
  gameover=loadImage("gameover.png");
  car1=loadImage("car1.png");
  car2=loadImage("car2.png");
  car3=loadImage("car3.png");
  car4=loadImage("car4.png");
  car5=loadImage("car5.png");
  driver=loadImage("driver.png");
  bike=loadImage("bike.png");
}

void draw() {
  background(0);
  noCursor();
  newStreet.display();
  newStreet.move();
  newStreet.move2();  
  image(bike, mouseX-40, constrain(mouseY, 350, 600), wd, hd);
  image(driver, mouseX-40, constrain(mouseY, 350, 600), wd, hd);
  if (y1 > height) {
    y1 = -50;
    speed1 = random(5, 10);
  }

  if (y2 > height) {
    y2 = -50;
    speed2 = random(5, 10);
  }

  if (y3 > height) {
    y3= -50;
    speed3 = random(5, 10);
  }

  if (y4 > height) {
    y4 = -50;
    speed4 = random(5, 10);
  }

  if (y5 > height) {
    y5 = -50;
    speed5 = random(5, 10);
  }

  if (on) {
    image(car1, x1, y1, w, h);
    y1+=speed1;
  }
  else {
    image(gameover, 0, 0, 500, 700);
  }
  if (mouseX > x1 && mouseX < x1+w && mouseY+20 > y1 && mouseY+20 < y1+h) {
    on=!on;
  }
  if (on) {
    image(car2, x2, y2, w, h);
    y2+=speed2;
  }
  else {
    image(gameover, 0, 0, 500, 700);
  }
  if (mouseX > x2 && mouseX < x2+w && mouseY+20 > y2 && mouseY+20 < y2+h) {
    on=!on;
  }
  if (on) {
    image(car3, x3, y3, w, h);
    y3+=speed3;
  }
  else {
    image(gameover, 0, 0, 500, 700);
  }
  if (mouseX > x3 && mouseX < x3+w && mouseY+20 > y3 && mouseY+20 < y3+h) {
    on=!on;
  }
  if (on) {
    image(car4, x4, y4, w, h);
    y4+=speed4;
  }
  else {
    image(gameover, 0, 0, 500, 700);
  }
  if (mouseX > x4 && mouseX < x4+w && mouseY+20 > y4 && mouseY+20 < y4+h) {
    on=!on;
  }
  if (on) {
    image(car5, x5, y5, w, h);
    y5+=speed5;
  }
  else {
    image(gameover, 0, 0, 500, 700);
  }
  if (on) {
    newBuildings.display();
    newBuildings.move1();
    newBuildings.move2();
    newBuildings.move3();
    newBuildings.move4();
    newBuildings.reset();
  }
  else {
    image(gameover, 0, 0, 500, 700);
  }
  if (mouseX+15 > 420 || mouseX-15 < 80) {
    on=!on;
  }
  if (mouseX+15 > 420 || mouseX-15 < 80) {
    image(gameover, 0, 0, 500, 700);
  }
  if (mouseX > x5 && mouseX < x5+w && mouseY > y5 && mouseY < y5+h) {
    on=!on;
  }
}

class Buildings {
  PImage buildings;
  PImage buildings2;
  PImage buildings3;
  PImage buildings4;
  int x;
  int y;
  int w;
  int h;
  int x2;
  int y2;
  int y3;
  int y4;
  int speed;

  Buildings() {
    buildings= loadImage("buildings.png");
    buildings2= loadImage("buildings2.png");
    buildings3= loadImage("buildings3.png");
    buildings4= loadImage("buildings4.png");
    x=-18;
    y=0;
    w=100;
    h=700;
    x2=418;
    y2=-700;
    y3=0;
    y4=-700;    
    speed=8;
  }

  void display() {
    image(buildings, x, y, w, h);
    image(buildings2, x, y2, w, h);
    image(buildings3, x2, y3, w, h);
    image(buildings4, x2, y4, w, h);
  }
  void move1() {
    y+=speed;
  }
  void move2() {
    y2+=speed;
  }
  void move3() {
    y3+=speed;
  }
  void move4() {
    y4+=speed;
  }
  void reset() {
    if (y > 700) {
      y = 0;
      speed = 8;
    }
    if (y2 > 0) {
      y2 = -700;
      speed = 8;
    }
    if (y3 > 700) {
      y3 = 0;
      speed = 8;
    }
    if (y4 > 0) {
      y4 = -700;
      speed = 8;
    }
  }
}

class Street {
  PImage street;
  PImage line;
  PImage line2;
  int y;
  int y2;
  int speed;

  Street() {
    street=loadImage("street.png");
    line=loadImage("line.png");
    line2=loadImage("line2.png");
    y=0;
    y2=-700;
    speed=8;
  }

  void display() {
    image(street, 80, 0, 340, 700);
    image(line, 240, y, 30, 700);
    image(line2, 240, y2, 30, 700);
  }
  
  void move(){
    y+=speed;
    if (y > 700) {
      y = 0;
      speed = 8;
    }
  }
  void move2(){
    y2+=speed;
    if (y2 > 0) {
      y2 = -700;
      speed = 8;
    }
  }
}



