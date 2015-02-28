
void setup() {
  size(250,250);
  background (0);
  stroke(255);
  line(0,127,255,127);
}

void draw() {
  if(mousePressed) {
    stroke(240);
    fill(240);
    ellipse(random(255),random(127),random(5),random(5));
    stroke(50);
    fill(50);
    rect(random(255),random(127,255),random(10,20),random(10,20));
    smooth();
  }
  if(keyPressed){
    saveFrame ("dmf2.png");
  }
}



