
PFont thisfont;

void setup(){
  size(800,400);
  background(random(255),random(255),random(255));
  thisfont = loadFont("Dialog.plain-48.vlw");
  
  fill(0);
  textFont(thisfont);
  textSize(40);
  text("free",730,40);
}

void draw(){
  fill(255,0,80);
  textFont(thisfont);
  textSize(100);
  text("Ladies Drink For Free",0,400);
}
