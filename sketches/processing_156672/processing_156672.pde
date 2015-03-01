
void setup() {
  size(400,255);
}

void draw() {
  background(0);

  int i = 0;

  while (i < width) {
    noStroke();
    
    float distance = abs(mouseX - i); 
    
    fill(distance);
    rect(i,0,10,height);
    // Increase i by 10
    i += 10;
  }
}


