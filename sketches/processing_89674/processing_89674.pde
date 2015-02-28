
void setup() {
  size(600, 600);
  background(255);
}
void draw() {
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'q') {
      noStroke();
      fill(random(255),random(255),random(255));
      ellipse(mouseX, mouseY, 33, 33);
      ellipse(mouseX - 33, mouseY - 33, 33, 33); 
    }
  }
  popStyle();
   
   
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'w') {
      noStroke();
      fill(147,112,219);
      rect(mouseX, mouseY, 50, 50);
      ellipse(mouseX + 51, mouseY, 50, 50);
      ellipse(mouseX - 2, mouseY, 50, 50);
      ellipse(mouseX + 25, mouseY - 30, 50, 50);
    }
  }
 popStyle();
  
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == 'e') {
      noStroke();
      fill(random(255),random(255),random(255));
      rect(mouseX, mouseY, random(255),random(255));}}
  popStyle();
}



