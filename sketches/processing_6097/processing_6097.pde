

int numFrames = 42;  // The number of frames in the animation
int framePos = 0;
int frameNeg = 20;
PImage[] images = new PImage[numFrames];

PImage wtp, partybub, awesome;

float disco_ball;

Robot r1, r2;

float startTime;

void setup() {
  size(480, 320);
  stroke(255, 130);

  for(int i = 0; i < numFrames; i++) {    //loads walking frams
    String num = str(i);
    String w1 = "image";
    String w2 = num;
    String w3 = ".png";
    String walk = w1 + w2 + w3;
    images[i] = loadImage(walk);
  }

  r1 = new Robot(80,120,8);
  r2 = new Robot(80,120,8);
  wtp = loadImage("wtp.png");
  partybub = loadImage("party.png");
  awesome = loadImage("awesome.png");

  for(int i = 0; i < numOconfetti; i++) {
    c[i] = new Confetti();
  }
  timer = millis();

  startTime = millis();
  ellipseMode(CENTER);
}

void draw() {

  fill(0,210);
  rect(0,0,width,height);
  r1.display();
  r2.display();

  disco_ball = map(mouseY,0,320,0,100);

  float test = dist(r1.x,r1.y,r2.x,r2.y);
  if(millis()> startTime + 4000) {
    if(test<85) {
      r1.directionx *= -1;
      r2.directionx *= -1;
    }
  }

  pushMatrix();
  if(millis() > startTime + 10000) {
    translate(0,-3);
    for(int i = 0; i < numOconfetti; i++) {
      c[i].displayConfetti();
    }
  }
  popMatrix();

  //println(disco_ball);
}













