
void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  stroke(0);
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    noFill();
  rect(31,15,50,95);
  fill( random(30), random(240), random(80));
  ellipse(56,40,25,25);
  beginShape();//begin drawing the shape -- It's a big star
     vertex(56,69);
     vertex(61,79);
     vertex(72,80);
     vertex(64,88);
     vertex(66,98);
     vertex(56,93);
     vertex(47,98);
     vertex(49,88);
     vertex(41,80);
     vertex(52,79);
     vertex(56,69);
     endShape();
  }
}

