
//Variables are declared at the top of the program.
int circleX, circleY;
 
int x, y;
 
//This is a setup function:
void setup() {
 
size(1000, 1000);
 
smooth(20);
}
 
//This is a draw function:
void draw() {
 
x = mouseX;
 
y = mouseY;
 
quadCircle(x, y, 450, 450, 450, 455, 15, 0, 250);
}
 
void quadCircle(int x, int y, int circleX, int circleY, int size, int red, int green, int blue, int alpha) {
 
fill (red, green, blue, alpha);
 
ellipse(circleX, circleY, size, size);
 
if (mouseOverCircle(circleX, circleY, x, y, size) == true) {
 
fill(#FF8D00);
}
 
else {
 
fill(0);
}
 
ellipse(circleX + size/4, circleY + size/4, size/4, size/4);
 
if (mouseOverCircle(circleX, circleY, x, y, size) == true) {
 
fill(#00FFE8);
}
 
else {
 
fill(0);
}
 
ellipse(circleX + size/4, circleY - size/4, size/4, size/4);
 
if (mouseOverCircle(circleX + size/4, circleY - size/4, x, y, size) == true) {
 
fill(110);
}
 
else {
 
fill(0);
}
 
ellipse(circleX - size/4, circleY - size/4, size/4, size/4);
 
if (mouseOverCircle(circleX - size/4, circleY - size/4, x, y, size) == true) {
 
fill(#7AAF93);
}
 
else {
 
fill(0);
}
 
ellipse(circleX - size/4, circleY + size/4, size/4, size/4);
 
if (mouseOverCircle(circleX - size/4, circleY + size/4, x, y, size) == true) {
 
fill(#FF8D00);
}
 
else {
 
fill(0);
}
}
 
boolean mouseOverCircle(int circleX, int circleY, int x, int y, int size) {
 
if (dist(circleX, circleY, x, y) < size/2) {
 
return true;
}
 
else {
 
return false;
}
}
