
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
  double eApprox=1;
  if(dots.size()!=0)
    eApprox=1.0*dots.size()/(dots.size()-dotsIn);
  text("e \u2248 " + (dots.isEmpty()?"":eApprox), 0, height-10);
  text("Dots/frame: " + ((int)speed), width/2, height-10);
  textAlign(RIGHT);
  text(""+dots.size() + " dots", width, height-10);
  fill(255);
  stroke(0);
  rect(0, 0, 500, 500);

  for (PVector dot: dots) {
    fill((exp(dot.x)>=dot.y*exp(1)?0xFF008800:0xFFFF0000));
    noStroke();
    ellipse(dot.x*width, width*(1-dot.y), 2, 2);
  }
  if (paused) {
    fill(0);
    textAlign(LEFT, TOP);
    text("PAUSED", 0, 0);
  } 
  else
    for (int i = 0; i < speed; i++) {
      PVector newDot = new PVector(random(1), random(1));
      if (exp(newDot.x)>=newDot.y*exp(1)) dotsIn++;
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

