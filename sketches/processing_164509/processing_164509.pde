
import fisica.*;
FWorld world;
FCircle ball;
FBox vbox;
PFont f;

void world1() {

  size(640, 480);
  smooth();

  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
  world.setEdges();


  vbox = new FBox(40, 400);
  vbox.setPosition(400, 150);
  vbox.setFill(128);
  vbox.setStroke(255);

  world.add(vbox);

  FBox sbox = new FBox(10, 10);
  sbox.setPosition(300, 460);
  sbox.setStatic(true);
  sbox.setGrabbable(false);
  world.add(sbox);

  ball = new FCircle(50);
  ball.setGrabbable(false);
  ball.setPosition(50, 50);
  ball.setFill(30, 120, 200, 250);
  world.add(ball);
}

void setup() {
  f = createFont("Georgia", 12);
  textFont(f);
  world1();
}

void draw() {

  background(0);
  fill(255, 0, 0, 191);
  ellipse(610, 450, 50, 50);
  fill(220);
  text("Press 'space' to start", 500, 30);


  world.draw(this);
  world.step();
  ball.setStatic(true);
  fill(220);

  if (key == ' ') {

    ball.setStatic(false);

    if (ball.isSleeping() == true) {
      text("Press 'r' to reset", 500, 50);
    }
  } else if (key == 'r') {
    ball.setStatic(true);
    ball.setPosition(50, 50);

    text("Press 'space' to start", 500, 30);
  }

  if (ball.getX() >= 605) {
    textSize(22);
    text("Hooray!", 200, 200);
    textSize(12);
    // ball.setPosition(50, 50);
 //   ball.setStatic(true);
    text("Press 'r' to reset", 500, 50);
  }
}



