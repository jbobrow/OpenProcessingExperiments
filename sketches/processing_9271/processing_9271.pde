
PImage space;
PImage kinglazer;
PImage cathead1;
PImage cathead2;
PImage cathead3;
PImage cathead4;
PImage cathead5;
PImage cathead6;
PImage cathead7;
PImage cathead8;
PImage cathead9;
PImage cathead10;
PImage cathead11;
PImage cathead12;
PImage greeneyes;

float x, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x13;
float y, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y13;

float r, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;
float a, b, c;
float angle = 0;
float scalar = 1;
float angleInc = PI / 2.5;
float s;


void setup(){
  size(640, 480);
  space = loadImage("background.jpg");
  cathead1 = loadImage("cat_head_1.png");
  cathead2 = loadImage("cat_head_2.png");
  cathead3 = loadImage("cat_head_3.png");
  cathead4 = loadImage("cat_head_4.png");
  cathead5 = loadImage("cat_head_5.png");
  cathead6 = loadImage("cat_head_6.png");
  cathead7 = loadImage("cat_head_7.png");
  cathead8 = loadImage("cat_head_8.png");
  cathead9 = loadImage("cat_head_9.png");
  cathead10 = loadImage("cat_head_10.png");
  cathead11 = loadImage("cat_head_11.png");
  cathead12 = loadImage("cat_head_12.png");
  kinglazer = loadImage("KINGLAZER.png");
  greeneyes = loadImage("green.png");

  imageMode(CENTER);


}


void draw(){

  //background
  image(space, width/2 - 1, height/2, 642, 480);

  //cathead1
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(cathead1, 0, 0);
  popMatrix();

  //cathead2
  pushMatrix();
  translate(x1, y1);
  rotate(r1);
  image(cathead2, 0, 0);
  popMatrix();

  //cathead3
  pushMatrix();
  translate(x2, y2);
  rotate(r2);
  image(cathead3, 0, 0);
  popMatrix();

  //cathead4
  pushMatrix();
  translate(x3, y3);
  rotate(r3);
  image(cathead4, 0, 0);
  popMatrix();

  //cathead5
  pushMatrix();
  translate(x4, y4);
  rotate(r4);
  image(cathead5, 0, 0);
  popMatrix();

  //cathead6
  pushMatrix();
  translate(x5, y5);
  rotate(r5);
  image(cathead6, 0, 0);
  popMatrix();

  //cathead7
  pushMatrix();
  translate(x6, y6);
  rotate(r6);
  image(cathead7, 0, 0);
  popMatrix();

  //cathead8
  pushMatrix();
  translate(x7, y7);
  rotate(r7);
  image(cathead8, 0, 0);
  popMatrix();

  //cathead9
  pushMatrix();
  translate(x8, y8);
  rotate(r8);
  image(cathead9, 0, 0);
  popMatrix();

  //cathead10
  pushMatrix();
  translate(x9, y9);
  rotate(r9);
  image(cathead10, 0, 0);
  popMatrix();

  //cathead11
  pushMatrix();
  translate(x10, y10);
  rotate(r10);
  image(cathead11, 0, 0);
  popMatrix();

  //cathead12
  pushMatrix();
  translate(x11, y11);
  rotate(r11);
  image(cathead12, 0, 0);
  popMatrix();

  //lazer eyes
  s = sin(angle) * scalar;
  angle = angle + angleInc;
  a = x13 + 50;
  b = x13 - 25;
  c = y13 + 75;
  if(mousePressed) {
    image(greeneyes, x13, y13);
  } 
  else {
    image(kinglazer, x13, y13);
  }
  if(mousePressed){
    smooth();
    stroke(0, 255, 0, 130 + 40*s);
    strokeWeight(2);
    line(a, c, mouseX, mouseY);
    line(b, c, mouseX, mouseY);
    stroke(0, 255, 0, 50 + 20*s);
    strokeWeight(8);
    line(a, c, mouseX, mouseY);
    line(b, c, mouseX, mouseY);
    stroke(0, 255, 0, 75 + 20*s);
    strokeWeight(4);
    line(a, c, mouseX, mouseY);
    line(b, c, mouseX, mouseY);
  }




}

void keyPressed() {
  if (key == ' ') {
    x = random(width);
    y = random(height);
    r = random(-QUARTER_PI, QUARTER_PI);
    x1 = random(width);
    y1 = random(height);
    r1 = random(-QUARTER_PI, QUARTER_PI);
    x2 = random(width);
    y2 = random(height);
    r2 = random(-QUARTER_PI, QUARTER_PI);
    x3 = random(width);
    y3 = random(height);
    r3 = random(-QUARTER_PI, QUARTER_PI);
    x4 = random(width);
    y4 = random(height);
    r4 = random(-QUARTER_PI, QUARTER_PI);
    x5 = random(width);
    y5 = random(height);
    r5 = random(-QUARTER_PI, QUARTER_PI);
    x6 = random(width);
    y6 = random(height);
    r6 = random(-QUARTER_PI, QUARTER_PI);
    x7 = random(width);
    y7 = random(height);
    r7 = random(-QUARTER_PI, QUARTER_PI);
    x8 = random(width);
    y8 = random(height);
    r8 = random(-QUARTER_PI, QUARTER_PI);
    x9 = random(width);
    y9 = random(height);
    r9 = random(-QUARTER_PI, QUARTER_PI);
    x10 = random(width);
    y10 = random(height);
    r10 = random(-QUARTER_PI, QUARTER_PI);
    x11 = random(width);
    y11 = random(height);
    r11 = random(-QUARTER_PI, QUARTER_PI);
    x13 = random(30, width - 30);
    y13 = random(30, height - 30);
  }
}







