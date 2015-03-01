
int x = 0
int y = 0
int xdirection = 2
int ydirection = 4

void setup() {
size(600,400);
}
void draw() {
background(0,255,0);
rect(x,200,y,40);
x = x + xdirection;
y = y + ydirection;
if (x<0) {
xdirection = 2;
}
if (x>555) {
xdirection = -2;
}
if (y<0) {
ydirection = 4;
}
if (y>300) {
ydirection = -4;
}
