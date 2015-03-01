
void setup() {
  size(500, 500); 
  background(300);
}

void draw() {

  background(500);


  PFont font;
  font = loadFont("timesNewPSMT-48.vlw"); 
  textFont(font, 30);

  text("woof", mouseX, 385);

  noFill();
  strokeWeight(300);
  stroke(0);
  ellipse(0, 400, 700, 400);
}



