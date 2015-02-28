
PImage img;
PFont font;
void setup(){
  size(768, 432);
  img = loadImage("background.png");
  image(img,0,0);
   
}

void draw(){
}

void mouseClicked(){
  float d= random(-45,90);
  float s= random(100);
  float x= random(width);
  float y= random(height);
  float o= random(99,100);
  
  rotate (radians(d));
  font = loadFont("LeviBrush-48.vlw");
  textFont(font, s);
  fill(#A62B35);
  text("BLAM!", x, y);
}

