
size(550,300);
background(1,0,88);
smooth();
noStroke();

//Variables movimiento fantasma
int D;
D = 120;
println(D);

//desplazamiento pupilas fantasmitas (del -15 al 0)
int O;
O = -15;
println(O);

//variables color fantasmas
color R = color(217,2,0);
color G = color(0,153,0);
color B = color(0,153,169);
color M = color(190,0,170);

//Desplazamiento packman
int P;
P = -10;
println(P);

//variable Pckman achatamiento
int T;
T= 5;
println(T);

//variable Packman tamaño ojo
int J;
J= 5;
println(J);

//Variable color cuerpo packman
color W = color(255);
color Y = color(255,255,0);


// fanatasmitas 1
fill(G);
beginShape();
vertex(37,181);
vertex(37,262);
vertex(50,245);
vertex(65,262);
vertex(78,245);
vertex(94,262);
vertex(108,245);
vertex(122,262);
vertex(139,245);
vertex(151,262);
vertex(151,179);
endShape(CLOSE);

arc(94,181,114,116,PI/3.34,6.31);
fill(255);
ellipse(61,182,34,38);
fill(0);
ellipse(68+O,188,17,16);

fill(255);
ellipse(61 + 50,182,34,38);
fill(0);
ellipse(68 + 50+O,188,17,16);


// fanatasmitas 2
fill(R);
beginShape();
vertex(57+D,181);
vertex(57+D,262);
vertex(70+D,245);
vertex(85+D,262);
vertex(98+D,245);
vertex(114+D,262);
vertex(128+D,245);
vertex(142+D,262);
vertex(159+D,245);
vertex(171+D,262);
vertex(171+D,179);
endShape(CLOSE);

arc(114+D,181,114,116,PI/3.34,6.31);
fill(255);
ellipse(81+D,182,34,38);
fill(0);
ellipse(88+D,188,17,16);

fill(255);
ellipse(81+D + 50,182,34,38);
fill(0);
ellipse(88+D + 50,188,17,16);


//packman
fill(Y);
arc(420+P,160+T,215+T,217,3.5,8.9);

fill(0);
ellipse(416+P,106,28+J,43);
