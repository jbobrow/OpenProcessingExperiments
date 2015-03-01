
PImage myImage;
PFont myFont;

void setup() {
  size (1000,600);
  myImage = loadImage("odd-futures-first-ofwgkta-carnival-9.jpg");
  myFont = loadFont("LetterGothicStd-32.vlw");
}

void draw() {
  textFont(myFont);
  image(myImage,30,0);
  stroke(90);
  textSize(40);
  text("ODD FUTURE CARNIVAL",200,90);
}



