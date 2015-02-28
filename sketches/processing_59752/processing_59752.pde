
void setup() {
  size(500,500);
  background(255);
  println("test");
  smooth();
}

void draw(){
    //noStroke();
    fill(mouseX,mouseY,mouseY,mouseX);
    ellipse(250,250,mouseX,mouseY);
}

void mousePressed(){
  saveFrame("Kreise.png");
}

void keyPressed(){
  background(255);
}

