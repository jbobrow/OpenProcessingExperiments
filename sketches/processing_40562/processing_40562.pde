
Ball b1, b2, b3;

void setup() {
size (800,600);
smooth();

b1 = new Ball (50, #0000FF, 100, 200);
b2 = new Ball (100, #FF00FF, 200, 200);
b3 = new Ball (300, #00FF00, 400, 500);
}

void draw() {
// background (200);
b1.randomMove();
b1.display ();

b2.display ();
b2.move(4, 0);

b3.display ();
b3.move(0, -4); 
}
 
class Ball {
int diameter;
color ballColor;
int x, y;

Ball (int d, color c, int _x, int _y) {
diameter = d;
ballColor = c;
x = _x;
y = _y;
}

void display() {
fill (ballColor);
ellipse (x, y, diameter, diameter);
}

void move (int dx, int dy) {
    x += dx;    y += dy;
}    
    
void randomMove() {
x += int(random(-2, 1));
y += int(random(1, 1));
    }
}
                
                
