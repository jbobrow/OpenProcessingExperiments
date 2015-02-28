
int x;
PFont futuraFont;
PFont cS;
PImage screaming;

void setup(){
  size(500,500);
  x = 20;
  cS = loadFont("ComicSansMS-50.vlw");
  screaming = loadImage("screaming.jpg");
}

void draw(){
  image(screaming,0,0);
  tint(255,0,0);
  fill(255);
  text("FUCK YOU",160,323);
  fill(255);
  textFont(cS);
  text("COMIC SANS",160,377);
}

