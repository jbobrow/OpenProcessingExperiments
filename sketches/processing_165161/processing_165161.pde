

void setup() {
  size(600, 600);
  background(255);
}
void draw() {
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == '1') {
      noStroke();
      fill(random(255),random(255),random(255));
      ellipse(mouseX, mouseY, 20, 20);
    }
  }
  popStyle();
    
    
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == '2') {
      noStroke();
      fill(147,112,219);
      noFill();
      smooth();
      stroke(0);
      strokeWeight(5);
      ellipseMode(CENTER);
      ellipse(mouseX, mouseY, 200, 200);
      ellipse(mouseX -.1, mouseY -30, 20, 20);
      ellipse(mouseX -20, mouseY -30, 20, 20);
      arc(mouseX, mouseY, 100, 120, 0.2, PI - 0.2);

    }
  }
 popStyle();
   
  pushStyle();
  if (keyPressed && mousePressed) {
    if (key == '3') {
      noStroke();
      fill(random(150),random(200),random(250));
      ellipse(mouseX, mouseY, random(150),random(150));}}
  popStyle();
}



