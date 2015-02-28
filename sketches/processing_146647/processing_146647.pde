
/* Bom para navegar na internte nada melhor do que uma jangada de @
Com o sol ilumenando nosso caminho.
Consiste em um simples imagem criada alguns dos recursos vistos em sala de aula, que mostra
a simples locaçã, distribuição de espaços na tela e manipulção de cores.*/
size(400,400,P2D);
// fundo dA TELA vulgo mar
background(0, 64, 255);

//ceu
fill(255,255, 255);
rect(0,0,400,200);

// nossas ondas
fill(0, 64, 255);
noStroke();
ellipse(20,205,100,30);
ellipse(109,205,100,30);
ellipse(206,208,90,40);
ellipse(298,205,100,30);
ellipse(398,209,100,30);

fill(247, 247, 13);
ellipse(100,90,100,100);

// a jangada
text("@@@@@@@@@",100,300);
text("@@@@@@@@@",110,310);
text("@@@@@@@@@",120,320);
text("@@@@@@@@@",130,330);
text("@@@@@@@@@",140,340);
text("WWW",50,308);
text("WWW",10,228);
text("WWW",05,249);
text("WWW",350,238);
text("WWW",310,308);
fill(255, 0, 0);
rect(170,140,10,180);
fill(245, 98, 19);
rect(170,140,10,180);
fill(64, 219, 37);
rect(182,140,110,80);
fill(255, 213, 0);
text("WWW",219,180);
text("http",219,190);
