
ArrayList<PVector> dots;
int dotsIn, speed;
final PVector origin = new PVector(0, 0);
boolean paused;

void setup() {
  size(500, 530);
  dots = new ArrayList<PVector>();
  dotsIn = 0;
  speed=1;
  paused = false;
  textSize(16);
}

void draw() {
  background(0xFFFF0000);
  textAlign(LEFT, BOTTOM);
  fill(0);
  double piApprox = 4.0*dotsIn/dots.size();
  text("\u03C0 \u2248 " + (dots.isEmpty()?"":piApprox), 0, height-10);
  text("Dots/frame: " + ((int)speed), width/2, height-10);
  textAlign(RIGHT);
  text(""+dots.size() + " dots", width, height-10);
  fill(255);
  stroke(0);
  rect(0, 0, 500, 500);
  fill(0x88888888);
  ellipseMode(CENTER);
  ellipse(0, 0, 2*width, 2*width);

  for (PVector dot: dots) {
    fill((PVector.dist(dot, origin)<=width?0xFF008800:0xFFFF0000));
    noStroke();
    ellipse(dot.x, dot.y, 2, 2);
  }
  if (paused) {
    fill(0);
    textAlign(LEFT, TOP);
    text("PAUSED", 0, 0);
  } 
  else
    for (int i = 0; i < speed; i++) {
      PVector newDot = new PVector(random(width), random(width));
      if (PVector.dist(newDot, origin)<=width) dotsIn++;
      dots.add(newDot);
    }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    dots = new ArrayList<PVector>();
    dotsIn=0;
  } 
  else if (key == '+' || key=='=') {
    speed++;
  }
  else if (key == '-'||key=='_') {
    speed--;
    if (speed<1)speed=1;
  }
  else if (key == 'p' || key == 'P')
    paused = !paused;
}

