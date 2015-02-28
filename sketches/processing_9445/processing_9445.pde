
PImage t1;
PImage t2;
PImage t3;
PImage t4;
PImage t5;
PImage t6;
PImage t7;
PImage t8;


PFont p;
String mytext = "Party in the USA!";
String mytext2 = "BIEBER FEVER";


float x, y, r;


void setup() {

  size(800, 600);
  background(0);
  smooth();
  colorMode(HSB, 255, 255, 255);


  t1 = loadImage("biebscyrus.png");
  t2 = loadImage("jbiebs1.png");
  t3 = loadImage("jbiebs2.png");
  t4 = loadImage("miley.png");
  t5 = loadImage("miley3.png");
  t6 = loadImage("miley4.png");
  t7 = loadImage("canada.png");
  t8 = loadImage("miley5.png");



  p = loadFont("AmericanTypewriter-CondensedBold-48.vlw");
  textFont(p);

  noLoop();

}


void draw () {

  //Canadian Flag BG
  x = (400);
  y = (300);
  pushMatrix();
  translate(x, y);
  image(t7, -t7.width/2, -t7.height/2);
  popMatrix();


  //Miley wtf outfit
  x = random(0, 320);
  y = random(height);
  r = random (0, PI/2);
  pushMatrix();
  translate(x, y);
  rotate (r);
  image(t5, -t5.width/2, -t5.height/2);
  popMatrix();

  //biebs1
  x = random(320, 640);
  y = random(height);
  r = random (0, 2*PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  image(t2, -t2.width/2, -t2.height/2);
  popMatrix(); 

  //biebs2
  x = random(320, 640);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  image(t3, -t3.width/2, -t3.height/2);
  popMatrix();
  
  // miley being miley
  x = random(320, 640);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  image(t8, -t8.width/2, -t8.height/2);
  popMatrix();

  x = random(400, 800);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  scale(-1, 1);
  image(t4, -250, 0);

  x = random(400, 300);
  y = random(height);
  r = random (0, 2*PI);
  translate(300, 0);
  scale(-1, 1);
  image(t6, -250, 0);
  popMatrix();

  //  Flipping from left to right?
  //  pushMatrix();
  //  translate(250, 0);
  //  scale(-1, 1);
  //  image(t4, -250, 0);
  //
  //  translate(300, 0);
  //  scale(-1, 1);
  //  image(t6, -250, 0);
  //  popMatrix();

  // DAS HOT SHOT
  x = random(0, 600);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  image(t1, -t1.width/2, -t1.height/2);
  popMatrix();


  fill(random(0, 255), 232, 64, 200);
  text(mytext, 100, 150, random(x, y), 800);

  fill(random(0, 300), 300, 99, 255);
  text(mytext2, 100, random(x, y), 300, 400);



  //  for (int i = 0; i < 100; i++) {
  //    noStroke();
  //  }
}

void mousePressed() {
  redraw();
}

//void keyPressed() {
//  mytext = mytext2 + key;
//
//}










