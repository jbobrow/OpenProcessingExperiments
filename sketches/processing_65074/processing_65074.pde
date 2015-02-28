
// 2 color ball in the world
// click button

import fisica.*;

FWorld world1, world2;
FBox boxButton;
color bodyColor = #6E0595;
int clickCount = 0;
PFont font;
float sideMargin = 25;

void setup() {
  size(400, 400);
  font = loadFont("ArialNarrow-48.vlw");
  smooth();
  Fisica.init(this);
  makeWorld();
}

void draw() {
  background(255);
  textFont(font, 20);
  fill(100);
  noStroke();
  text("Button", width/5, 80);
  
  world1.step();
  world1.draw();
  world2.step();
  world2.draw();
}

void makeWorld() {
  world1 = new FWorld();
  world1.setEdges();
  world1.setEdgesRestitution(0.0);
  world1.setGravity(0, 200);
  world1.remove(world1.right);

  world2 = new FWorld();
  world2.setEdges(0.0, 0.0, width, 3*height/4);
  world2.setEdgesRestitution(0.0);
  world2.setGravity(0, 200);
  world2.remove(world2.bottom);
  
  boxButton = new FBox(40, 40);
  boxButton.setPosition(width/4, 40);
  boxButton.setStatic(true);
  boxButton.setFillColor(bodyColor);
  boxButton.setNoStroke();
  world1.add(boxButton);

  FPoly r = new FPoly();
  r.vertex(width, 0);
  r.vertex(width, height/2-50);
  r.vertex(width/4+sideMargin, height/2-50);
  r.vertex(width/4+sideMargin, height/2-60);
  r.vertex(4*width/5+sideMargin, 40);
  r.vertex(4*width/5+sideMargin, 0);
  r.setStatic(true);
  r.setFill(0);
  r.setFriction(1);
  world1.add(r);  

  FPoly l = new FPoly();
  l.vertex(width, 0);
  l.vertex(width, 10);
  l.vertex(10, 10);
  l.vertex(10, height/2);
  l.vertex(3*width/5, height-80);
  l.vertex(width, height-80);
  l.vertex(width, height);
  l.vertex(0, height);
  l.vertex(0, 0);
  l.setStatic(true);
  l.setFill(color(255, 255, 255, 0));
  l.setFriction(1);
  world1.add(l);  

  FPoly r2 = new FPoly();
  r2.vertex(width, 0);
  r2.vertex(width, height/2-50);
  r2.vertex(width/4+sideMargin, height/2-50);
  r2.vertex(width/4+sideMargin, height/2-60);
  r2.vertex(4*width/5+sideMargin, 40);
  r2.vertex(4*width/5+sideMargin, 0);
  r2.setStatic(true);
  r2.setFill(0);
  r2.setFriction(1);
  world2.add(r2);  

  FPoly l2 = new FPoly();
  l2.vertex(width, 0);
  l2.vertex(width, 10);
  l2.vertex(10, 10);
  l2.vertex(10, height/2);
  l2.vertex(3*width/5, height-80);
  l2.vertex(width-120, height-80);
  l2.vertex(width-120, height);
  l2.vertex(0, height);
  l2.vertex(0, 0);
  l2.setStatic(true);
  l2.setFill(0);
  l2.setFriction(1);
  world2.add(l2);  

  FPoly r3 = new FPoly();
  r3.vertex(width, height-80);
  r3.vertex(width, height);
  r3.vertex(width-80, height);
  r3.vertex(width-80, height-80);
  r3.setStatic(true);
  r3.setFill(0);
  r3.setFriction(1);
  world2.add(r3);  
}

void mousePressed() {
  
  FBody pressed = world1.getBody(mouseX, mouseY);
  if (pressed == boxButton) {

    clickCount++;

    FCircle myCircle = new FCircle(40);
    myCircle.setPosition(3*width/4, 10);
    myCircle.setRotation(random(TWO_PI));
//    myCircle.setVelocity(0, 200);
    myCircle.setNoStroke();

    FCircle myCircle2 = new FCircle(40);
    myCircle2.setPosition(3*width/4, 10);
    myCircle2.setRotation(random(TWO_PI));
//    myCircle2.setVelocity(0, 200);
    myCircle2.setNoStroke();

    switch( clickCount )
    {
    case 1:
        myCircle.setFillColor(#FF0000);
        myCircle2.setFillColor(color(255, 255, 255, 0));
        world1.add(myCircle);
        world2.add(myCircle2);
        break;
    case 2:
        myCircle.setFillColor(color(255, 255, 255, 0));
        myCircle2.setFillColor(#0000FF);
        world1.add(myCircle);
        world2.add(myCircle2);
        break;            
    }
    if( clickCount == 2 ) {
      clickCount = 0;
    }
  }
}

void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}
  

