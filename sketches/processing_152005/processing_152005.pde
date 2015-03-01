
int x, y;
 
int red, green, blue;
 
void setup() {
 
size(450, 450);
}
 
void draw() {
 
x = mouseX;
 
y = mouseY;
 
println(x + " !" + y);
 
//rect(x, y, 100, 20);
 
circleRect(x, y, 255, 23, 90);
 
circleRect(x + 50, y + 50, 90, 90, 23);
}
 
void circleRect(int x, int y, int red, int green, int blue) {
 
fill(x, y, x);
 
ellipse(x, y, 30, 30);
 
fill(x, y, x);
 
rect(x - 6, y - 7, 13, 13);
}
