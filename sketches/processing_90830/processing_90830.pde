
// Emanuele Reis - Exercício (Fachada)

size (200,200);
background  (195,224,218);
noStroke ();
//Fundo
fill (200, 230, 222);
rect (0,90, 200, 80);
fill (210, 235, 230);
rect (0,160, 200, 60);
stroke(0);
// Partes do Prédio
fill (0);
rect (60,50,80,140);
fill (150);
rect (80, 40, 40,140);
fill (255);
rect (90,35, 20, 140);
rect (50, 180, 100,5);
rect (50, 80, 100,5);

fill (255);
int x=55;
int y= 20;
int w= 125;
rect (x, x+5, y, x-50);// Sacadas à direita
rect (x, x+45,y,x-50);
rect (x, x+75, y, x-50);
rect (x, x+105, y, x-50);
rect (w, x+5, y, x-50);// Sacadas à esquerda
rect (w, x+45,y,x-50);
rect (w, x+75, y, x-50);
rect (w, x+105, y, x-50);
// Entrada- Porta
rect (85, 170, 30, 20);
fill (0);
rect (90, 180, 20,10);
fill (255);
line (100, 170, 100, 190);
//Calçada
fill (150);
rect(0,190,200,20);
//Árvores
fill (90,65,45);
rect (30,180,1,10);
rect (10,180,1,15);
rect (160,180, 1,15);
rect (185, 180, 1,10);
stroke(113,173,64);
strokeWeight (1);
fill (36,85,10);
ellipse (30,180, 10,10);
ellipse (10,180, 15, 15);
ellipse (160,180, 20,20);
ellipse (185, 180, 15, 15);
noStroke();
// Vaso de planta
fill (67, 147,255);
rect (85, 187,3,3);
rect (113, 187,3,3);
fill (36, 85,10);
ellipse (87, 187,3,3);
ellipse (115, 187,3,3);
// Carro
fill (234, 191,14);
rect (100, 188, 10,4);
fill (0);
ellipse (102,192,2,2);
ellipse (108, 192,2,2);
