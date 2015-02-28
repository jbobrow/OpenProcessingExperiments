
float a, b;
PImage img;
PFont font;
PFont fontBold;
float easing = 0.05;
float offset = 0;
String s1 = "WOMAN";
String s2 = "IS";
String s3 = "A";
String s4 = "WOMAN";

void setup() {
  size(500, 280);
  noFill();
  frameRate(30);
  img = loadImage("womanisawoman.jpg");
  font = loadFont("ACaslonPro-Italic-48.vlw");
  fontBold = loadFont("ACaslonPro-BoldItalic-48.vlw");
  a=height/2;
}

void draw() {
  // background(255);
  // b += random(-6, 6);
  float dx =(255-img.width/2) -offset;
  offset += dx*easing;
  image(img, 0, 0);
  filter(BLUR, offset);

  textFont(font, 20);
  text(s2, 10, 37);
  text(s3, 10, 54);

  textFont(fontBold, 25);
  text(s1, 10, 20);
  text(s4, 10, 75);

  float R = random(100, 200);
  float G = random(50, 60);
  float B = random(255);
  stroke(R, G, B);

  strokeWeight(2);
  line(0, a, width, a);
  a = a - 0.5;
  if (a < 0) { 
    a = height;
  }
  
  saveFrame("image-######.png");
}



