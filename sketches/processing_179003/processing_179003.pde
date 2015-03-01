
PImage blume = null;
PImage beeren = null;

/* @pjs preload="blume_01.png, beeren.png"; */ 

void setup() {

  size(600, 600);
  smooth();
  blume = loadImage("blume_01.png");
  beeren = loadImage("beeren.png");
}

void draw () {
  background (#ffedbc);

  // image(PImage, x, y);
  // image(PImage, x, y, breite, hÃ¶he);
  float breite = blume.width*0.35;
  float hoehe = blume.height*0.35;
  image(blume, width/2-breite/2, height/2-hoehe, breite, hoehe);  
  image(beeren, width/2-100, height/2, 200, 200);
}



