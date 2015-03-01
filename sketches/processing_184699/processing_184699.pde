
float px = 1;
float v = 5;
void setup () {
size(600, 600);
}
void draw() {
background(0);
v = v + 0.01;
if (mousePressed) {
px= px - v;
}


else {
px=px+v;
}
ellipse(px, 300, 30, 30);
}

