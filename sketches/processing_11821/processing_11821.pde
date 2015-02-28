
Diagonals da, db;
void setup() {
size(200, 200);
smooth();
da = new Diagonals(0, 80, 1, 2, 0);
db = new Diagonals(0, 55, 2, 6, 255);
}
void draw() {
background(242, 242, 242);
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
strokeWeight(thick);
stroke(gray);

fill(120, 142, 215);
ellipse(x+1, y, x-20, y+40);

fill(224, 91, 91);
ellipse(x, y, x+40, y-10);

x = x + speed;
if (x > 100) {
x = -100;
}
}
}

