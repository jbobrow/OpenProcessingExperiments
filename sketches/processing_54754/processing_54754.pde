
PFont thisfont;

void setup(){
  size(400,400);
  background(255,128,255);
  thisfont = loadFont("JokermanLetPlain-48.vlw");
}

void draw(){
mousePressed=true();
  fill(128,255,128);
  textFont(thisfont);
  textSize(random(400));
  text("Fashion Wigs");
}
