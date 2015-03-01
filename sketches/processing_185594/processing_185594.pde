
PImage dot;
PImage line;
PImage triangle;
PImage square;
PImage pentagon;
PImage hexagon;

PImage l2;
PImage t2;
PImage t3;
PImage s2;
PImage s3;
PImage s4;
PImage s5;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
PImage p7;
PImage h2;
PImage h3;
PImage h4;
PImage h5;
PImage h6;
PImage h7;
PImage h8;
PImage h9;
PImage h10;
PImage h11;

boolean dotBoolean = false;
boolean lineBoolean = false;
boolean triangleBoolean = false;
boolean squareBoolean = false;
boolean pentagonBoolean = false;
boolean hexagonBoolean = false;


void setup() {
  size(1000, 750);
  dot = loadImage("1.png");
  line = loadImage("2.png");
  triangle = loadImage("3.png");
  square = loadImage("4.png");
  pentagon = loadImage("5.png");
  hexagon = loadImage("6.png");

  l2 = loadImage("11.png");
  t2 = loadImage("21.png");
  t3 = loadImage("111.png");
  s2 = loadImage("31.png");
  s3 = loadImage("22.png");
  s4 = loadImage("211.png");
  s5 = loadImage("1111.png");
  p2 = loadImage("41.png");
  p3 = loadImage("32.png");
  p4 = loadImage("311.png");
  p5 = loadImage("221.png");
  p6 = loadImage("2111.png");
  p7 = loadImage("11111.png");
  h2 = loadImage("51.png");
  h3 = loadImage("42.png");
  h4 = loadImage("411.png");
  h5 = loadImage("33.png");
  h6 = loadImage("321.png");
  h7 = loadImage("3111.png");
  h8 = loadImage("222.png");
  h9 = loadImage("2211.png");
  h10 = loadImage("21111.png");
  h11 = loadImage("111111.png");
}


void draw() {
  background(255);
  smooth();
  image(dot, 20, 20);
  image(line, 140, 20);
  image(triangle, 280, 20);
  image(square, 420, 20);
  image(pentagon, 570, 20);
  image(hexagon, 720, 20);
  tint(255, 180);

  if (lineBoolean) {
    image(l2, 140, 140);
  }
  if (triangleBoolean) {
    image(t2, 280, 140);
    image(t3, 280, 240);
  }
  if (squareBoolean) {
    image(s2, 420, 140);
    image(s3, 420, 240);
    image(s4, 420, 340);
    image(s5, 420, 440);
  }
  if (pentagonBoolean) {
    image(p2, 570, 140);
    image(p3, 570, 240);
    image(p4, 570, 340);
    image(p5, 570, 440);
    image(p6, 570, 540);
    image(p7, 570, 640);
  }
  if (hexagonBoolean) {
    image(h2, 720, 140);
    image(h3, 720, 240);
    image(h4, 720, 340);
    image(h5, 720, 440);
    image(h6, 720, 540);
    image(h7, 720, 640);
    image(h8, 820, 140);
    image(h9, 820, 240);
    image(h10, 820, 340);
    image(h11, 820, 440);
  }
}

void keyPressed() {
  //  if (key == '6') {
  //    hexagonBoolean = true;
  //  }
  switch (key) {
  case '1':
    dotBoolean = true;
    break;
  case '2':
    lineBoolean = true;
    break; 
  case '3':
    triangleBoolean = true;
    break;
  case '4':
    squareBoolean = true;
    break;
  case '5':
    pentagonBoolean = true;
    break; 
  case '6':
    hexagonBoolean = true;
    break;
  case '-':
    dotBoolean = false;
    lineBoolean = false;
    triangleBoolean = false;
    squareBoolean = false;
    pentagonBoolean = false;
    hexagonBoolean = false;
    break;
  }
}



