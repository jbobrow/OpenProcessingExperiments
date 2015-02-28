

import fisica.*;

final int BLUE = -0;
final int RED= -1;

int score;

PFont font;

FWorld world;
FBox pala;
FBox bottomEdge;

float blueness;
float redness;

void setup() {
  size(400, 400);
  smooth();

  Fisica.init(this);

  world = new FWorld();

  pala = new FBox(50, 20);
  pala.setPosition(width/2, height - 40);
  pala.setStatic(true);
  pala.setFill(0);
  pala.setNoStroke();
  pala.setRestitution(0);
  world.add(pala);
  
  bottomEdge = new FBox(800, 50);
  bottomEdge.setPosition(width/2, height + 100);
  bottomEdge.setStatic(true);
  bottomEdge.setRestitution(0);
  world.add(bottomEdge);
  
  
  font = loadFont("font.vlw");
  textFont(font, 64);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);

  if (frameCount % 8 == 0) {
    float size =random(5, 20);
    FCircle b = new FCircle(size);
    b.setPosition(random(0+10, width-10), -50);
    b.setVelocity(0, 150 + size*10);
    b.setRestitution(0);
    b.setNoStroke();
    if ( random(10) > 5 ) {
      b.setFill(255, 0, 0);
      b.setGroupIndex(RED);
    } 
    else {
      b.setFill(0, 0, 255);
      b.setGroupIndex(BLUE);
    }
    world.add(b);
  }

  redness = max(redness - 2, 0);
  blueness = max(blueness - 2, 0);  
  
  
  pala.setFill(redness, 0, blueness);

  pala.setPosition(mouseX, height - 40);

  world.draw();
  world.step();

  fill(0);
  text(score, width-50, 50);
  
  
}

void contactStarted(FContact c) {
  
  FCircle ball = null;
  
  // Check if ball hits the "pala"
  if (c.getBody1() == pala) {
    ball = (FCircle) c.getBody2();
  } 
  else if (c.getBody2() == pala) {
    ball = (FCircle) c.getBody1();
  }

  if (ball != null) {
    if ( ball.getGroupIndex() == BLUE ) {
      score = score + 1;
      blueness = 255;
    } 
    else if ( ball.getGroupIndex() == RED ) {
      score = score - 1;
      redness = 255;
    } 
    world.remove(ball);
  }
  
  // Check if ball hits the "bottom edge"
   if (c.getBody1() == bottomEdge) {
    ball = (FCircle) c.getBody2();
  } 
  else if (c.getBody2() == bottomEdge) {
    ball = (FCircle) c.getBody1();
  }
  
  if (ball != null) {
    
    world.remove(ball);
  }
  
}


