
// credit to Processing example book - Typography 2/_03

PFont font1; PFont font2; 
PImage img;
float x = 0.0; float y = 0.0;
void setup() {
  size(900, 355);
  img = loadImage ("goose.png");
  font1 = loadFont("Cubano-Regular-48.vlw");
  font2 = loadFont ("ComicSansMS-48.vlw");
  noStroke();
}

void draw() {
  fill(204, 24);
  image (img, 0, 0); 
  rect(0, 0, width, height);
  fill (0);
  textFont (font1, 18);
  text ("*HONK*", random(-100, 900), random(-100, 200));

  fill (0);
  textFont (font2, 13); 
  text ("quack", random(-500, 500), random(-500,500));
  frameRate(2.3);
  
   
}

//try and make the image darker at the top so the text is more visible 
// or just change the type into something bolder.

