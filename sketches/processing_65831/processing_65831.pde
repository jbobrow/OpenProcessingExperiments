
Robot face1;
Robot face2;
Robot face3;
 
  
void setup() {
 size(640, 480);
  smooth();
  rectMode(CENTER);
  face1 = new Robot(random(width), random(height), random(0.1, 1), random(10, 255));
  face2 = new Robot(random(width), random(height), random(0.1, 1), random(10, 255));
  face3 = new Robot(random(width), random(height), random(0.1, 1), random(10, 255));
 
}
  
void draw() {
  background(255);
  face1.moveArm();
  face1.moveEye();
  face1.move();
  face1.display();
  face2.moveArm();
  face2.moveEye();
  face2.move();
  face2.display();
  face3.moveArm();
  face3.moveEye();
  face3.move();
  face3.display();
}


