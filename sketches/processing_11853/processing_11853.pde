
void setup() {
size(300, 300);
}
void draw() {
background(204);
// Asigna el valor horizontal del valor del cursor a x
float x = mouseX;
// Asigna el valor de la vertical del cursor a y
float y = mouseY;
line(x, y, x+70, y-40);
line(x+10, y, x+30, y-40);
fill(5,77,77);
ellipse(x, y, 40, 140);
}



