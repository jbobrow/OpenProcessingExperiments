
import fisica.*;

FWorld world;

void setup() {
  size(500,500);
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();
}

void draw() {
  background(255);
  world.step();
  world.draw();
}

void mousePressed() {
  int i = int(random(8));
  switch(i) {
  case 1:
    FPoly myPoly = new FPoly();
    myPoly.vertex(0, 0);
    myPoly.vertex(0, 80);
    myPoly.vertex(20, 80);
    myPoly.vertex(20, 0);
    myPoly.setFill(204,0,0);
    myPoly.setPosition(mouseX, mouseY);
    myPoly.setRotation(random(50));
    myPoly.setVelocity(0, 200);
    myPoly.setNoStroke();
    world.add(myPoly);
    break;
  case 2:
    FPoly myPoly2 = new FPoly();
    myPoly2.vertex(0, 0);
    myPoly2.vertex(0, 40);
    myPoly2.vertex(40, 40);
    myPoly2.vertex(40, 0);
    myPoly2.setFill(102,204,255);
    myPoly2.setPosition(mouseX, mouseY);
    myPoly2.setRotation(random(50));
    myPoly2.setVelocity(0, 200);
    myPoly2.setNoStroke();
    world.add(myPoly2);
    break;
  case 3:
    FPoly myPoly3 = new FPoly();
    myPoly3.vertex(0, 0);
    myPoly3.vertex(0, 60);
    myPoly3.vertex(20, 60);
    myPoly3.vertex(20, 40);
    myPoly3.vertex(40, 40);
    myPoly3.vertex(40, 20);
    myPoly3.vertex(20, 20);
    myPoly3.vertex(20, 0);
    myPoly3.setFill(210,180,140);
    myPoly3.setPosition(mouseX, mouseY);
    myPoly3.setRotation(random(50));
    myPoly3.setVelocity(0, 200);
    myPoly3.setNoStroke();
    world.add(myPoly3);
    break;
  case 4:
    FPoly myPoly4 = new FPoly();
    myPoly4.vertex(0, 0);
    myPoly4.vertex(0, 60);
    myPoly4.vertex(20, 60);
    myPoly4.vertex(20, 20);
    myPoly4.vertex(40, 20);
    myPoly4.vertex(40, 0);
    myPoly4.setFill(255,255,0);
    myPoly4.setPosition(mouseX, mouseY);
    myPoly4.setRotation(random(50));
    myPoly4.setVelocity(0, 200);
    myPoly4.setNoStroke();
    world.add(myPoly4);
    break;
  case 5:
    FPoly myPoly5 = new FPoly();
    myPoly5.vertex(0, 0);
    myPoly5.vertex(0, 60);
    myPoly5.vertex(40, 60);
    myPoly5.vertex(40, 40);
    myPoly5.vertex(20, 40);
    myPoly5.vertex(20, 0);
    myPoly5.setFill(51,153,255);
    myPoly5.setPosition(mouseX, mouseY);
    myPoly5.setRotation(random(50));
    myPoly5.setVelocity(0, 200);
    myPoly5.setNoStroke();
    world.add(myPoly5);
    break;
      case 6:
    FPoly myPoly6 = new FPoly();
    myPoly6.vertex(0, 0);
    myPoly6.vertex(0, 40);
    myPoly6.vertex(20, 40);
    myPoly6.vertex(20, 60);
    myPoly6.vertex(40, 60);
    myPoly6.vertex(40, 20);
    myPoly6.vertex(20, 20);
    myPoly6.vertex(20, 0);
    myPoly6.setFill(255,102,0);
    myPoly6.setPosition(mouseX, mouseY);
    myPoly6.setRotation(random(50));
    myPoly6.setVelocity(0, 200);
    myPoly6.setNoStroke();
    world.add(myPoly6);
    break;
      case 7:
    FPoly myPoly7 = new FPoly();
    myPoly7.vertex(0, 20);
    myPoly7.vertex(0, 60);
    myPoly7.vertex(20, 60);
    myPoly7.vertex(20, 40);
    myPoly7.vertex(40, 40);
    myPoly7.vertex(40, 0);
    myPoly7.vertex(20, 0);
    myPoly7.vertex(20, 20);
    myPoly7.setFill(51,51,153);
    myPoly7.setPosition(mouseX, mouseY);
    myPoly7.setRotation(random(50));
    myPoly7.setVelocity(0, 200);
    myPoly7.setNoStroke();
    world.add(myPoly7);
    break;
  }
}


