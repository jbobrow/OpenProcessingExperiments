
PFont font;

PImage space;
PImage lazercat;
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

float x, y, r;

float r1, r2, a, b, c;
float angle = 0;
float scalar = 1;
float angleInc = PI / 2.5;
float s;


void setup(){
  size(640, 480);
  space = loadImage("background.jpg");
  lazercat = loadImage("lazer_head.png");
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
  font = loadFont("OratorStd-50.vlw");
  smooth();
  
  noLoop();
  imageMode(CENTER);
  
  
}


void draw(){

  //background
  image(space, width/2 - 1, height/2, 642, 480);
  textFont(font);
  
  text("hipster kitty doubts", 20, 200);
  text("your indie cred.", 70, 250);
  
  

  //cathead1
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead1, 0, 0);
  popMatrix();

  //cathead2
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead2, 0, 0);
  popMatrix();

  //cathead3
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead3, 0, 0);
  popMatrix();

  //cathead4
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead4, 0, 0);
  popMatrix();

  //cathead5
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead5, 0, 0);
  popMatrix();

  //cathead6
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead6, 0, 0);
  popMatrix();

  //cathead7
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead7, 0, 0);
  popMatrix();

  //cathead8
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead8, 0, 0);
  popMatrix();

  //cathead9
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead9, 0, 0);
  popMatrix();

  //cathead10
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead10, 0, 0);
  popMatrix();

  //cathead11
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead11, 0, 0);
  popMatrix();

  //cathead12
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate(r);
  image(cathead12, 0, 0);
  popMatrix();

//  //lazercat
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(-QUARTER_PI, QUARTER_PI);
  translate(x, y);
  rotate (r);
  image(lazercat, 0, 0);
  popMatrix();



}

void keyPressed() {
  if (key == ' ') {
    redraw();
    if (key == 'c') {
      pushMatrix();
      x = random(width);
      y = random(height);
      r = random(-QUARTER_PI, QUARTER_PI);
      translate(x, y);
      rotate (r);
      image(lazercat, 0, 0);
      popMatrix();

    }
  }

}



