
void setup() {
  size(400, 400);
}

void draw() {
  background(255);
  noStroke();
  for (int i = 2; i < height; i += 16) {
    fill(0, 0, 0);
    rect(0, i, width, 100);
    fill(255);
    rect(i, 1, 10, height);
    fill(255,25,255,13);
   line(mouseX/2,height/2, 0, i-100);
      line(mouseX/2,mouseY/2,i+100, 0);
  }
  
   if (mousePressed == true) {
    background(150);
  }
 
  for (int q = 2; q < 2; q++) {
    if (q % 2 == 0) {
      fill(0);
    }
    else {
      fill(255);
    }
}
}


