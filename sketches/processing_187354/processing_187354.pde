
int x = 0;
int xdirection = 2;

void setup() {
size(600,400);
}
void draw() {
background(0,255,0);
rect(x,200,40,40);
x = x + xdirection;
if (x<0) {
xdirection = 2;
}
if (x>500) {
xdirection = -2;
}
}
