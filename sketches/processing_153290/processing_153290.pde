
PVector center;
PFont font;
PImage img;

int dotCounter = 0;
int inCounter = 0;


void setup() {

  size(500, 500);
  background(255);
  font = loadFont("sample.vlw");
  center = new PVector(width/2, height/2);
}


void draw() {
  if (img==null) {
    background(255);
  } else {
    image(img, 0, 0);
  }

  drawCircle();
  randomShoot();
  img = get(0, 0, width, height);
  countUp();

  if (dotCounter==99999) {
    noLoop();
  }

//  saveFrame("render/render_####.jpg");
}


void randomShoot() {
  PVector dot = new PVector(random(width), random(height));
  if (PVector.dist(dot, center)<250) {
    strokeWeight(4);
    stroke(192, 0, 0);
    inCounter++;
  } else {
    strokeWeight(2);
    stroke(0, 0, 128);
  }
  point(dot.x, dot.y);
  dotCounter++;
}


void drawCircle() {
  noFill();
  strokeWeight(0.5);
  stroke(192);
  ellipse(width/2, height/2, width, height);
}


void countUp() {
  fill(255, 216);
  noStroke();
  rect(300, 300, 200, 200);

  textFont(font);
  textSize(12);

  fill(0);
  textAlign(RIGHT);
  text("all dots = "+nf(dotCounter, 5), 480, 420);
  fill(255, 0, 0);
  text("inside dots = "+nf(inCounter, 5), 480, 400);

  fill(64);
  textAlign(LEFT);
  text("inside : all = PI : 4", 320, 330);
  text("PI = 4 * inside / all", 320, 350);
  text("PI = "+4*float(inCounter)/float(dotCounter, 6), 320, 370);
}

