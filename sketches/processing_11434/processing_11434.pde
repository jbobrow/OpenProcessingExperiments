

void setup() {
background (206, 243, 255);
  size(600, 600);
smooth();
}

void draw() {
if (mousePressed) {
fill(254, 255, 207);

fill(12, 34, 118);
} else {
fill(255);
}
ellipse (mouseY, mouseX, key, key);
ellipse (mouseX, mouseY, 45, 45);
 
}

