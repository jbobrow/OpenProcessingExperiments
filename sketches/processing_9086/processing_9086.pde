
int oldMouseX = 0;
int oldMouseY = 0;

void setup() {
  size(400, 400);
  background(255);
  frameRate(12);
}

void draw() {
  float rayonX = random(100);
  float rayonY = random(100);
  float rotation = random(360);
  fill(random(255), random(255), random(255), random(100));
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(rotation);
  noStroke();
  
  if (random(2) < 1) rect(-(rayonX/2), -(rayonY/2), rayonX, rayonY);
  else ellipse(0, 0, rayonX, rayonY);
  
  if (mousePressed) {
    fill(random(255), random(255), random(255), 155 + random(100));
    String string = ""; 
    
    for (int i = 0; i < 3 + int(random(20)); i++) {
      string += char(int(random(255)));
    }  
    
    text(string, 0, 0);
  }
  
  popMatrix();
  stroke(random(255), random(255), random(255));
  strokeWeight(1 + random(5));
  line(oldMouseX, oldMouseY, mouseX, mouseY);
  filter(BLUR, 1);
  filter(DILATE);
  oldMouseX = mouseX;
  oldMouseY = mouseY;
}

