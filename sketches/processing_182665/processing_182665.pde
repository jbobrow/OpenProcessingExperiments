
int x = 0;
int y = 0;
int rightEdge = 1000;
int leftEdge = 0;
boolean movingRight = true;
int xtravelled = 0;
int xparab = 0;
float r;
float g;
float b;
float bw;
int fillr = 200;
int fillg = 0;
int fillb = 0;
int background = 200;

void setup() {
  size(1000, 600);
}

void draw() {
  if (xtravelled == 400){
    xtravelled = 0;
    r = random(0,254);
    g = random(0,254);
    b = random(0,254);
    bw = random(0,254);
    fillr = int(r);
    fillg = int(g);
    fillb = int(b);
    background = int(bw);
    print(xtravelled);
  }
  if (movingRight) {
    if (x < rightEdge) {
      background(background);
      fill(fillr,fillg,fillb);
      noStroke();
      ellipse(x, height-y-20, 40, 40);
      x = x + 1;
      y = ((-1)*((xtravelled-200)*(xtravelled-200)))/200+200;
      xtravelled = xtravelled + 1;
    } else {
      movingRight = false;
    }
  } else {
    if (x > leftEdge) {
      background(background);
      fill(fillr,fillg,fillb);
      noStroke();
      ellipse(x, height-y-20, 40, 40);
      x = x - 1;
      println(xtravelled);
      y = ((-1)*((xtravelled-200)*(xtravelled-200)))/200+200;
      xtravelled = xtravelled + 1;
    } else {
      movingRight = true;
    }
  }
}



