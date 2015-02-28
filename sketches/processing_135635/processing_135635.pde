
void setup() {  
  size(250, 250);
  background(255); 
  colorMode(HSB);   
}

void draw() { 
  noStroke();
  fill(random(0,255),100,255,50);
    ellipse(mouseX, mouseY, 20, 20);
  }

