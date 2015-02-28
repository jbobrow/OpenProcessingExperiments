
int[] y;
void setup() {
size(500, 500);
y = new int[width];
} 
void draw() {
background(204); //Desplaza los valores a la derecha 
for (int i = y.length-1; i > 0; i--) {
y[i] = y[i-1];
} //Agrega nuevos valores al comienzo
y[0] = constrain(mouseY, 0, height-1);
//Muestra cada par de valores como una línea
for (int i = 1; i < y.length; i++) {
line(i, y[i], i-1, y[i-1]);
}
}
