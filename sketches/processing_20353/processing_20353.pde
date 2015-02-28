
PFont font;
PImage img1, img2, img3, img4;
PShape lh;
PShape bh;

void setup() {
  size(640, 480);
  smooth();
  font = loadFont ("bookman_font.vlw");
  img1 = loadImage ("red_circles.png");
  img2 = loadImage ("body.png");
  img3 = loadImage ("black_circle.png");
  img4 = loadImage ("background.png");
  lh = loadShape ("little_hand.svg");
  bh = loadShape ("big_hand.svg");
}

//  ROTATING RED CIRCLES...
void draw() {
  background(255);
  pushMatrix();
  translate(-5,-30);
  rotate(radians (frameCount));
  image (img1,15,4,610,480);
  popMatrix();

  pushMatrix();
  translate(400,1);
  rotate(radians (frameCount));
  image (img1,100,50,610,480);
  popMatrix();

  pushMatrix();
  translate(100,25);
  rotate(radians (frameCount));
  image (img1,100,50,610,480);
  popMatrix();


  //  IMAGES 
  image(img1,0,0);
  image(img4,0,0);
  image(img2,0,0);
  image(img3,0,0);
  //  shape(lh,0,0);
  //  shape(bh,0,0);
  //ellipse(320,190,25,25);
  //shape (lh,166,-41,320,320);


  //NUMBERS
  fill(#a81800,185);
  noStroke();
  ellipse(318,300,45,45);
  fill(0);
  textFont(font);
  textSize(55);
  text("12",280,25,200,200);
  text("3",446,171,200,200);
  text("9",173,172,200,200);
  text("6",300,280,200,200);


//TIME TELLING MAGIC...
  noFill();
  translate(320,190);
  rotate(radians(-90));
  ellipse(0, 0, 250, 250);

  pushMatrix();
  float s = second();
  float sMapped = map(s, 0, 60, 0, 360);
  rotate(radians(sMapped));
  strokeWeight(5);
  stroke(sMapped, 15, 0);
  line(0, 0, 150, 0);
  popMatrix();

  pushMatrix();
  float m = minute();
  float mMapped = map(m, 0, 60, 0, 360);
  rotate(radians(mMapped));
  stroke(mMapped, 100, 100);
  shape (bh,-74,-200,350,400);
  popMatrix();

  pushMatrix();
  float h = hour();
  float hModulo = h % 12;
  float hMapped = map(hModulo, 0, 12, 0, 360);
  rotate(radians(hMapped));
  stroke(hMapped, 100, 100);
  shape (lh,-155,-232,320,320);
  popMatrix();
}


