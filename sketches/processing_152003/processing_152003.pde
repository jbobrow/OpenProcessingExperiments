
int x, y;
 
void setup() {
 
size(250, 250);
}
 
void draw() {
 
x = mouseX;
 
y = mouseY;
 
println(x + " !" + y);
 
rect(x, y, 100, 20);
}
