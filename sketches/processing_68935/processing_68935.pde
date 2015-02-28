
//variables
int mov = 830; //cambio de posicion tortuga 1
//variables tortuga 1
float crece = 90; // para crecer pelo rango entre 90 y 0 
color ojo = color(255); //cambio de color de ojos 
int cuerpo = 200; // ensanchar cuerpo rango entre 50 y 300
//variables tortuga 2
color tortuga = color(0, 90, 40); //cambio color tortuga 2
int grosor = 1; // cambio grosor pelo rango entre 1 y 10
int pupila = 20; // cambio tamaño pupila tango entre 5 y 45
//variables patricio estrella
color pantalon = color(22, 191, 4); //cambia color pantalon
float boca = 10; //cambia tamaño boca rango entre 10 y 50
float patricio = 1; //cambia grosor cuerpo rango entre 1 y 10

size(1000,500);

//tortuga 1
fill(0, 90, 40);
ellipse(170, 350, cuerpo, 200); // cuerpo tortuga
fill(0, 90, 40);
ellipse(170, 200, 150, 200); // cabeza tortuga
fill(ojo);
ellipse(120, 150, 50, 50); // ojo izq
ellipse(220, 150, 50, 50); // ojo der
fill(0);
ellipse(120, 150, 20, 20); // pupila izq
ellipse(220, 150, 20, 20); // pupila der
line(120, 240, 200, 250); // boca 
line(210, 120, 210, crece); //pelo
line(200, 120, 200, crece); //pelo
line(190, 120, 190, crece); //pelo
line(180, 120, 180, crece); //pelo
line(170, 120, 170, crece); //pelo
line(160, 120, 160, crece); //pelo
line(150, 120, 150, crece); //pelo
line(140, 120, 140, crece); //pelo
line(130, 120, 130, crece); //pelo

//tortuga 2
fill(tortuga);
ellipse(mov, 350, 200, 200); // cuerpo tortuga
fill(tortuga);
ellipse(mov, 200, 150, 200); // cabeza tortuga
fill(255);
ellipse(mov - 50, 150, 50, 50); // ojo izq
ellipse(mov + 50, 150, 50, 50); // ojo der
fill(0);
ellipse(mov - 50, 150, pupila, pupila); // pupila izq
ellipse(mov + 50, 150, pupila, pupila); // pupila der
line(mov - 40, 240, mov + 40, 250); // boca 
strokeWeight(grosor);
line(mov+40, 120, mov+40, 90); //pelo
line(mov+30, 120, mov+30, 90); //pelo
line(mov+20, 120, mov+20, 90); //pelo
line(mov +10, 120, mov +10, 90); //pelo
line(mov, 120, mov, 90); //pelo
line(mov-10, 120, mov-10, 90); //pelo
line(mov-20, 120, mov-20, 90); //pelo
line(mov-30, 120, mov-30, 90); //pelo
line(mov-40, 120, mov-40, 90); //pelo

//patricio estrella

strokeWeight(patricio);
fill(255, 36, 125);
beginShape(); //cuerpo
vertex(500, 52);
vertex(545, 203);
vertex(647, 203);
vertex(573, 282);
vertex(589, 450);
vertex(500, 355);
vertex(412, 450);
vertex(430, 282);
vertex(357, 203);
vertex(463, 203);
endShape(CLOSE);
strokeWeight(1);
fill(255);
ellipse(529, 156, 50, 50); //ojo der
ellipse(471, 156, 50, 50); //ojo izq
fill(0);
ellipse(529, 156, 20, 20); //pupila der
ellipse(471, 156, 20, 20); //pupila izq
fill(pantalon);
beginShape(); //pantalones
vertex(424, 282);
vertex(579, 282);
vertex(602, 394);
vertex(532, 404);
vertex(500, 372);
vertex(471, 404);
vertex(405, 394);
endShape(CLOSE);
fill(255, 0, 0);
ellipse(500,220,boca + 30,boca);
