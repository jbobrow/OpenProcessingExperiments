

// setting font and image
PFont font;
PImage img;

void setup() {
  size (300, 300);
  
  //image stuff
  img = loadImage("typewriter.jpg");
  image(img, 0,0);
  
  //font stuff
  font = loadFont("AmericanTypewriter-48.vlw");
  textFont(font);
  fill(0);
  
  save("writersblockclock.jpg");
}

void draw() {
  
  //drawing rectangle so that time text doesn't muddle up
  noStroke();
  fill(245);
  rect(122, 75, 100, 20);
  
  //time functions
  h();
  m();
  s();
  
}

//defining the time functions

void h() {
  fill(0);
  textSize(20);
  text(nf(hour(),2)+":", 122, 90); //totally love nf()
}

void m() {
  fill(0);
  textSize(20);
  text(nf(minute(),2)+":", 155, 90);
}  

void s() {
  fill(0);
  textSize(20);
  text(nf(second(),2), 188, 90);
}  



