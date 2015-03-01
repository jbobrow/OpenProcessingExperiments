

int counter;
 
void setup() {
  size(500, 500);
  background( 0);
  colorMode(HSB); 
   
}
 
void draw() {
  
  noStroke();
  fill(random(89),255,300,300);
   
  if(mousePressed == true) {
    ellipse(mouseX, mouseY, 12, 12);
  }
  else {
    ellipse(0);
  }
}

