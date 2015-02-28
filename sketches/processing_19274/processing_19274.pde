
PFont font;
float angle = 20.0;

void setup() {
  size(250, 250);
  background(#22332C);
  font = loadFont ("Futura-Medium-25.vlw");
  smooth();
  frameRate(185);
  
}

void draw() {
//'trail' fill and rotation settings
  fill(#6FA66F, 100);
  rotate(angle);
  angle += random(2, 9);
  
//lines that cut through sketch
  stroke(#22332C);
  strokeWeight(12);
  line(0, 100, 250, 250);
  
//text input
  text("K", mouseX, mouseY);
  text("9", pmouseX+10, pmouseY);
  text("A", mouseX+20, mouseY);
  text("5", pmouseX+30, pmouseY);
  text("N", mouseX+40, mouseY);
  text("7", pmouseX+50, pmouseY);

//sketch clears when moust clicked
  if (mousePressed == true){
    background(#22332C);
  }
}



