
// Miguel ALfonso Valdivieso
// Maestria en educacion. Universidad Distrital.
color bg;
int borde=12;
void setup() {
size(500, 500);
} 


void draw() {
background(bg); // la funciÃ�ï¿½Ã�Â³n mouseX actua en los elementos de la ventana
if (mouseX >= borde && mouseX<=(width-borde) && mouseY >= borde && mouseY<=(width-borde) ) {
bg = color(120);
}
else{
background(255);
}
} 
