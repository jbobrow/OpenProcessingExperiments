
final int HAND_LENGTH = 120;
final int HAND_WIDTH = 6;
final int WRIST_RADIUS = 30;
final int CLOCK_RADIUS = 160;
final int RATE_OF_TIME = 1;

float secondAngle = 0;
float hourAngle = 0;
PFont f;

void setup() {
  smooth();
  size(400,400);
  ellipseMode(RADIUS);
  frameRate(60);
  noStroke();
  f = createFont("ArnoPro-Smbd", 32, true);
  textFont(f);
  textAlign(CENTER);
}

// 1 2 4 8
int FACE_RIM = 0x0001;
int FACE_DOTS = 0x0002;
int FACE_LINES = 0x0004;
int FACE_NUMBERS = 0x0008;

void drawClockFace(int faceFlags) {
    // Draw clock face
  if ((faceFlags & FACE_RIM) == FACE_RIM) {
    fill(15);
    ellipse(0,0, CLOCK_RADIUS + 5, CLOCK_RADIUS + 5);
  }
  fill(252);
  ellipse(0, 0, CLOCK_RADIUS, CLOCK_RADIUS);
  fill(15);
  for (int i = 0; i < 60; i++) {
    pushMatrix();
    rotate(radians(i * 6));
    if ((faceFlags & FACE_DOTS) == FACE_DOTS) {
      int r = (i % 5 == 0 ? 4 : 2);
      ellipse(CLOCK_RADIUS - 15, 0, r, r);
    }
    if ((faceFlags & FACE_LINES) == FACE_LINES) {
      int l = (i % 5 == 0 ? 30 : 15);
      rect(CLOCK_RADIUS - 10, -2, -l, 4); 
    }
    if ((faceFlags & FACE_NUMBERS) == FACE_NUMBERS) {
      if (i % 5 == 0) { 
        pushMatrix();
        translate(CLOCK_RADIUS - 45, 0);
        rotate(HALF_PI);
        text("" + ((i == 0 ? 60 : i) / 5), 0, 0);
        popMatrix();
      } 
    }
    popMatrix();
  }
}

void draw() {
  background(225);
  
  translate(200,200);
  rotate(-HALF_PI); // The unit circle starts at the right
  drawClockFace(FACE_RIM | FACE_DOTS);

  // Draw big hand
  drawHand(HAND_LENGTH, HAND_WIDTH, secondAngle, WRIST_RADIUS, color(11));
//  if (frameCount % (60.0 / RATE_OF_TIME) == 0) secondAngle += PI / 30; secondAngle = secondAngle % TWO_PI; 
  secondAngle += PI/(1800 / RATE_OF_TIME); 
  
//  drawHand(HAND_LENGTH - 50, HAND_WIDTH, hourAngle, WRIST_RADIUS, color(50));
//  hourAngle += PI/((1800 * 60) / RATE_OF_TIME);
}

void drawHand(int l, int w, float a, int r, color c) {
  pushMatrix();
  translate(-1 * r * cos(a), -1 * r * sin(a));
  rotate(a);
  fill(c);
  rect(0, -w/2, l + r, w);
  popMatrix();
}


