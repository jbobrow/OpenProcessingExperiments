
PFont font;

void setup(){
  size(100,100);
  font = loadFont("ComicSansMS-48.vlw");
  textFont(font);
}

void draw(){
  background(0);
  int s = second();
  int m = minute();
  int h = hour();
  
  String t = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  textSize(18);
  text(t,10,55);
}

