
PFont fontA;
String blob = "M1L 2Y9";

void setup() {
  size(250, 250);
  background(0);
  smooth();
}

void draw() {

  frameRate(8);
  fontA= loadFont("SynchroLET-50.vlw");
  textFont(fontA);

  fill(random(255),random(255),random(255)); 
  text("M", 90, 50);
  text("1", 90, 90);
  text("L", 90, 130);

  frameRate(12);
  fill(random(255),random(255),random(255)); 
  text("2", 120, 170);
  text("Y", 120, 210);
  text("9", 120, 245);

  if(mousePressed) {
    fill(random(255));   
    text(blob, mouseX, mouseY);
  }
}


