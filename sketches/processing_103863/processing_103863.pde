
int num = 50;
int[] x = new int[num];
int[] y = new int[num];

void setup() {
size(1000, 1000); 
noStroke();
smooth();
fill(255, 102);
} 
void draw() {
background(0); //Desplaza los valores a la derecha
for (int i = num-1; i > 0; i--) {
x[i] = x[i-1];
y[i] = y[i-1];

} //Agrega nuevos valores al inicio del array 
x[0] = mouseX;
y[0] = mouseY; //Dibuja los círculos 
for (int i = 0; i < num; i++) {
  ellipse(x[i], y[i], i/0.1, i/0.1);
}
}
