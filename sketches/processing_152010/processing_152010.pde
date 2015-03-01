
//Variables are declared at the top of the program.
int circleX, circleY;
 
int x, y;
 
//This is a setup function:
void setup() {
 
size(400, 400);
 
smooth(8);
}
 
//This is a draw function:
void draw() {
 
x = mouseX;
 
y = mouseY;
 
quadCircle(200, 200, 250, 255, 255, 0, 250);
 
//println(mouseOverCircle(750, 750, x, y, 50) == true){
 
if (mouseOverCircle(200, 200, x, y, 100) == true) {
 
fill(255);
}
 
else {
 
fill(0);
}
 
ellipse(200, 200, 100, 100);
}
 
void quadCircle(int circleX, int circleY, int size, int red, int green, int blue, int alpha) {
 
fill (red, green, blue, alpha);
 
ellipse(circleX, circleY, size, size);
}
 
boolean mouseOverCircle(int circleX, int circleY, int x, int y, int size) {
 
if (dist(circleX, circleY, x, y) < size/2) {
 
return true;
}
 
else {
 
return false;
}
}
