
void setup() {

  size(500, 500);
}

void draw() {

  fill(0, 65, 255, 50);
  rect(0, 0, width, mouseY);

  fill(255, 0, 34, 50);
  rect(0, mouseY, width, height);


  // loop for(init; test; update);
  for (int y=0; y<=mouseY; y=y+15) {
    for (int x=0; x<=width; x=x+15) {
      fill(255);
      point(x, y);
    }

    for (int x1=0; x1<width; x1 = x1+100) {
      stroke(15);    
      fill(255, 0, 34, 50);
      triangle(x1, height, x1+50, mouseY+50, x1+100, height);
    }
  }
}
