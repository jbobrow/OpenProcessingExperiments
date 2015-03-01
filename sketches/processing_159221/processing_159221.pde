
// Miguel ALfonso Valdivieso
// Mestria en educaciÃ³n
color bg=255;
int borde=12;
void setup() {
size(500, 500);
} 


void draw() {
background(bg); // la funciÃ�Â³n mouseX actua en los elementos de la ventana
if (mouseX >= borde && mouseX<=(width-borde) && mouseY >= borde && mouseY<=(width-borde) ) {
bg = color(random(255), random(255), random(255)
);
}
else{
background(0);
}
} 
