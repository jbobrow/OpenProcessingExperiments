
int desplazo =75;
int desplazo2 =200;
int desplazo3 =-200;
int desplazo4 =-60;
color cuerpo = color(142,46,39);
color cabeza = color(220,219,217);
color cuerpo2 = color(42,40,53);

size(600,600);
background(98,112,139);
smooth();
noStroke();

fill(206,153,51);
quad(0,600,600,600,600,350,0,450);

fill(25,24,29);
quad(0,0,0,300,600,50,600,0);

fill(cuerpo); // mono rojo
beginShape();
vertex(175+desplazo,300+desplazo3);
vertex(250+desplazo,300+desplazo3);
vertex(300+desplazo,400+desplazo3);
vertex(295+desplazo,410+desplazo3);
vertex(250+desplazo,350+desplazo3); //interior del brazo.
vertex(255+desplazo,400+desplazo3);
vertex(240+desplazo,450+desplazo3);
vertex(250+desplazo,550+desplazo3); //punta de la cola
vertex(210+desplazo,450+desplazo3);
vertex(200+desplazo,400+desplazo3);
vertex(190+desplazo,350+desplazo3); //interior brazo.
vertex(160+desplazo,410+desplazo3);
vertex(150+desplazo,400+desplazo3);
endShape(CLOSE);
fill(cabeza);
ellipse(212+desplazo,280+desplazo3,70,70);
fill(245);
ellipse(212+desplazo,280+desplazo3,40,40);
fill(50);
ellipse(212+desplazo,280+desplazo3,15,15);

fill(cuerpo2); // mono azul 1
beginShape();
vertex(195+desplazo4,300);
vertex(270+desplazo4,300);
vertex(320+desplazo4,400);
vertex(315+desplazo4,410);
vertex(270+desplazo4,350); //interior del brazo.
vertex(275+desplazo4,400);
vertex(260+desplazo4,450);
vertex(270+desplazo4,550); //punta de la cola
vertex(230+desplazo4,450);
vertex(220+desplazo4,400);
vertex(210+desplazo4,350); //interior brazo.
vertex(180+desplazo4,410);
vertex(170+desplazo4,400);
endShape(CLOSE);
fill(cabeza);
triangle(235+desplazo4,320,180+desplazo4,250,280+desplazo4,250);
fill(245);
ellipse(233+desplazo4,275,35,35);
fill(50);
ellipse(233+desplazo4,275,15,15);

fill(cuerpo2); //mono azul 2
beginShape();
vertex(195+desplazo2,300);
vertex(270+desplazo2,300);
vertex(320+desplazo2,400);
vertex(315+desplazo2,410);
vertex(270+desplazo2,350); //interior del brazo.
vertex(275+desplazo2,400);
vertex(260+desplazo2,450);
vertex(270+desplazo2,550); //punta de la cola
vertex(230+desplazo2,450);
vertex(220+desplazo2,400);
vertex(210+desplazo2,350); //interior brazo.
vertex(180+desplazo2,410);
vertex(170+desplazo2,400);
endShape(CLOSE);
fill(cabeza);
triangle(235+desplazo2,320,180+desplazo2,250,280+desplazo2,250);
fill(245);
ellipse(233+desplazo2,275,35,35);
fill(50);
ellipse(233+desplazo2,275,15,15);
