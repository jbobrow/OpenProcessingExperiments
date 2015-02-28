
/**
 * Project 1 Template
 * UCLA Design Media Arts, Fall 2011 
 * Prof. Casey Reas
 * 
 * Note: Put all of your code in the "testFace" tab. Leave
 * this tab and the "volume" tab as they are. You can set
 * your variables at the top of "testFace".
 * 
 * Based on code from Lorenzo Bravi:
 * http://www.lorenzobravi.com/projects/workshop-isia/
 */



//float v;
float mv;
float randx_L, randx_R, randy_L, randy_R, rand_size;
float rand_mouth, rand_face, randx_shake;
float rande1_size, rande2_size, rande3_size, rande4_size, rande5_size, rande6_size;
//PFont font;
float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 500;
boolean mic = true;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();

  //v = 0;
 // font = loadFont("ComicSansMS-Bold-48.vlw");
  // textFont(font);
}

void draw() {
  //background(255);

  getVolume();
  println(v);
  if (mic == false) {
    v = mouseX;
  }

  testFace();

  //saveFrame("mask-####.png");
}


