
int counter;
size(800, 600);
background(198, 189, 205);

int desplazamiento = 440;
int desplazamientob = 220;

int borde = 1;

color c = color (179, 154, 189);
color b = color (243, 182, 215);
 
//cuerpo mono
noStroke();
fill(c);
beginShape();
vertex(162, 350);
vertex(162, 375);
vertex(135, 375);
vertex(100, 450);
vertex(125, 450);
vertex(150, 400);
vertex(125, 500);
vertex(150, 500);
vertex(175, 450);
vertex(200, 500);
vertex(225, 500);
vertex(200, 400);
vertex(225, 450);
vertex(250, 450);
vertex(215, 375);
vertex(188, 375);
vertex(188, 350);
endShape(CLOSE);
//cabeza
noStroke();
fill(c);
ellipse(175, 290, 150, 150);
//cabeza lado claro
noStroke();
fill(236, 220, 243);
ellipse(175, 330, 98, 60);
//ojo izquierdo
noStroke();
fill(84, 80, 74);
ellipse(150, 333, 8, 8);
// mejilla izquierda
noStroke();
fill(b);
ellipse(150, 344, 20, 10);
//ojo derecho
noStroke();
fill(84, 80, 74);
ellipse(196, 333, 8, 8);
// mejilla derecha
noStroke();
fill(b);
ellipse(196, 344, 20, 10);
//cuello triangulo derecho
noStroke();
fill(b);
triangle(150, 375, 150, 385, 175, 375);
//cuello triangulo izquierdo
noStroke();
fill(b);
triangle(200, 375, 200, 385, 175, 375);
// circ izquierdo corazón
noStroke();
fill(b);
ellipse(168, 400, 15, 15);
// cir derecho corazón
noStroke();
fill(b);
ellipse(182, 400, 15, 15);
//triangulo corazón
noStroke();
fill(b);
triangle(160, 401, 190, 401, 175, 422);

//mono2
//cuerpo mono
noStroke();
fill(b);
beginShape();
vertex(162+desplazamientob, 350);
vertex(162+desplazamientob, 375);
vertex(135+desplazamientob, 375);
vertex(100+desplazamientob, 450);
vertex(125+desplazamientob, 450);
vertex(150+desplazamientob, 400);
vertex(125+desplazamientob, 500);
vertex(150+desplazamientob, 500);
vertex(175+desplazamientob, 450);
vertex(200+desplazamientob, 500);
vertex(225+desplazamientob, 500);
vertex(200+desplazamientob, 400);
vertex(225+desplazamientob, 450);
vertex(250+desplazamientob, 450);
vertex(215+desplazamientob, 375);
vertex(188+desplazamientob, 375);
vertex(188+desplazamientob, 350);
endShape(CLOSE);
//cabeza
noStroke();
fill(b);
ellipse(175+desplazamientob, 290, 150, 150);
//cabeza lado claro
noStroke();
fill(236, 220, 243);
ellipse(175+desplazamientob, 330, 98, 60);
//ojo izquierdo
noStroke();
fill(84, 80, 74);
ellipse(150+desplazamientob, 333, 8, 8);
// mejilla izquierda
noStroke();
fill(c);
ellipse(150+desplazamientob, 344, 20, 10);
//ojo derecho
noStroke();
fill(84, 80, 74);
ellipse(196+desplazamientob, 333, 8, 8);
// mejilla derecha
noStroke();
fill(c);
ellipse(196+desplazamientob, 344, 20, 10);
//cuello triangulo derecho
noStroke();
fill(c);
triangle(150+desplazamientob, 375, 150+desplazamientob, 385, 175+desplazamientob, 375);
//cuello triangulo izquierdo
noStroke();
fill(c);
triangle(200+desplazamientob, 375, 200+desplazamientob, 385, 175+desplazamientob, 375);
// circ izquierdo corazón
noStroke();
fill(c);
ellipse(168+desplazamientob, 400, 15, 15);
// cir derecho corazón
noStroke();
fill(c);
ellipse(182+desplazamientob, 400, 15, 15);
//triangulo corazón
noStroke();
fill(c);
triangle(160+desplazamientob, 401, 190+desplazamientob, 401, 175+desplazamientob, 422);
//falda
noStroke();
fill(c);
quad(125+desplazamientob, 475, 225+desplazamientob, 475, 210+desplazamientob, 440, 140+desplazamientob, 440);
//triangulo izquierdo lazo
noStroke();
fill(c);
triangle(345, 290, 345, 310, 360, 300);
//triangulo derecho lazo
noStroke();
fill(c);
triangle(375, 290, 375, 310, 360, 300);


//mono3
//cuerpo mono
noStroke();
fill(c);
beginShape();
vertex(162+desplazamiento, 350);
vertex(162+desplazamiento, 375);
vertex(135+desplazamiento, 375);
vertex(100+desplazamiento, 450);
vertex(125+desplazamiento, 450);
vertex(150+desplazamiento, 400);
vertex(125+desplazamiento, 500);
vertex(150+desplazamiento, 500);
vertex(175+desplazamiento, 450);
vertex(200+desplazamiento, 500);
vertex(225+desplazamiento, 500);
vertex(200+desplazamiento, 400);
vertex(225+desplazamiento, 450);
vertex(250+desplazamiento, 450);
vertex(215+desplazamiento, 375);
vertex(188+desplazamiento, 375);
vertex(188+desplazamiento, 350);
endShape(CLOSE);
//cabeza
noStroke();
fill(c);
ellipse(175+desplazamiento, 290, 150, 150);
//cabeza lado claro
noStroke();
fill(236, 220, 243);
ellipse(175+desplazamiento, 330, 98, 60);
//ojo izquierdo
noStroke();
fill(84, 80, 74);
ellipse(150+desplazamiento, 333, 8, 8);
// mejilla izquierda
noStroke();
fill(b);
ellipse(150+desplazamiento, 344, 20, 10);
//ojo derecho
noStroke();
fill(84, 80, 74);
ellipse(196+desplazamiento, 333, 8, 8);
// mejilla derecha
noStroke();
fill(b);
ellipse(196+desplazamiento, 344, 20, 10);
//cuello triangulo derecho
noStroke();
fill(b);
triangle(150+desplazamiento, 375, 150+desplazamiento, 385, 175+desplazamiento, 375);
//cuello triangulo izquierdo
noStroke();
fill(b);
triangle(200+desplazamiento, 375, 200+desplazamiento, 385, 175+desplazamiento, 375);
// circ izquierdo corazón
noStroke();
fill(b);
ellipse(168+desplazamiento, 400, 15, 15);
// cir derecho corazón
noStroke();
fill(b);
ellipse(182+desplazamiento, 400, 15, 15);
//triangulo corazón
noStroke();
fill(b);
triangle(160+desplazamiento, 401, 190+desplazamiento, 401, 175+desplazamiento, 422);
