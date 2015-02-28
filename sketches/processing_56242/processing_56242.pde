
PImage root, trunk, branch_pinky, branch_forth, branch_middle, branch_pointer, branch_thumb;
PImage end_pinky, end_forth, end_middle, end_pointer, end_thumb;

void setup() {
  size(800, 600);
  root = loadImage("images/trunk.png");
  trunk = loadImage("images/main-trunk.png");
  branch_pinky = loadImage("images/pinky.png");
  branch_forth = loadImage("images/forth.png");
  branch_middle = loadImage("images/middle.png");
  branch_pointer = loadImage("images/pointer.png");
  branch_thumb = loadImage("images/thumb.png");
  end_pinky = loadImage("images/pinky-end.png");
  end_forth = loadImage("images/forth-end.png");
  end_middle = loadImage("images/middle-end.png");
  end_pointer = loadImage("images/pointer-end.png");
  end_thumb = loadImage("images/thumb-end.png");
}
void draw() {
  background(100);
  root();
  trunk();

  pushMatrix();
  translate(312, 437);
  rotate(radians(-50));
  branchPinky(42);
  popMatrix();

  pushMatrix();
  translate(337, 408);
  rotate(radians(-40));
  branchForth(42);
  popMatrix();

  pushMatrix();
  translate(365, 390);
  rotate(radians(-20));
  branchMiddle(42);
  popMatrix();
  
  pushMatrix();
  translate(410, 395);
  rotate(radians(0));
  branchPointer(42);
  popMatrix();
  
  pushMatrix();
  translate(485, 465);
  rotate(radians(20));
  branchThumb(42);
  popMatrix();
  
  
//  println(mouseX+","+mouseY);
}
void branchPinky(float leng) {
  float theta = map(mouseY, 0, height, 0, PI/3);
  pushMatrix();
  imageMode(CENTER);
  translate(-10, -21);
  image(branch_pinky, -0, -0, 33, 42);

  popMatrix();
  translate(0, -38);
  leng *=0.3;

  if (leng > 1) {
    pushMatrix();
    rotate(theta);
    branchPinky(leng);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branchPinky(leng);
    popMatrix();
  } else {
        pushMatrix();
    rotate(theta);
    endPinky();
    popMatrix();

    pushMatrix();
    rotate(-theta);
    endPinky();
    popMatrix();
  }
}
void branchForth(float leng) {
  float theta = map(mouseY, 0, height, 0, PI/3);
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -26);
  image(branch_forth, -0, -0, 34, 53);

  popMatrix();
  translate(0, -48);
  leng *=0.3;

  if (leng > 1) {
    pushMatrix();
    rotate(theta);
    branchForth(leng);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branchForth(leng);
    popMatrix();
  } else {
        pushMatrix();
    rotate(theta);
    endForth();
    popMatrix();

    pushMatrix();
    rotate(-theta);
    endForth();
    popMatrix();
  }
}

void branchMiddle(float leng) {
  float theta = map(mouseY, 0, height, 0, PI/3);
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -26);
  image(branch_middle, -0, -0, 34, 53);

  popMatrix();
  translate(0, -48);
  leng *=0.3;

  if (leng > 1) {
    pushMatrix();
    rotate(theta);
    branchMiddle(leng);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branchMiddle(leng);
    popMatrix();
  } else {
        pushMatrix();
    rotate(theta);
    endMiddle();
    popMatrix();

    pushMatrix();
    rotate(-theta);
    endMiddle();
    popMatrix();
  }
}

void branchPointer(float leng) {
  float theta = map(mouseY, 0, height, 0, PI/3);
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -37);
  image(branch_pointer, -0, -0, 35, 74);

  popMatrix();
  translate(0, -48);
  leng *=0.3;

  if (leng > 1) {
    println(leng);
    pushMatrix();
    rotate(theta);
    branchPointer(leng);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branchPointer(leng);
    popMatrix();
  } else {
        pushMatrix();
    rotate(theta);
    endPointer();
    popMatrix();

    pushMatrix();
    rotate(-theta);
    endPointer();
    popMatrix();
  }
}
void branchThumb(float leng) {
  float theta = map(mouseY, 0, height, 0, PI/3);
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -29);
  image(branch_thumb, -0, -0, 43, 59);

  popMatrix();
  translate(0, -48);
  leng *=0.3;

  if (leng > 1) {
    pushMatrix();
    rotate(theta);
    branchThumb(leng);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branchThumb(leng);
    popMatrix();
  } else {
        pushMatrix();
    rotate(theta);
    endThumb();
    popMatrix();

    pushMatrix();
    rotate(-theta);
    endThumb();
    popMatrix();
  }
}
void endPinky(){
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -10);
  image(end_pinky, -0, -0, 24, 43);
  popMatrix();
}
void endForth(){
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -10);
  image(end_forth, -0, -0, 30, 45);
  popMatrix();
}
void endMiddle(){
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -10);
  image(end_middle, -0, -0, 32, 48);
  popMatrix();
}
void endPointer(){
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -20);
  image(end_pointer, -0, -0, 33, 38);
  popMatrix();
}
void endThumb(){
  pushMatrix();
  imageMode(CENTER);
  translate(-5, -25);
  image(end_thumb, -0, -0, 33, 37);
  popMatrix();
}
void trunk() {
  pushMatrix();
  translate(width/2-2, height-125);
  imageMode(CENTER);
  image(trunk, 0, 0, 202, 186);
  popMatrix();
}
void root() {
  pushMatrix();
  translate(width/2, height-20);
  imageMode(CENTER);
  image(root, 0, 0, 103, 40);
  popMatrix();
}


