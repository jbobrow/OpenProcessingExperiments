
int x = 0;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  for (int y = 0; y <= width +10; y += 20) {
    for (int x = 0; x <= height+10 ; x += 20) {
      if ((dist(mouseX,mouseY, pmouseX, pmouseY)) < 40) {
        if (mouseX>=10 && mouseX<=500) {
          stroke(5);   
          fill(30, 120, 150, 20);
        }
        rect(x, y, 20+random(0, 10), 20+random(0, 10));
      }
      else {
        fill(mouseX,mouseY, pmouseX);
      }}

      noStroke();
      ellipse(x, y, 10, 10);
      if (mousePressed) {
        stroke(1);
        line (250, 250,mouseX, mouseY);
      }
    }
  
}


