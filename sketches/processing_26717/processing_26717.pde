
import fisica.*;

FWorld world;
int boxCount = 10;
float ballHeight = 400;
float xPos = 250;
FCircle ball;

void setup() {
  size(500,500);
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setEdges();

  ball = new FCircle(50);
  ball.setPosition(xPos,ballHeight);
  ball.setRestitution(.5);
  ball.setFill(0);
  world.add(ball);

  for (int i=0; i<boxCount; i++) {
    FBox b = new FBox(50,50);
    b.setPosition(map(i,0,boxCount-1,25,475),height*19/20);
    b.setStatic(true);
    b.setFill(255);
    world.add(b);
  }
}

void draw() {
  background(255);

  world.step();
  world.draw();
}

void keyPressed() {
  //  if (ball.getY()>=400) {
  switch(keyCode) {
  case RIGHT:
    ball.adjustVelocity(20,0);
    break;
  case LEFT:
    ball.adjustVelocity(-20,0);
    break;
  case UP:
    ball.adjustVelocity(0,-50);
    break;
    //    }
  }
}

void contactStarted(FContact c) {
  FBody note = null;
  if(c.getBody1() == ball) {
    note = c.getBody2();
  }
  else if (c.getBody2()==ball) {
    note=c.getBody1();
  }
  if (note == null) {
    return;
  }

  note.setFill(50);
}


void contactEnded(FContact c) {
  FBody note = null;
  if (c.getBody1() == ball) {
    note = c.getBody2();
  }
  else if( c.getBody2() == ball) {
  note = c.getBody1();
  }

if (note ==null){
return;
}

note.setFill(255);
}


