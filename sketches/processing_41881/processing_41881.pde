

float ballx = 0;
float bally = 0;
int y = 530;
int x = 470;
float a = 50;
boolean hit = false;
boolean goalscored = false;
float power = random(1, 10);
float dip = random(1, 10);
boolean shotdone = false;
boolean finished = false;

void setup() {
  size (600, 600);
  frameRate(400);
  PFont font;
  font = loadFont("Andy-Bold-48.vlw");
  textFont(font, 70);
}

void draw() {
  background (0);
  fill(67, 40, 23);
  ellipse(500, 300, 75, 75);
  stroke(255);
  strokeWeight(15);
  line(50, 300, 50, 530);
  line(50, 300, 200, 250);
  line(200, 250, 200, 450);
  stroke(67, 40, 23);
  line(500, 300, 500, 450);
  line(450, 375, 550, 375);
  line(500, 450, 530, 530);
  line(500, 450, 470, 530);
  fill(255);
  decision();
  shot();
  msg();
}

void decision() {
  if (ballx<470 && hit == false) {
    a = 50;
    noStroke();
    ellipse(ballx, bally, 50, 50);
    ballx+=cos(radians(a))*2;
    bally+=sin(radians(a))*1.8;
    a = 250;
  }
  else {
    hit = true;
  }
}  

void shot() {
  noStroke();
  if (hit==true && ballx > 0 && bally<=530) {
    if (ballx>46 && ballx<54) {
      if (bally<=529 && bally >=300) {
        goalscored = true;
      }
      else {
        shotdone = true;
        msg();
      }
    }
    ellipse(ballx, bally, 50, 50);
    ballx+=cos(radians(a))*power;
    bally+=sin(radians(a))*dip;
    a--;
  }

  else {
    ellipse(ballx, bally, 50, 50);
    if (goalscored == false && shotdone == false && bally >=530) {
      text("?...", 100, 200);
    }
  }
}

void msg() {
  if (goalscored == true) {
    fill(random(256), random(256), random(256));
    text("GOAL!!!", random(95, 105), random (195, 205));
  }
  if (shotdone == true && goalscored == false) {
    text("What a miss...", random(95, 105), random (195, 205));
  }
}


