
int counter;

void setup() {
  size(500, 500);
  background(0); 
  colorMode(HSB);  
  
}

void draw() {
 
  noStroke();
  fill(random(255),155,255,100);
  
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 12, 12);
  }
  else {
    ellipse(0);
  }
}
