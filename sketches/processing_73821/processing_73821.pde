
PFont font;
float percent;

void setup() {
  size (300, 300);
  background(0);
  stroke(255);
  percent = 0; 
  font = createFont("Helvetica", 15, true);
  textFont(font);
}

void draw() {
  background(0);
  noFill();
  rect(50, 150, 200, 20);
  fill(255);
  if (percent < 200) {percent += (200f/300f);}
  int hundPerc = round(percent/2);
  text("Loading" , 50, 140);
  text(hundPerc + "%", 220, 140);
  rect(50, 150, percent, 20);
}

void mousePressed() {
  if (percent >= 200) {
    percent = 0;
  } 
}
