
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Song Youngjun
// ID: 201420083

boolean Shape = true;
boolean onOff = true;

float x = 0;
float y = 0;
float xL, yL, pxL, pyL;
float xSpeed = 2;
float ySpeed = 3;

void setup() {
  size (600, 600);
  smooth();
  background(#efffff);
}

void draw() {
  stroke(#FFD200, 30);
  noFill();
  x = x + xSpeed;
  y = y + ySpeed;

  if ((x > width) || (x < 0)) {
    xSpeed = xSpeed * -1;
  }
  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }

  if (Shape) {
    beginShape();
    vertex(x, y);
    vertex(y, x);
    vertex(xL, yL);
    endShape();
  }
  if (!Shape) {
    beginShape();
    vertex(width-x, y);
    vertex(y, x);
    vertex(pxL, pyL);
    endShape();
  }
  xL = lerp(0, mouseX, 0.5);
  yL = lerp(0, mouseY, 0.5);
  pxL = lerp(0, pmouseX, 0.5);
  pyL = lerp(0, pmouseY, 0.5);


  title();
}

void keyPressed() {
  if (key=='s') saveFrame("frames/frame_#####.jpg");
  if (key==' ') onOff = !onOff;
  if (onOff) loop();
  if (!onOff) noLoop();
  if (key=='c') background(#efffff);
  if (keyCode==UP) ySpeed += 0.1;
  if (keyCode==DOWN) ySpeed -= 0.1;
  if (keyCode==LEFT) xSpeed -= 0.1;
  if (keyCode==RIGHT) xSpeed += 0.1;
  if (key=='m') Shape = !Shape;
}

void title() {
  fill(127);
  textSize(10);
  textAlign(LEFT);
  text("S=save / M=Mirror / C=Clean / Space=On/Off / arrows=Speed", 20, height-20);
  textAlign(RIGHT);
  text("Song YoungJun, Drawing, Dynamic Media, 2014", width-20, height-20);
}

