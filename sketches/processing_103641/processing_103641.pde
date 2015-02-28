
float xPos = 0;
float yPos = 0;

void setup() {
  size(800, 800);
  background(255);
  rect(
}

void draw() {
  xPos = mouseX;
  yPos = mouseY;

  if (mousePressed) {
    noStroke();
    fill(#7da649);
    rect(xPos, yPos, 50, 50,7,7,7,7);
  } 
  
  if(keyPressed && key == 'r'){
    background(255);
  }
}
