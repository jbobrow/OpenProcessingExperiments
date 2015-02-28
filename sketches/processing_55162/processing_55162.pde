

//CrisGrow LAB5

String[] s = {
  "LES MOTS COMME NEIGE À PARIS."
};



PFont f;
PImage img;

void setup() {

  size(400, 600);

  PImage img = loadImage("paris.jpg");

  filter(DILATE);
  PImage img2 = loadImage("goldglitter.jpg");
  image(img2, 0, 0);

  image(img2, 0, 0);

  img.blend(img2, 0, 0, width, height, 0, 0, 800, 800, SOFT_LIGHT);
  img.resize(width, height);
  background(img);



  fill(255);
  f = loadFont("Helvetica-30.vlw");
  
  frameRate(1);
}

void draw() {

  for (int i= 0; i< s.length;i++) {

    text(s[i], random(400), random(600));
  }
}


