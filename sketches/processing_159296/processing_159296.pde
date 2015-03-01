

void setup() { 
  size(800,300);
  background(#3C3C3C);
  stroke(#69538E);
  smooth();
}

void draw() {
   background (#3C3C3C);
   fill(#FFE99C);
   if (mousePressed && (mouseButton == LEFT)) {
    fill(0);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    fill(255);
  } else {
    fill(#FFE99C);
  }
  ellipse(mouseX,mouseY,25,25); 
  
}
