
PFont myFont;
void setup() {
   size(320,160); 
   myFont=loadFont("Arial-Black-48.vlw");
}
void draw() {
  background(255);
  stroke(0);
  fill(0); 
  if (mouseX < 80 && mouseY < 80) { 
    rect(0,0,80,80);
  } else if (mouseX < 180  && mouseY < 80) {
    rect(80,0,80,80);
  } else if (mouseX < 270  && mouseY < 80) {
    rect(160,0,80,80);
  } else if (mouseX < 320  && mouseY < 80) { 
    fill(#fff000);
    noStroke();
    rect(0,0,320,80);
  } else if (mouseX < 80 && mouseY > 80) {
    rect(0,80,80,80);
  } else if (mouseX < 160 && mouseY > 80) {
    rect(80,80,80,80);
    } else if (mouseX < 240 && mouseY > 80) {
    rect(160,80,80,80);
  } else if (mouseX < 320 && mouseY > 80) {
    fill(#ff0000);
    noStroke();
    rect(0,80,320,80);
  }
  textFont(myFont);
  fill(255);
  textSize(67);
  text("Take", 20,70);
  text("Action!", 20,150);
}


