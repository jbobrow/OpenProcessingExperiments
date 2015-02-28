
int[] x = new int[256];
int[] y = new int[256];
int n = 0;
void mousePressed () {
n = 1;
x[0] = mouseX; y[0] = mouseY;
}
void mouseDragged () {
if (n <256) {
x[n] = mouseX; y[n] = mouseY;
n++;
}
}
void mouseReleased () {
n = 0;
}
void setup () {
size (200 ,200); // Tamanho da janela
strokeWeight (3); // Largura do traço
smooth (); // Arestas mais suaves
}
void diagonais (int x0 , int y0) {
for (int i = 0; i < 3; i++) {
int x = x0 + i*10;
line(x, y0 , x+20, y0 -40);
}
}
void draw () {
background (0);
for (int i = 0; i < n; i++) {
stroke (256+i-n); // Cor progressivamente mais branca
diagonais (x[i],y[i]);
}
}
