
int h;
float a=0.0;

void setup() {
  size(500, 500);
}

void draw() {
  background(int(random(255)));
  if (mousePressed == true) {
    h=int(random(50));
    drawFlash();
  }
}

void drawFlash() {
  fill(250, 230, 120);

  noStroke();
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX-5*h, mouseY+5*h);
  vertex(mouseX-h, mouseY+5*h);  
  vertex(mouseX-4*h, mouseY+10*h);    
  vertex(mouseX+3*h, mouseY+4*h);
  vertex(mouseX-2*h, mouseY+4*h);
  endShape(CLOSE);

  pushMatrix();
  a+=0.5;
  translate(mouseX, mouseY);
  rotate(a);
  stroke(255);
  strokeWeight(1);
  line(-500, 0, 500, 0);
  popMatrix();
}


