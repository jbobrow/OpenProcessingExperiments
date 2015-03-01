
// BOLITA QUE SE MUEVE CON LA PRESION DEL MOUSE
float px = 1;

void setup () {
size(600, 600);
}
void draw() {
background(0);
if (mousePressed) {
px= px - 1;
}


else {
px=px+1;
}
ellipse(px, 300, 30, 30);
}

