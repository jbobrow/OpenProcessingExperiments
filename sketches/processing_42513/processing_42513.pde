
void setup() {
  size (400, 400);
  smooth();
  noStroke();
  fill(255);
  rect(0, 0, width, height);
}


void draw() {
  
    for (int x=0; x < width; x=x+60) {
      for (int y=0; y < height; y=y+60) { 
  if (dist(x+20, y+20, mouseX, mouseY) < 20) {
        stroke(255, 83, 77);
        line(x, y, x+40, y+40);
        line(x, y+40, x+40, y);
        line(x, y+20, x+40, y+20);
        line(x+20, y, x+20, y+40);
        noStroke();
        fill(227, 143, 140);
        ellipse (x+20, y+20, 40, 40);
        fill(206, 101, 98);
        ellipse (x+20, y+20, 30, 30);
        fill(193, 50, 45);
        ellipse (x+20, y+20, 20, 20);
      }
    }
  }
  
            for (int x=0; x < width; x=x+60) {
    for (int y=0; y < height; y=y+60) { 
      stroke(219, 245, 255);
      line(x, y, x+40, y+40);
      line(x, y+40, x+40, y);
      line(x, y+20, x+40, y+20);
      line(x+20, y, x+20, y+40);
    }
}
}

