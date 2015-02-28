
//BACKGROUND IMAGES
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
PImage bg5;
PImage bg6;
PImage bg7;
PImage bg8;
PImage bg9;
PImage bg10;
PImage bg11;
PImage bg12;
PImage bg13;
PImage bg14;
PImage bg15;

//KOI IMAGES
PImage koi1;
PImage koi2;
PImage koi3;
PImage koi4;
PImage koi5;
PImage koi6;

//FONT FACE
PFont euro;

//SVG SHAPE
PShape types;

//FLOAT DECLARATION
float rx;
float ry;
float number;
float diam;
float word_x;
float word_y;

void setup() {
  //SETUP
  size(640, 480);
  smooth();
  noLoop();
  
  //LOAD BACKGROUND IMAGES
  bg1 = loadImage("bg1.png");
  bg2 = loadImage("bg2.png");
  bg3 = loadImage("bg3.png");
  bg4 = loadImage("bg4.png");
  bg5 = loadImage("bg5.png");
  bg6 = loadImage("bg6.png");
  bg7 = loadImage("bg7.png");
  bg8 = loadImage("bg8.png");
  bg9 = loadImage("bg9.png");
  bg10 = loadImage("bg10.png");
  bg11 = loadImage("bg11.png");
  bg12 = loadImage("bg12.png");
  bg13 = loadImage("bg13.png");
  bg14 = loadImage("bg14.png");
  bg15 = loadImage("bg15.png");
  
  //LOAD KOI IMAGES
  koi1 = loadImage("koi1.png");
  koi2 = loadImage("koi2.png");
  koi3 = loadImage("koi3.png");
  koi4 = loadImage("koi4.png");
  koi5 = loadImage("koi5.png");
  koi6 = loadImage("koi6.png");
  imageMode(CENTER);
  
  //LOAD FONT
  euro = loadFont("Eurofurenceregular-42.vlw");
  textFont(euro);
  textAlign(CENTER);
  
  //LOAD SHAPE
  types = loadShape("types.svg");
  shapeMode(CENTER);
  
}

void draw() {
  background(254, 167, 43);
  
  
  //BACKGROUND GENERATION
  
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg1, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg1, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg2, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg3, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg4, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg5, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg6, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg7, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg8, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg9, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg10, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg11, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg12, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg13, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg14, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg15, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg1, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg1, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg2, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg3, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg4, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg5, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg6, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg7, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg8, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg9, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg10, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg11, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg12, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg13, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg14, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg15, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg1, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg1, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg2, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg3, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg4, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg5, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg6, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg7, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg8, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg9, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg10, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg11, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg12, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg13, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg14, rx, ry);
  rx = random(0, 640);
  ry = random(0, 480);
  image(bg15, rx, ry);
  
  
  //BOTTOM LAYER ELLIPSES
  
  noStroke();
  fill(255, 139, 71, 100);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  fill(252, 215, 57, 100);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  
  
  //KOI IMAGE GENERATION
  
  number = random(0, 7);
  
  if(number < 2){
    rx = random(500, 600);
    ry = random(200, 250);
    image(koi1, rx, ry);
  }
  if(number < 3){
    rx = random(400, 500);
    ry = random(200, 250);
    pushMatrix();
    rotate(random(radians(-5), radians(5)));
    image(koi2, rx, ry);
    popMatrix();
  }
  if(number < 4){
    rx = random(300, 400);
    ry = random(200, 250);
    pushMatrix();
    rotate(random(radians(-5), radians(5)));
    image(koi3, rx, ry);
    popMatrix();
  }
  if(number < 5){
    rx = random(200, 300);
    ry = random(200, 250);
    image(koi4, rx, ry);
  }
  if(number < 6){
    rx = random(100, 200);
    ry = random(200, 250);
    image(koi5, rx, ry);
  }
  if(number < 7){
    rx = random(100, 540);
    ry = random(200, 250);
    image(koi6, rx, ry);
    word_x = rx; 
    word_y = ry;
  }
  
  
  //TOP LAYER ELLIPSES
  
  noStroke();
  fill(255, 139, 71, 100);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  fill(252, 215, 57, 100);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  diam = random(10, 60);
  ellipse(random(0, 640), random(0, 480), diam, diam);
  
  
  //TEXT
  
  fill(255, 247, 212, 255);
  translate(word_x, word_y);
  text("koi", 0, 0);
  pushMatrix();
  rotate(random(0, radians(360)));
  types.disableStyle();
  shape(types, 0, 0, 400, 400);
  popMatrix();
  
}

