
PFont[] fonts= new PFont[11];



// setup
void setup() {


  size(1080, 500);


  textAlign(CENTER);
  fonts[0] = loadFont("Futura-CondensedExtraBold-48.vlw");
  fonts[1] = loadFont("BauerBodoni-Bold-48.vlw");
  fonts[2] = loadFont("ChaparralPro-Italic-48.vlw");
  fonts[3] = loadFont("ComicSansMS-Bold-48.vlw");
  fonts[4] = loadFont("Copperplate-Bold-48.vlw");
  fonts[5] = loadFont("Didot-Bold-48.vlw");
  fonts[6] = loadFont("Mission-Script-48.vlw");
  fonts[7] = loadFont("Eureka-Roman-48.vlw");
  fonts[8] = loadFont("Sabon-BoldItalic-48.vlw");
  fonts[9] = loadFont("GearedSlab-Extrabold-48.vlw");
  fonts[10] = loadFont("Garamond-48.vlw");


  frameRate(18);
  smooth();
}


void draw() {

  float rc= random(0, 255);
  //background(0);
  // in the prog
  textFont(fonts[(int) random(0, 11)]);
  fill(0, 0, 0, 255);
  rect(0, 0, width, height);

  String s = "Make Art that Matters"; //line of text for random font

  textSize(80);
  fill(rc, rc, rc);
  text(s, width/2, height/2);
  textSize(30);
  textFont(fonts[7]);
  fill(255);
  text("California College of The Arts", width/2, 320);  // center text
}



