
int x;
PFont mattFont;
PImage myImage;
PFont jeonFont;

void setup(){
  background(200,90,55);
  size(600,600);
  x = 0;
  mattFont = loadFont("ComicSansMS-48.vlw");
  myImage = loadImage("comic-sans.jpg");
  jeonFont = loadFont("Futura-MediumItalic-48.vlw");
}

void draw(){
  textFont(mattFont);
  text("comic sans",mouseX, mouseY);
  tint(0,0,150);
  image(myImage, 100, 100);
  fill(255);
  textFont(jeonFont);
  text("sucks", 200, 400);
  fill(10,2);
  
  
  ellipse(70,70,70,70);
  
}

