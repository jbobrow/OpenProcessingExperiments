
PFont thisfont;

void setup(){
  size(800,400);
  background(0,0,128);
  thisfont = loadFont("Andalus-48.vlw");
}

void draw(){
  fill(255);
  textFont(thisfont);
  textSize(random(400));
  text("FREE EYEBROW PLUCKING",mouseX,mouseY);
}


