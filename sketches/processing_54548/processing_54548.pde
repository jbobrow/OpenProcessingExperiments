
void setup() {
size (300, 300);
stroke(0);

}
float x = 0;
void draw() {
  x = x+1;
  if (x > width) {
    x = 50;
  }
background(51);
color from = color(204, 102, 0);
color to = color(0, 102, 153);
color interA = lerpColor(from, to, .33);
color interB = lerpColor(from, to, .66);
color interC = lerpColor(from, to, .99);
color interD = lerpColor(from, to, 1.32);
color interE = lerpColor(from, to, 1.65);
color interF = lerpColor(from, to, 1.98);
fill(from);
rect(0, 0, 100, 100);
fill(interA);
rect(30, 20, 90, 90);
fill(interB);
rect(50, 40, 80, 80);
fill(to);
rect(70, 60, 70, 70);
fill(interC);
rect(90, 80, 60, 60);
fill(interD);
rect(110, 100, 50, 50);
fill(interE);
rect(130, 120, 40, 40);
fill(interF);
rect(0, 140, 300, 200);
}

