
void setup(){
size (500,500);
background(255);
smooth();
}
/* definições do programa*/

void draw(){
int x3=mouseX;
int y3=mouseY;
/* declaração da variavel do ponto 3, estas terão o valor da posição do rato*/
fill (random(255), random(255),random(255));
/*random de cores*/
triangle(0, 0, 0, height, x3, y3);
/*desenho dos triangulos*/
ellipse (x3, y3, 25,25);
/*desenho das bolas no ponto 3 do triangulo*/
}

