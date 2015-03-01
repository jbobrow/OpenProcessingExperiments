
void setup() {
size(400, 400);
background(0);
}
void draw() {
noFill();
float x = mouseX;
float y = mouseY;
float ix = width - mouseX;
float iy = mouseY - height;
ellipse(x, height/2, y, y);
ellipse(ix, height/2, iy, iy);
noFill();
stroke(240,24,57);
for (int i = 0; i < 400; i += 8) {
stroke(240,24,57-i);
line(i, 0, i, 400);
}
}

