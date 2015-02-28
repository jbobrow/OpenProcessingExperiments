
// color4world
// testing: 4 FWorld,  Gravity,  color(global)

import fisica.*;

// Setup Body
FWorld world1, world2, world3, world4;
FBox box1, box2;
FCircle ball1, ball2;
float wd50, ht50;
float topX, topY;
int cnt = 0;
int r = 10;
int g = 128;
int b = 6;
color boxColor = #0A8006;
color ballColor = #FFFFFF;


void setup()
{
  size(400, 400);
  smooth();

  // initialize
  wd50 = width / 2;
  ht50 = height / 2;
  topX = 0.0;
  topY = 0.0;

  Fisica.init(this);

  // make FWorld
  makeWorld();

  // make FBody add to world 
  makeBody();
}

void draw()
{
  background(0);

  world1.step();
  world1.draw();

  world2.step();
  world2.draw();

  world3.step();
  world3.draw();

  world4.step();
  world4.draw();
}

void makeWorld() {
  world1 = new FWorld();
  world1.setEdges(topX, topY, (topX + wd50), (topY + ht50), color(0, 0));
  world1.setEdgesRestitution(0.0);
  world1.setGravity(0, -100);

  world2 = new FWorld();
  world2.setEdges((topX + wd50), topY, (topX + width), (topY + ht50), color(0, 0));
  world2.setEdgesRestitution(0.0);

  world3 = new FWorld();
  world3.setEdges(topX, (topY + ht50), (topX + wd50), (topY + height), color(0, 0));
  world3.setEdgesRestitution(0.0);
  world3.setGravity(-100, 120);

  world4 = new FWorld();
  world4.setEdges((topX + wd50), (topY + ht50), (topX + width), (topY + height), color(0, 0));
  world4.setEdgesRestitution(0.0);
  world4.remove(world4.top);
  world4.setGravity(0, -200);
}

void makeBody() {
  box1 = new FBox(40, 40);
  box1.setPosition(width/4, height/4);
  box1.setFillColor(boxColor);
  box1.setStatic(true);
  world1.add(box1);

  ball1 = new FCircle(40);
  ball1.setPosition(3*width/4, height/4);
  ball1.setFillColor(ballColor);
  ball1.setStatic(true);
  ball1.setNoStroke();
  world2.add(ball1);

  ball2 = new FCircle(40);
  ball2.setPosition(width/4, 3*height/4);
  ball2.setFillColor(ballColor);
  ball2.setStatic(true);
  ball2.setNoStroke();
  world3.add(ball2);

  box2 = new FBox(40, 40);
  box2.setPosition(3*width/4, 3*height/4);
  box2.setFillColor(boxColor);
  box2.setStatic(true);
  world4.add(box2);
}

void mousePressed() {
  FBody pressed1 = world1.getBody(mouseX, mouseY);
  FBody pressed2 = world2.getBody(mouseX, mouseY);
  FBody pressed3 = world3.getBody(mouseX, mouseY);
  FBody pressed4 = world4.getBody(mouseX, mouseY);
  if (( pressed1 == box1 ) || ( pressed2 == ball1 ) || ( pressed3 == ball2 ) || ( pressed4 == box2 )){
    makeCube();
  }
  cnt+=10;
}

void makeCube() {
  {
    FBox myBox = new FBox(20, 20);
    myBox.setPosition(width/4, 0);
    myBox.setVelocity(0, 200);
    myBox.setFillColor(#FFFFFF);
    myBox.setFillColor(color(cnt, cnt, 100));
    myBox.setNoStroke();
    world1.add(myBox);
  } 
  {
    FBox myBox = new FBox(20, 20);
    myBox.setPosition(3*width/4, 0);
    myBox.setVelocity(0, 200);
    myBox.setFillColor(color(100, 100, cnt));
    myBox.setNoStroke();
    world2.add(myBox);
  } 
  {
    FBox myBox = new FBox(20, 20);
    myBox.setPosition(width/4, height/2);
    myBox.setVelocity(0, 200);
    myBox.setFillColor(color(cnt, 100, 100));
    myBox.setNoStroke();
    world3.add(myBox);
  } 
  {
    FBox myBox = new FBox(20, 20);
    myBox.setPosition(3*width/4, height/2);
    myBox.setVelocity(0, 200);
    myBox.setFillColor(#FFFFFF);
    myBox.setNoStroke();
    world4.add(myBox);
  } 
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}
  

