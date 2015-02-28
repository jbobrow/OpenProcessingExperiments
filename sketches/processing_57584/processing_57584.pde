
PImage img;

Robot bot1;
Robot bot2;
Robot bot3;
Robot bot4;

void setup() {
  size(600, 600);
  smooth();
  background(255);
  
  bot1 = new Robot(0, 0, 0.05, 0.5);
  bot2 = new Robot(-100,-50, 0.02, 1);
  bot3 = new Robot(-50,-100, 0.08, 0.75);
  bot4 = new Robot(width/2,height/2,0,1.4);
  
  img = loadImage("outerspace.jpg");
}

void draw() {
  image(img,0,0);
  
  bot1.move();
  bot1.display();
  bot2.move();
  bot2.display();
  bot3.move();
  bot3.display();
  bot4.display();
}




