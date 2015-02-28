
Diagonals da, db;
void setup() {
size(200, 200);
smooth();
// Inputs: x, y, velocidad, espesor, grray
da = new Diagonals(40, 150, 4, 10, 1);
db = new Diagonals(80, 50, 2,12, 55);
}
void draw() {
background(255);
da.update();
db.update();
}
class Diagonals {
int x, y, speed, thick, gray;
Diagonals(int xpos, int ypos, int s, int t, int g) {
x = xpos;
y = ypos;
speed = s;
thick = t;
gray = g;
}
void update() {
stroke(245,139,238);
fill (141,205,243);
rect(x-60, y, x+50, y-70);
fill (64,0,128);
ellipse(x-40, y, x+40, y-80);
fill (176,239,146);
rect(x-20, y, x+60, y-80);
x = x + speed;
if (x > 100) {
x = -100;
}
}
}

