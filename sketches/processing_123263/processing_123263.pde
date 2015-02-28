
//Carmen Zhou
//Exercise 4_2
//November 13, 2012

//colors
int r;
int g;
int bl;
int o;

void setup() {
  size(500, 500);
  frameRate(15);
  smooth();
  noCursor();
}

void draw() {
  drawColor();
  drawFace();
  moveEyes();
  moveTongue();
  moveEyebrows();
  drawEyecolor();
  drawIceCream();
}

void drawColor(){
  r = int(random(256));
  g = int(random(256));
  bl = int(random(256));
  o = int(random(256));
  
  if (mousePressed == true) {
  fill(r,g,bl,o);
} else {
  fill(170,210,255,255);
}  
  rectMode(CORNER);
  rect(0,0,height,width);
}

void drawFace() {
  stroke(0, 0, 0, 255);
  strokeWeight(8);
  //head
  fill(255, 255, 0, 255);
  ellipse(250, 250, 260, 260);
  //eyeball
  fill(255, 255, 255, 255);
  ellipse(200, 245, 70, 70);
  ellipse(300, 245, 70, 70);
  //mouth
  fill(210, 50, 50, 255);
  arc(250, 300, 120, 80, 0, PI);
  line(190, 300, 310, 300);
}

void moveTongue() {
  //tongue
  pushMatrix();
  translate(240, 330);
  fill(255, 150, 150, 255);
  stroke(255, 150, 150, 255);
  strokeWeight(0);
  ellipse(mouseX*20/width, 0, 55, 22);
  popMatrix();

  stroke(0, 0, 0, 255);
  strokeWeight(6);
  fill(210, 50, 50, 0);
  arc(250, 300, 120, 80, 0, PI);
  line(190, 300, 310, 300);
}  

void moveEyebrows() {
  //lefteyebrow
  pushMatrix();
  translate(200, 195);
  stroke(0);
  strokeWeight(8);
  arc(0, mouseY*20/height, 100, 40, PI+QUARTER_PI, TWO_PI-THIRD_PI);
  //righteyebrow
  stroke(0);
  strokeWeight(8);
  arc(100, mouseY*20/height, 100, 40, PI+THIRD_PI, TWO_PI-QUARTER_PI);
  popMatrix();
}

void moveEyes() {
  //left eye
  pushMatrix();
  translate(195, 230);
  stroke(0, 0, 0, 255);
  fill(0);
  strokeWeight(8);
  ellipse(mouseX*30/width, mouseY*30/height, 10, 10);
  popMatrix();
  //right eye
  pushMatrix();
  translate(275, 230);
  fill(0);
  strokeWeight(8);
  ellipse(mouseX*30/width, mouseY*30/height, 10, 10);
  popMatrix();
}

void drawEyecolor(){
  if (mousePressed == true) {
  strokeWeight(8);
  stroke(r,g,bl,o);
  fill(r,g,bl,o);
  ellipse(195+mouseX*30/width, 230+mouseY*30/height, 20, 20);
  ellipse(275+mouseX*30/width, 230+mouseY*30/height, 20, 20);
//drool
  stroke(110,170,255,255);
  strokeWeight(3);
  line(280,330,280,360);
  strokeWeight(4);
  line(280,355,280,390);
  strokeWeight(5);
  line(280,385,280,390);  
} else {
  fill(0);
}
}

void drawIceCream() {
  //cone  
  translate(0, 50);
  strokeWeight(2);
  stroke(255, 180, 80, 255);
  fill(255, 220, 108, 255);
  triangle(mouseX-30, mouseY-30, mouseX+30, mouseY-30, mouseX, mouseY+60);
  //scoops
  stroke(255, 120, 170, 255);
  fill(255, 150, 208, 255);
  ellipse(mouseX, mouseY-25, 60, 50);
  ellipse(mouseX, mouseY-45, 50, 44);
  //cherry
  strokeWeight(1);
  stroke(242, 2, 26, 255);
  fill(242, 42, 66, 255);
  ellipse(mouseX, mouseY-62, 17, 17);
  //stem
  noFill();
  strokeWeight(2);
  stroke(0);
  arc(mouseX+18, mouseY-67, 35, 35, PI, PI+QUARTER_PI);
}




