
Circle[] circles;
Moop[] kelps;
int butter;
int re;
int me;
int dx;
int dy;
PImage shark;
PImage octopus;

void setup() {
  size(800, 800);
  smooth();
  butter=0;
  shark=loadImage("shark.png");
  octopus=loadImage("Octopus-tan.png");
  re=-150;
  me=400;
  dx=1;
  dy=1;
  circles = new Circle[1000];
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(width),random(height));
  }
  kelps = new Moop[1000];
  for (int i = 0; i < kelps.length; i++) {
    kelps[i] = new Moop(random(width),random(height));
  }
}

void draw() {
  image(shark, mouseX, mouseY);
  fill(0, butter, 86, 20);
  butter++;
  if (butter>100) {
    butter=1;
  }
  rect(0, 0, width, height);
  for (int i = 0; i < circles.length; i++) {
    circles[i].move();
    circles[i].display();
  }
  for(int i = 0; i < kelps.length; i++) {
    kelps[i].move();
    circles[i].display();
}
   re+=dx;
   image(octopus,re,me);
  if(re>800) {
    re=-150;
  }
}















class Circle {
  float x, y, directionx, directiony;
  PImage fish;
  Circle (float _x, float _y) { //constructer
    x=_x;
    y=_y+=1;
    directionx=5;
    directiony=5;
    fish = loadImage("fish.gif");
  }
  //methods
  void move() {
    x+=directionx;
    y+=directiony;
    if (y>800) {
      directiony=-5;
    }
    if (x>800) {
      directionx=-5;
    }
    if (y<1) {
      directiony=5;
    }
    if (x<1) {
      directionx=5;
    }
  }
  void display() {
    image(fish, x,y);
  }
}

class Moop {
  float x,y,directionx,directiony;
  PImage kelp;
  Moop(float _x, float _y) {
    x=_x;
    y=_y+=1;
    directionx=1;
    directiony=1;
    kelp=loadImage("seaweed2.gif");
  }
  void move() {
    x+=directionx;
    y+=directiony;
  }
  void dislpay(){
    image(kelp,x,y);
  }
}
  

