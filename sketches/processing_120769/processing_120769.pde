
int x = 0;
 
void setup() {
  size(1000, 1000);
  background(255);
  smooth();
}
 
void draw() {
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if (keyPressed) {
    if (key == 'z') {
      background(255);
    }
    if (key == 'r') {
      stroke(255, 36, 36);
    }
    if (key == 'w') {
      stroke(255, 111, 0);
    }
     if (key == 'e') {
      stroke(250,230,0);
    }
    if (key == 'q') {
      stroke(22, 210, 10);
    }
    if (key == 't') {
      stroke(2, 102, 222);
    }
     if (key == 'y') {
      stroke(109,47,118);
    }
    if (key == 'u') {
      stroke(255, 49, 231);
    }
    if (key == 'x') {
      stroke(255, 255, 255);
    }
    if (key == 'i') {
      stroke(0);
    }
    if (key == '+') {
       strokeWeight(x++);
    }
    if (x == 0) {
       x = 0;
    } else if (key == '-'){
      strokeWeight(x--);
    }
  }
}

/* Teclado
r = rojo
w = naranja
e = amarillo
q = verde
t = azul
y = violeta
u = rosa
i = negro
z = nuevo papel
x = borrar
+ = augmentar
- = disminuir
*/


