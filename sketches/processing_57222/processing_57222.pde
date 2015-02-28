
Circle[] circles;
int butter;
PImage shark;

void setup() {
  size(800, 800);
  smooth();
  butter=0;
  shark=loadImage("shark.png");
  circles = new Circle[1000];
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(random(width), random(height));
  }
}

void draw() {
  image(shark, mouseX, mouseY);
  fill(0, 0, butter, 10);
  butter++;
  if (butter>180) {
    butter=5;
  }
  rect(0, 0, width, height);
  for (int i = 0; i < circles.length; i++) {
    circles[i].move();
    circles[i].display();
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
    image(fish, x, y);
  }
}


