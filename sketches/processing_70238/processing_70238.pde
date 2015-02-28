
//Variables Pac Man
//Variable color pacman y ms. pacman
color amarillo = color (242,240,0);
//Variable Trazado Pacman, Ms Pacman, Fantasma
int trazo = 5;
//Variable desplazamiento hacia arriba pacman, ms. pacman, fantasma
int mover = -100;

//Variables Ms. Pac Man
//Variable desplazamiento ms. pac man boca hacia abajo
int desinf = 125;
//Variable desplazamiento ms.pac man cuerpo hacia la izquierda
int desizq = -220;
//Variable color Ms.pacman labios y cinta
color rojo = color (254,0,0);

//Variables Fantasma
//Variable boca fantasma
int desarriba = 40;
//Variable desplazamiento fantasma ojo hacia derecha
int ojoder = 55;
//Variable color fantasma
color azul = color (0,114,187);

//Mesa de trabajo
size(700,320);
background(37,88,197);
noStroke();

//Pac-man
fill(amarillo);
stroke(0);
strokeWeight(trazo);
strokeCap(SQUARE);
//cuerpo
arc(350, 262+mover, 200, 200, 0.79, TWO_PI-QUARTER_PI);
//ojo
fill(0);
ellipse(350,222+mover,22,22);
//trazo boca
line(350,259+mover,420,335+mover);
line(350,261+mover,420,189+mover);

//Ms.Pac-man
fill(amarillo);
stroke(0);
strokeWeight(trazo);
strokeCap(SQUARE);
//cuerpo
arc(350+desizq, 262+mover, 200, 200, 0.79, TWO_PI-QUARTER_PI);
fill(0);
//ojo
ellipse(350+desizq,222+mover,22,22);
//trazo boca
line(350+desizq,259+mover,420+desizq,335+mover);
line(350+desizq,261+mover,420+desizq,189+mover);
//cinta
fill(rojo);
triangle(35,182+mover,84,175+mover,56,217+mover);
triangle(71,181+mover,98,139+mover,120,174+mover);
ellipse(76,177+mover,20,20);
//labios
arc(188,200+mover,22,22,HALF_PI+QUARTER_PI,TWO_PI-QUARTER_PI);
arc(188,200+desinf+mover,22,22,QUARTER_PI,TWO_PI-HALF_PI-QUARTER_PI);

//Fantasma
fill(azul);
//cuerpo
beginShape();
vertex(472,357+mover);
vertex(473,224+mover);
vertex(632,224+mover);
vertex(639,357+mover);
vertex(611,336+mover);
vertex(584,357+mover);
vertex(555,336+mover);
vertex(528,357+mover);
vertex(500,336+mover);
endShape(CLOSE);
//parte superior cuerpo
arc(553,227+mover,159,132,HALF_PI+HALF_PI, TWO_PI);
noStroke();
fill(255);
ellipse(544,235+mover,49,52);
fill(0);
ellipse(534,237+mover,22,24);
//ojos
fill(255);
ellipse(544+ojoder,235+mover,49,52);
fill(0);
ellipse(534+ojoder,237+mover,22,24);
