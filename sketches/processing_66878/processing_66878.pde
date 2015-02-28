
PVector l;
PVector v;
PVector g;
int r = 10;
int b = 0;
boolean keyrelease = true;
boolean printup = false;
boolean printdown = false;
int texttime = 0;
int m = 0;

void setup() {
  size(500, 500);
  smooth();
  float a = random(2*r, width-2*r);
  l = new PVector(a, height-a);
  v = new PVector(3, 3);
}

//void ballcontrol() {
//}

void printcollision() {
  println("Collision happened " + b + " times.");
}

void keyPressed() {
  if (keyCode == DOWN) {
    if (v.y < 0 && keyrelease) {
      v.y = v.y * -1;
      texttime = 0;
      keyrelease = false;
      printup = false;
      printdown = true;
      println("Direction manually changed to downward.");
    }
  }
  else if (keyCode == UP) {
    if (v.y > 0 && keyrelease) {
      v.y = v.y * -1;
      texttime = 0;
      keyrelease = false;
      printdown = false;
      printup = true;
      println("Direction manually changed to upward.");
    }
  }
}

void keyReleased() {
  if (keyCode == DOWN) {
    keyrelease = true;
  }
  else if (keyCode == UP) {
    keyrelease = true;
  }
}

void draw() {
  m++;
  background (33);
  l.add(v);
  if (l.x >= width-r) {
    v.x = v.x * -1;
    l.x = width-r;
    b++;
    printcollision();
  }
  if (l.x <= r) {
    v.x = v.x * -1;
    l.x = r;
    b++;
    printcollision();
  }
  if (l.y >= height-r) {
    v.y = v.y * -1;
    l.y = height-r;
    b++;
    printcollision();
  }
  if (l.y <= r) {
    v.y = v.y * -1;
    l.y = r;
    b++;
    printcollision();
  }
  fill(255);
  textAlign(CENTER);
  text("Collision happened " + b + " times.", width/2, height/2);
  if (m * 2 < 255 && 255 - m * 2 > 33) {
    fill(255 - m * 2);
    text("Pressing UP or DOWN on keyboard to change direction.", width/2, height/2 + 16);
  }
  if (printup && texttime < 127 && 255 - texttime * 2 >33) {
    m = 255;
    fill(255 - texttime * 2);
    text("Direction manually changed to upward.", width/2, height/2 + 16);
    texttime++;
  }
  else if (printdown && texttime < 127 && 255 - texttime * 2 >33) {
    m = 255;
    fill(255 - texttime * 2);
    text ("Direction manually changed to downward.", width/2, height/2 + 16);
    texttime++;
  }
  fill(255);
  rectMode(CENTER);
  ellipse(l.x, l.y, 2*r, 2*r);
}


