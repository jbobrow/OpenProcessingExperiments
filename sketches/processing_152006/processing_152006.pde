
int x, y;
 
int red, green, blue;
 
void setup() {
 
size(450, 450);
}
 
void draw() {
 
x = mouseX;
 
y = mouseY;
 
if (x < width/2 && y < height/2) {
 
background(#824B98);
}
 
if (x > width/2 && y > height/2) {
 
background(#6BBC5F);
}
 
if (x < width/2 && y > height/2) {
 
background(#4D81AD);
}
 
if (x > width/2 && y < height/2) {
 
background(#BC975F);
}
 
println(x + " !" + y);
 
//rect(x, y, 100, 20);
 
circleRect(x, y, 255, 23, 90);
 
}
 
void circleRect(int x, int y, int red, int green, int blue) {
 
fill(x, y, x);
 
ellipse(x, y, 30, 30);
 
 
fill(x, y, x);
 
rect(x - 6, y - 7, 13, 13);
}
