
size(1050, 600);

/*
VARIABLES
*/

int pos = 650; //posición de x, esta variable suma pixeles a x.

int china = 310; //posición de x para la cabeza de china.

int chinapos = 15; //posición cuerpo china

color traj = color(218, 182, 3); //color traje chino derecho.

color cierr = color(122, 24, 24); //color cierre traje chino derecho.

/*
PAiSAjE
*/

noStroke();
fill(0, 196, 196);
rect(0, 0, 1050, 342); //cielo

fill(111, 137, 99);
rect(0, 342, 1050, 258); //tierra


/*
CHINO IZQUIERDO
*/

fill(218, 182, 3);
ellipse(173, 460, 36, 36); //zapato izq

ellipse(228, 460, 36, 36); //zapato der

fill(122, 24, 24); //traje
beginShape();
vertex(313, 273);
vertex(264, 186);
vertex(140, 186);
vertex(91, 273);
vertex(128, 293);
vertex(140, 272);
vertex(140, 385);
vertex(264, 385);
vertex(264, 272);
vertex(276, 293);
vertex(313, 273);
endShape(CLOSE);

noStroke(); //cabeza
fill(255, 249, 222);
ellipse(202, 186, 95, 95);

fill(0); //pelo
arc(202, 175, 112, 112, PI, TWO_PI);

ellipse(179, 189, 5, 5); //ojo izq

ellipse(226, 189, 5, 5); //ojo izq

stroke(0);
strokeWeight(2);
line(167, 187, 193, 187); //ojo izq

line(214, 187, 240, 187); //ojo der

noFill();
arc(203, 200, 56, 56, 0.00, 3.14); //boca

stroke(219, 182, 0);
strokeWeight(4);
line(202, 234, 202, 341); //cierre traje

noStroke();
fill(0);
rect(154, 385, 40, 75); //pierna izq

quad(208, 385, 248, 385, 248, 460, 208, 460); //pierna der 

/*
CHINO DERECHO
*/

noStroke();
fill(traj);
ellipse(173 + pos, 460, 36, 36); //zapato izq

ellipse(228 + pos, 460, 36, 36); //zapato der

fill(traj); //traje
beginShape();
vertex(313 + pos, 273);
vertex(264 + pos, 186);
vertex(140 + pos, 186);
vertex(91 + pos, 273);
vertex(128 + pos, 293);
vertex(140 + pos, 272);
vertex(140 + pos, 385);
vertex(264 + pos, 385);
vertex(264 + pos, 272);
vertex(276 + pos, 293);
vertex(313 + pos, 273);
endShape(CLOSE);

noStroke(); //cabeza
fill(255, 249, 222);
ellipse(202 + pos, 186, 95, 95);

fill(0); //pelo
arc(202 + pos, 175, 112, 112, PI, TWO_PI);

ellipse(179 + pos, 189, 5, 5); //ojo izq

ellipse(226 + pos, 189, 5, 5); //ojo izq

stroke(0);
strokeWeight(2);
line(167 + pos, 187, 193 + pos, 187); //ojo izq

line(214 + pos, 187, 240 + pos, 187); //ojo der

noFill();
arc(203 + pos, 200, 56, 56, 0.00, 3.14); //boca

stroke(cierr);
strokeWeight(4);
line(202 + pos, 234, 202 + pos, 341); //cierre traje

noStroke();
fill(0);
rect(154 + pos, 385, 40, 75); //pierna izq

quad(208 + pos, 385, 248 + pos, 385, 248 + pos, 460, 208 + pos, 460); 
//pierna der 

/*
CHINA
*/

ellipse(475 + chinapos, 460, 24, 24); //pies

ellipse(520 + chinapos, 460, 24, 24);

ellipse(463, 132, 24, 24); //tomates

ellipse(560, 132, 24, 24);

fill(122, 24, 24);
quad(445 + chinapos, 191, 552 + chinapos, 191, 552 + chinapos, 293, 445 + chinapos, 293); //torso

fill(0);
quad(445 + chinapos, 293, 552 + chinapos, 293, 552 + chinapos, 390, 445 + chinapos, 390); //falda

stroke(219, 182, 0); //cinturón
strokeWeight(4);
line(445 + chinapos, 283, 552 + chinapos, 283);

line(445 + chinapos, 293, 552 + chinapos, 293);

line(445 + chinapos, 302, 552 + chinapos, 303);

fill(66, 15, 15); //brazos
noStroke();
rect(429 + chinapos, 191, 16, 80); 

rect(552 + chinapos, 191, 16, 80);

rect(462 + chinapos, 390, 27, 70); //piernas

rect(506 + chinapos, 390, 27, 70);

noStroke(); //cabeza
fill(255, 249, 222);
ellipse(202 + china, 186, 95, 95);

fill(0); //pelo
arc(202 + china, 175, 112, 112, PI, TWO_PI);

ellipse(179 + china, 189, 5, 5); //ojo izq

ellipse(226 + china, 189, 5, 5); //ojo izq

stroke(0);
strokeWeight(2);
line(167 + china, 187, 193 + china, 187); //ojo izq

line(214 + china, 187, 240 + china, 187); //ojo der

noFill();
arc(203 + china, 200, 56, 56, 0.00, 3.14); //boca

stroke(219, 182, 0); //pinches tomates
strokeWeight(4);
line(464, 144, 475, 131);

line(548, 131, 560, 144);
