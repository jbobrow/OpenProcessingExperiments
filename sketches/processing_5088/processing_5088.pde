
void setup() {
  size(500,500);
  background(0,0,0);
  smooth();
 };

void draw() {
  //background(255,0,0);
  if (mousePressed) {
  stroke(250,250,0,50);
  line(mouseX,mouseY,250,250);
  stroke(250,250,250,50);
  fill(210,210,210,25);
  ellipse(mouseX,mouseY,25,25);
  };
};

void keyPressed() {
  if (key == 's') save("Mygraphic.png");
};

