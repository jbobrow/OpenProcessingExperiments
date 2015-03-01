
 Car suv;
Quad bob;
Gun machinegun;
PImage backgroundImage;
PImage copter;
PImage escalade;
int y=0;
float speed_grass;
Cloud[]clouds=new Cloud[9];
PImage multicopterWin;
PImage carWin;
int gameState = 0;
Animated_Car suvswerve;
Bomb warhead;
int acx = 10000;

void setup() {

  backgroundImage=loadImage("bp1.jpg");
  suv = new Car(0, 650);
  machinegun = new Gun(suv.x, 650);
  bob=new Quad(0, 0);
  warhead = new Bomb(bob.x, bob.y);
  copter=loadImage("quadright.png"); 
  escalade=loadImage("escalade.png");
  suvswerve = new Animated_Car("EscaladeAnimationOrder/escalade_scene", 13);
  multicopterWin=loadImage("explosion.jpg");
  frameRate(15);
  size(1000, 800);


  for (int i=0; i<clouds.length; i++) {
    clouds[i]=new Cloud(random(200, width), 50+(int)random(20, 100));
  }
  multicopterWin=loadImage("explosion.jpg");
  carWin=loadImage("multicopter.jpg");
}
void draw() {
//  println(bob.x, bob.y);
  bob.move();
  warhead.display();
  machinegun.display();

  suv.display();
  suvswerve.display(acx, 650);
  if (gameState == 0) {
    drawSplashScreen();
    if (keyPressed && key == ' ') {
      gameState = 1;
    }
  }

  if (gameState == 1) {
    background(22, 174, 244);
    fill(#4AF716);
    drawGameBackground();
    for (int i=0; i<clouds.length; i++) {
      textAlign(CENTER);
      clouds[i].display();
      clouds[i].move();
    }
  }
  if (gameState == 2) {
    drawMulticopterWin();
  }
  if (gameState == 3) {
    drawCarWin();
  }


  if (suv.didHitCar(warhead.x, warhead.y)) {
    acx = suv.x;
    suv.x = 10000;
    gameState=2;
    //println(frame);
  }
  if (acx < width) {
    if (suvswerve.frame == 12) {
      //println("asdkjfsldkfj");
      suv.x = acx;
      acx = 10000;
    }
  }

  if (bob.didHitQuad(machinegun.x, machinegun.y)) {
    //tintCopterRed
    gameState = 3;
  }

  if (keyPressed) {
    if (keyCode == RIGHT) {
      suv.x += suv.speed;
      acx += suv.speed;
    }
    if (keyCode == LEFT) {
      suv.x -= suv.speed;
      acx -= suv.speed;
    }
  }
  bob.drawQuad();
  bob.move();
  warhead.display();
}

void keyPressed() {
  if (key == ' ' ) {
    warhead.x=bob.x;
    warhead.y=bob.y;
  }
}
void drawGameBackground() {

  textAlign(CENTER);
  noStroke();
  background(#A6E8EA);
  fill(#25BF3D);
  //grass
  for (int x=0; x<width; x+=2) {  
    stroke(10, random(150, 240), 20);
    strokeWeight(random(1, 4));
    line(x, height, x+random(-4, 5), 675);
  }
}
void drawSplashScreen() {
  textAlign(CENTER);
  imageMode(CENTER);
  image(backgroundImage, width/2, height/2);
  image(copter, 800, 200);
  image(escalade, 150, 740);
  escalade.resize(width/4, height/8);
  textSize(100);
  text("Multicopter vs. Car", width/2, height/2-20);
  textSize(50);
  text("By:IMAJ", width/2, height/2+50);
}
void drawCarWin() {
  background(0);
  textAlign(CENTER);
  fill(#F20000);
  text("Car Wins", width/2, 100);
  textSize(100);
  imageMode(CENTER);
  image(carWin, width/2, height/2);
}
void drawMulticopterWin() {
  background(0);
  textAlign(CENTER);
  textSize(100);
  fill(#710000);
  stroke(#F05B16);
  text("Multicopter Wins", width/2, 90);

  textSize(100);
  imageMode(CENTER);
  image(multicopterWin, width/2, height/2);
}


class Animated_Car{

PImage[] images;
int imageCount;
int frame;

Animated_Car(String imagePrefix, int count){
  imageCount = count;
  images = new PImage[imageCount];
  
  for(int i = 0; i < imageCount; i++){
    String swerveCar = imagePrefix + (i) + ".png";
    images[i] = loadImage(swerveCar);
  }
}

void display(int nx, int ny){
  frame = (frame+1) % imageCount;
}

int getWidth(){
  return images[0].width;
}
}

class Car {

  int x = 0;
  int y = height-135;
  PImage escalade;
  float speed;


  Car(int nx, int ny) {
    x = nx;
    y = ny;
    escalade = loadImage("EscaladeAnimationOrder/escalade_scene0.png");
    speed = 6;
  }

  boolean didHitCar(float bx, float by) {
    float distX = x+20-bx;
    float distY = y+20-by;
    if (abs(distX) < 100 && abs(distY) < 40) {
      return true;
    } else return false;

  }

  void display() {
    escalade.resize(214, 80);
    image(escalade, x, y);
  }
}

class Cloud{
  float x,y;
  color c;
  float speed;

  Cloud(float nx, float ny){
    x=nx;
    y=ny;
    c=color(255);

   
  }
  void move(){
      speed=1;
    x-=speed;
    if(x<-20)x=1500;
  }
  
  void display(){
    
    rectMode(CENTER);
    fill(c);
    stroke(c);

   ellipse(x,y,35,35);
 ellipse(x+20,y,35,35);
 ellipse(x+40,y+5,35,35);
 ellipse(x+30,y+20,35,35);
 ellipse(x+10,y+20,35,35);
 ellipse(x-5,y+10,35,35);

  }
}

class Gun{
  int x;
  int y;
  float speed;
  Gun(int nx, int ny){
    nx=x;
    ny=y;
    speed=10;
  }
  void display(){
    if(keyCode == 'p'){
      if(y>0){
        y-=speed;
      }
       fill(0);
        ellipse(x,y,5,5);
    }
  }
}
class Quad {
  int x;
  int y;
  PImage quad;
  PImage quadleft;
  PImage quadright;
  PImage bat;
  PImage batleft;
  PImage batright;

  Quad(int nx, int ny) {
    x = nx;
    y = ny;
    quad = loadImage("quad.png");
    quadleft = loadImage("quadleft.png");
    quadright = loadImage("quadright.png");
  }

  void move() {
    if (keyPressed) {
      if (key == 'w') {
        y -= 7;
      } else if (key == 'd') {
        x += 10;
      } else if (key == 'a') {
        x -= 10;
      } else  if (key == 's') {
        y += 7;
      }
    }
  }

   boolean didHitQuad(float bx, float by){
   float distX = x+125-bx;
   float distY = y+125-by;
   if(abs(distX) < 125 && abs(distY) < 40){
     return true;
   }
   else return false;
   }
  void drawQuad() {
    quad.resize(250, 250);
    quadleft.resize(250, 250);
    quadright.resize(250, 250);
    if (keyPressed && key == 'd') {
      image(quadright, x, y);
    } else if (keyPressed && key == 'a') {
      image(quadleft, x, y);
    } else {
      image(quad, x, y);
    }
  }
}


class Bomb {
  int x, y;
  float speed;
  Bomb(int nx, int ny){
    x = nx;
    y = ny;
    speed = 10;
  }
  void display(){
    if (y<height && keyCode == ' '){
      y+=speed;
  }
  fill(0);
  noStroke();
  ellipse(x, y, 10, 10);

  }
}



