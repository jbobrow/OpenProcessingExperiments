
void setup() {
  size(500, 500);
}

int a = 100;
int b = 400;
int s = 0;

void draw() {
  background(0);
  rectMode(CENTER);
  stroke(255);
  noFill();
  rect(250, 250, 150, 150);
  if (a>=165) {
    s=1;
  }
  if (a==100) {
    s=0;
  }
  if (s==0) {
    a++;
    b--;
  }
  else {
    a--;
    b++;
  }
  noStroke();
  //Large squares
  fill(100);
  ellipse(a, 250, 100, 100);
  ellipse(250, a, 100, 100);
  ellipse(b, 250, 100, 100);
  ellipse(250, b, 100, 100);
  //small squares
  fill(210);
  ellipse(a+190, 250, 20, 20);
  ellipse(250, a+190, 20, 20);
  ellipse(b-190, 250, 20, 20);
  ellipse(250, b-190, 20, 20);
}

