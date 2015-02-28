
/*

IDEP 2010 - Alba Corral
Miro: Estatico
 
 Nombre: Gabriela Lopes
 Fecha:  27/05/2010
*/

size(640,460);
noStroke();
smooth();

noStroke();
fill(241,234,228);
rect(0,0,640,460);

//stroke escuro
fill(45,45,45);
rotate(PI/-45);
rect(-30,270,880,50);

fill(68,70,69);
rect(-40,310,880,350);
filter(BLUR, 1);

//bola azul
fill(85,130,193);
ellipse(75, 220, 40, 45);
fill(69,104,172,80);
ellipse(73, 216, 30, 30);
//fim bola azul

//bola verde
fill(84,108,87);
ellipse(150, 65, 45, 50);
fill(61,71,63,80);
ellipse(147, 62, 30, 33);
//fim bola verde

//bola vermelha/ suelo
fill(73,56,48,70);
ellipse(150, 400, 75, 70);

fill(89,50,40);
ellipse(145, 390, 20, 20);

fill(89,50,40,90);
ellipse(149, 388, 40, 40);
//fim bola vermelha / suelo

// naranja
fill(199,146,46,50);
ellipse(450, 400, 85, 88);
fill(179,82,50,150);
ellipse(455, 391, 50, 53);
//fim naranja

// vermelho cerca del bolao
fill(174,40,31,180);
ellipse(450, 220, 60, 63);
fill(174,40,31,170);
ellipse(450, 218, 48, 53);
// fim vermelho cerca del bolao

//gray fuerte
fill(55,56,58,200);
ellipse(530, 150, 50, 50);
fill(55,56,58);
ellipse(529, 150, 40, 40);

//otro
fill(113,101,79,200);
ellipse(590, 230, 50, 50);
fill(70,67,62,190);
ellipse(589, 229, 40, 40);
filter(BLUR, 1);

// bola vermelha grande e pingos
fill(165,32,49);
ellipse(300, 140, 300, 190);


fill(191,55,63,60);
ellipse(290, 130, 250, 150);

fill(165,32,49);
ellipse(455, 143, 4, 4);
fill(165,32,49);
ellipse(449, 143, 3, 3);
fill(165,32,49);
ellipse(157, 100, 2, 2);
fill(165,32,49);
ellipse(175, 200, 5, 5);
//fim bola vermelha



