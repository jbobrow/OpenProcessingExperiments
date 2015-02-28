
void setup() {
  size(400, 400);
  background(0, 0, 0);
}

void draw() {
  
  if(mousePressed){
    int x = mouseX;
    int y = mouseY;
    
    float c1,c2,c3;
    c1 = random(255);
    c2 = random(255);
    c3 = random(255);
    stroke(c1, c2, c3);
    strokeWeight(10);
    
    line(200, 200, mouseX, mouseY);
  }
}


