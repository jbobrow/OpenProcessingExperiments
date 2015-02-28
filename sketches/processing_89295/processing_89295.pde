

void setup() {
  size(600, 600);
  background(255);
}
void draw() {
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'q') {
      noStroke();
      fill(137, 207, 240);
      ellipse(mouseX, mouseY, 33, 33);
    }
  }
  popStyle();
  
  
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'w') {
      noStroke();
      fill(147,112,219);
      ellipse(mouseX + 10, mouseY, 10, 50);
      rect(mouseX,mouseY,33,33);
    }
  }
 popStyle();
 
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'e') {
      noStroke();
      fill(random(255),random(255),random(255));
      ellipse(mouseX, mouseY, random(255),random(255));}}
  popStyle();
}





