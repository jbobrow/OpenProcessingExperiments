
ArrayList<PVector> dots;
int dotsIn;
final PVector origin = new PVector(0, 0);

void setup() {
  size(500, 530);
  dots = new ArrayList<PVector>();
  dotsIn = 0;
  textSize(16);
}

void draw() {
  background(0xFFFF0000);
  textAlign(LEFT, BOTTOM);
  fill(0);
  double piApprox = 4.0*dotsIn/dots.size();
  text("\u03C0 \u2248 " + (dots.isEmpty()?"":piApprox), 0, height-10);
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
}

void keyPressed() {
  if (key == ' ') {
    PVector newDot = new PVector(random(width), random(width));
    if (PVector.dist(newDot, origin)<=width) dotsIn++;
    dots.add(newDot);
  } 
  else if (key == '\n' || key == '\r') {
    for (int i = 0; i < 100; i ++) {
      PVector newDot = new PVector(random(width), random(width));
      if (PVector.dist(newDot, origin)<=width) dotsIn++;
      dots.add(newDot);
    }
  } else if (key == 'r' || key == 'R'){
    dots = new ArrayList<PVector>();
    dotsIn=0;
  }
}



