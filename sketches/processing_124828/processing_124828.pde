
int counter;

void setup() {
  size(2000, 600);
  background(255);
  colorMode(HSB);
  counter = 0;
}

void draw() { 
  noStroke();
  fill(random(120),225,225,100);
  
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
