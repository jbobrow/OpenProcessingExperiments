
float valor1;
float valor2;
float valor3;

void setup(){
size(260,260);
}
void draw() {
background(valor1,valor2,valor3);
fill(valor1,valor2,valor3);
ellipse(130,130,valor1,valor2);
rect(valor1,valor2,valor3,20);
triangle(valor1,valor2,valor3,valor1,valor2,valor3);
quad(valor1,valor2,valor3,valor1,valor2,valor3,valor3,valor2);
ellipse(valor1,valor2,valor3,valor3);
}

void mouseMoved() {
valor1 = random(255);
valor2 = random(255);
valor3 = random(255);
}
