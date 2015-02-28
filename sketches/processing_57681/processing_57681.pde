
PImage landscape;

Robot bot1;
Robot bot2;

void setup() {
  size(720, 480);
  smooth();
  landscape = loadImage("alpine.png");
  ellipseMode(RADIUS);
  
  bot1 = new Robot(10, 50, 0.05, 0.5);
  bot2 = new Robot(100, 250, 0.02, 1);
  
}

void draw() {
  smooth();
  background(landscape);
  
  bot1.move();
  bot1.display();
  bot2.move();
  bot2.display();
  
}

