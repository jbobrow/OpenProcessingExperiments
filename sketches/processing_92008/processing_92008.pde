

float speed=8;

void setup() {
  size(400, 600, P3D);
  //noFill();
}

void draw() {
  background(0);
  stroke(0);

  translate(width/2, height/2, 0);
  rotateY(radians(frameCount));
  //rotateX(radians(-mouseY));
  //rotateY(radians(mouseX));

  stroke(255);
  strokeWeight(4);

  pushMatrix(); //BODY
  noFill();
  fill(255);
  scale(0.9, 2, .5);
  box(50);
  popMatrix();

  pushMatrix(); //Ear
  noFill();
  fill(0);
  translate(30, -75, 0);
  scale(0.2, 0.3, 0.2);
  box(50);
  popMatrix();

  pushMatrix(); //Ear2
  noFill();
  fill(0);
  translate(-30, -75, 0);
  scale(0.2, 0.3, 0.2);
  box(50);
  popMatrix();

  pushMatrix(); //Eye
  noFill();
  fill(0);
  translate(10, -80, 25);
  scale(0.3, 0.3, 0.3);
  scale(1, sin(radians(frameCount)), 1);
  box(50);
  popMatrix();

  pushMatrix(); //Eye2
  noFill();
  fill(0);
  translate(-10, -80, 25);
  scale(0.3, 0.3, 0.3);
  scale(1, sin(radians(frameCount)), 1);
  box(50);
  popMatrix();

  pushMatrix(); // ARM
  noFill();
  fill(255, 200, 0);
  translate(40, -25, 0);
  translate(0, -20, 0);
  rotateX(-sin(radians(frameCount*speed)));
  pushMatrix();
  translate(0, 45);
  rotateX(-sin(radians(frameCount*speed))+1);
  translate(0, 25);
  scale(.6, .9, .8/1.5);
  box(50);
  popMatrix();
  translate(0, 20, 0);
  scale(.5, 1.8/2, .8/2);
  rotateZ(radians(80));
  box(50);

  popMatrix();

  pushMatrix(); // ARM2
  noFill();
  fill(255, 200, 0);
  translate(-40, -25, 0);
  translate(0, -20, 0);
  rotateX(sin(radians(frameCount*speed)));
  pushMatrix();
  translate(0, 45);
  rotateX(sin(radians(frameCount*speed))+1);
  translate(0, 25);
  scale(.6, .9, .8/1.5);
  box(50);
  popMatrix();
  translate(0, 20, 0);
  scale(.5, 1.8/2, .8/2);
  rotateZ(radians(-80));
  box(50);
  popMatrix();


  pushMatrix(); //HEAD
  noFill();
  translate(0, -75, 0);
  fill(255, 50, 0);
  box(50);
  popMatrix();

  pushMatrix(); //LEG
  noFill();
  fill(0, 100, 255);
  translate(18, 70, 0);
  translate(0, -30, 0);
  rotateX(sin(radians(frameCount*speed)));
  pushMatrix();
  translate(0, 50);
  rotateX(-sin(radians(frameCount*speed))-1);
  translate(0, 35);
  scale(.5, 1.2, .8/1.5);
  box(50);
  popMatrix();
  translate(0, 30, 0);
  scale(.4, 2/2, .4);
  rotateZ(radians(80));
  box(50);
  popMatrix();

  pushMatrix(); //LEG2
  noFill();
  fill(0, 100, 255);
  translate(-18, 70, 0);
  translate(0, -30, 0);
  rotateX(-sin(radians(frameCount*speed)));
  pushMatrix();
  translate(0, 50);
  rotateX(sin(radians(frameCount*speed))-1);
  translate(0, 35);
  scale(.5, 1.2, .8/1.5);
  box(50);
  popMatrix();
  translate(0, 30, 0);
  scale(.4, 2/2, .8/1.5);
  rotateZ(radians(-80));
  box(50);
  popMatrix();
}



