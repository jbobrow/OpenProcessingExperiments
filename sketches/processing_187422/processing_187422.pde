
int x = 0;
int xdirection = 2;

void setup() {
size(600,400);}

void draw() {
background(150,200,100);
stroke(255);
rect(x,0,80,400);
x = x + xdirection;

if (x<0){xdirection = 2;}
if (x>520){xdirection = -2;}

}
