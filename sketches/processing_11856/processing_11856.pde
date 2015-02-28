
int x = 0; // setea posición horizontal
int y = 55; // setea posición vertical
void setup() {
size(400, 400); // Setea la ventana de 100 x 100 pixeles
}
void draw() {
background(14,56,43);
ellipse(x, y, x+50, y-20); // línea izq
fill(722,64,22);
ellipse(x+30, y, x+50, y-10); // línea mitad
ellipse(x+20, y, x+50, y-40); // línea der
x = x + 1; // Suma 1 a x
if (x > 100) { // Si x es mayor que 100,
x = -40; // asigna 40 a x
}
}

