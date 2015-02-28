
//Color figura 1 (cíclope) y borde de desplazamiento de figura 1
color c = color(255, 0, 0);
//Borde figura 1 (cíclope)
int bordeA = 3;
//Desplazamiento de figura 1 (cíclope)
int desplazar = 550;

//Color figura 1 desplazada (cíclope)
color g = color(255, 255, 0);
//Borde figura 1 desplazada (cíclope)
int bordeB =1;
//Color de ojo de figura 1 desplazada (cíclope)
color m = color (255, 0, 0);

//Color figura 2 (pulpo)
color p= color(245, 125, 255);
//Desplazamiento Ojo de figura 2
int mover = 50;
//Borde figura 2 (pulpo)
int bordep = 2;


size(1000, 600);
background(255);

//Dibujo figura 1 (cíclope)
strokeWeight (bordeA);
fill(c);
beginShape();
vertex(183, 120);
vertex(246, 120);
vertex(276, 181);
vertex(299, 354);
vertex(281, 354);
vertex(251, 237);
vertex(248, 442);
vertex(229, 442);
vertex(211, 316);
vertex(191, 442);
vertex(168, 442);
vertex(171, 237);
vertex(137, 354);
vertex(118, 354);
vertex(149, 181);
endShape(CLOSE);

//Dibujo del ojo del cíclope
noStroke();
fill(255);
ellipse(214, 190, 55, 55);
fill(0);
ellipse(214, 190, 30, 30);

//Desplazamiento de figura 1 (cíclope)
stroke(c);
strokeWeight(bordeB);
fill(g);
beginShape();
vertex(183 + desplazar, 120);
vertex(246 + desplazar, 120);
vertex(276 + desplazar, 181);
vertex(299 + desplazar, 354);
vertex(281 + desplazar, 354);
vertex(251 + desplazar, 237);
vertex(248 + desplazar, 442);
vertex(229 + desplazar, 442);
vertex(211 + desplazar, 316);
vertex(191 + desplazar, 442);
vertex(168 + desplazar, 442);
vertex(171 + desplazar, 237);
vertex(137 + desplazar, 354);
vertex(118 + desplazar, 354);
vertex(149 + desplazar, 181);
endShape(CLOSE);

//Dibujo del ojo del cíclope desplazado
noStroke();
fill(m);
ellipse(214 + desplazar, 190, 55, 55);
fill(0);
ellipse(214 + desplazar, 190, 30, 30);


//Dibujo personaje 2 (pulpo)
stroke (143, 0, 152);
strokeWeight(bordep);
fill(p);
beginShape();
vertex(435, 154);
vertex(458, 130);
vertex(520, 130);
vertex(543, 154);
vertex(543, 406);
vertex(583, 406);
vertex(621, 379);
vertex(593, 447);
vertex(543, 447);
vertex(519, 422);
vertex(489, 447);
vertex(458, 422);
vertex(435, 447);
vertex(385, 447);
vertex(357, 379);
vertex(395, 406);
vertex(435, 406);
endShape(CLOSE);

//Ojos de la figura 2 (pulpo)
noStroke();
fill(255);
ellipse (466, 204, 26, 26);
ellipse (466 + mover, 204, 26, 26);
fill(0);
ellipse (466, 204, 13, 13);
ellipse (466 + mover, 204, 13, 13);

//Boca de figura 2 (pulpo)
fill(0);
quad(484, 235, 498, 235, 496, 250, 486, 250);
