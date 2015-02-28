
/* @pjs font="georgia.ttf"; */
PImage img;
String words="I could certainly go for another...";
PFont f;
int x;
void setup(){
  size(723,455);
  img = loadImage("201.png");
  x = width;
  textFont(createFont("georgia",18));
  f=loadFont("geor.vlw");
}

void draw(){
  image(img,0,0);
  fill(0);
  textFont(f);
  text("Mmm, good smoothie!",517,55);
  text(words,x,270);
  x = x-1;
}


