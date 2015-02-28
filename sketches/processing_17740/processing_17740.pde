
void setup() {
  size(200,200);
  background(0);
  stroke(255);
  line(width/2,0,width/2,height);
  
}

void draw() {
  background(0);
  line(width/2,0,width/2,height);
  fill(255);
  
  if (mouseX < (width/2)) {
      rect(0,0,width/2,height);
  }
}

