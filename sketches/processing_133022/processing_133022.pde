
int counter;

void setup() {
  size(250, 250);
  background(255);
  colorMode(HSB);
  counter = 0;
}

void draw() {
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
