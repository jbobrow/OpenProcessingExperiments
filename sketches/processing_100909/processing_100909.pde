
float angle = 0.03;

PFont font;

void setup() {
  size(478, 640);
  background(230, 255, 134);
  smooth();
  font= loadFont("Lavanderia-Sturdy-90.vlw");
  textFont (font);
}

void draw () {
  textSize (90);
  text("Happy 21st", mouseX, mouseY -80);
  text("Birthday Jen", mouseX - 25, mouseY);
  
  if (mousePressed)  {
    fill (143, 222, 208);
  }else {
    fill(255, 255, 255);
  }
  
}



