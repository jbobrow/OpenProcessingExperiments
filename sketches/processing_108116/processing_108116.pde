

void setup() {
  size(700, 500);
  background(255);
  frameRate(8);
  smooth();
}

void draw() {
  float l = random(10,50);
  stroke(0);
  strokeWeight(random(.5,5));
  if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    line(mouseX, mouseY+ l,pmouseX,pmouseY+l);
  }
 // saveFrame("line-######.jpg");
}


