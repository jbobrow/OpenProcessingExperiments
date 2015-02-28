
PFont myFont;
PImage img_bg;
PImage img_abuela;
PImage img_mask;
float p1;
float p2;
String myText = ("Mi Abuela...");
int posX = width/2;

void setup() {
  size(400, 500);
  background(0);
  frameRate(1);
  smooth();

  // IMAGES 
  img_bg = loadImage("img_bg.jpg");
  img_abuela = loadImage("img_abuela.jpg");
  img_mask = loadImage("img_mask.jpg");

  // FONTS AND TEXT 
  myFont = loadFont("AmericanTypewriter-Bold-48.vlw");
  textFont(myFont, 15);
  text(myText, 20, 25);
}

void draw() {
  int pi1 = int(p1); // convierte de float a int
  int pi2 = int(p2); // convierte de float a int
  p1= random(1, width);
  p2= random(1, height);
  image(img_bg, 20, 30);
  img_abuela.mask(img_mask);

  // LINEA Y CAJA COLOR
  color ver= get( pi1, pi2 );
  line(width/2, (height/2)+30, pi1, pi2);
  fill(ver);
  rectMode(CENTER);

  // ABUELA IMG 
  image(img_abuela, 20, 150);
  stroke(0, 200);
  strokeWeight(3);
  fill(ver, 160);
  rect(175, 374, 40, 40);
  rect(232, 374, 40, 40);
}


