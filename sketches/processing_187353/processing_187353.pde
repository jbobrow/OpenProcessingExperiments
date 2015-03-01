
int rojo = 255;
int tiempo = 0;
int diametro = 50;

void setup() {
size(700, 700);
}

void draw() {
tiempo = tiempo + 1;
rojo = int(100 * (1 + sin(tiempo * 14 * PI / frameRate / 20)));
diametro = int(50 * (sin(tiempo * 50 * PI / frameRate / 5))); // Eliminado el "1 +" que va delante del "sin" hace que el cuadrado salga una vez arriba y otra debajo del mouse.

noStroke();
fill(rojo, 0, 0, 50);
rect(mouseX, mouseY, diametro, diametro);
}
