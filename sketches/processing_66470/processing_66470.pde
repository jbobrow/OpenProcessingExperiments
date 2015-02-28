
Robot robot1;
Robot robot2;
Robot robot3;
Robot robot4;
Robot robot5;

 
void setup() {
 size(640, 480);
  robot1 = new Robot(320, 240, 100);
  robot2 = new Robot(320, 240, 150);
  robot3 = new Robot(320, 240, 200);
  robot4 = new Robot(320, 240, 100);
  robot5 = new Robot(320, 240, 200);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
}
 
void draw() {
  robot1.display();
  robot1.move();
  robot1.movement();
  robot2.display();
  robot2.move(); 
  robot2.movement();
  robot3.display();
  robot3.move();
  robot3.movement();
  robot4.display();
  robot4.move();
  robot4.movement();
  robot5.display();
  robot5.move();
  robot5.movement();
}

