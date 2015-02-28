
/* @pjs preload = "apple.png"; */

PImage apple;
int r;
float a, b, c;

void setup() {
  size(450, 450);
  background(0);
  smooth();
  noFill();
  strokeWeight(2);
  textSize(80);
  textAlign(CENTER);
  apple = loadImage("apple.png");
}

void draw() {
  background(a, b, c);

  /* ---- light ---- */
  for (r = 0; r < 265; r += 2) {
    noFill();
    stroke(265-r+a, 265-r+b, 265-r+c);
    ellipse(mouseX, mouseY, r, r);
  }  
  /* ---- light ----*/

  tint(a, b, c);
  image(apple, 100, 50); // logo mark
  fill(a, b, c);
  text("A p p l e", width/2, 418); // logo text
}

/* ---- color ---- */
void mousePressed() {
  a = random(255);
  b = random(255);
  c = random(255);
}


