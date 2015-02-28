
PImage img;
int x = 0;
void setup() {
  img = loadImage("cabeca.png");
  size (500, 500);
  background(30);
}

void draw() {
imageMode(CENTER);
  tint(255,10-x/40);
  image(img,243,300);
  x++;

  translate(250, 250);
  rotate(x);
  fill(0, 4);
  rect(-500, -500, 1000, 1000);
  noFill();
  stroke(255, 10);
  point(0, 1);
  point(0, 2);
  point(0, 5);
  point(0, 10);
  strokeWeight(x/15);
  stroke(250, 242, 154, 100);
  point(x, x);
  strokeWeight(x/12);
  stroke(255);
  point(x, x);
  if (x >=450) {
    x=0;
    strokeWeight(2);
    ellipse(0, 0, 30, 30);
  }
}

