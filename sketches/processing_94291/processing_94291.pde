
void setup() {
  size(60, 600);
  background( 247, 178, 27);
  stroke(255);
  smooth();
  textFont(createFont("Georgia", 24));
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  stroke(255, 3);
  line(s, 0, s, 200);
  line(m, 200, m, 400);
  line(h, 400, h, 600);
  
  textAlign(CENTER);
  drawType(width* 0.5);
  }
  
void drawType(float x) {
  fill(247, 178, 27);
  text("longer?", x, 100);
  text("longer?", 50, 170);
  text("how", x, 10);
  text("much", 55, 50);
  text("much", x, 140);//top
  text("longer?", x, 300);
  text("longer?", 50, 370);
  text("how", x, 310);
  text("much", 55, 350);
  text("much", x, 340);//middle
  text("longer?", x, 500);
  text("longer?", 50, 570);
  text("how", x, 510);
  text("much", 55, 550);
  text("much", x, 540);
  
} 

void mousePressed() {
  if (mousePressed == true) {
    rect(0, 0, 500, 500);
    fill(255, 50);
    text("patient.", 0, 300);
    stroke(255);
  }
}


