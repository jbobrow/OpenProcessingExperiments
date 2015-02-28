
//Arquitetura e Urbanismo - UTFPR
//Geórgia Collete Rodrigues dos Santos Cadamuro
//Computação 1
//1 período

//fundo
size(500, 620);
background(15, 56, 108);

//nuven
fill(54,84,162);
noStroke();
ellipse(30,15,100,30); 
ellipse(80,15,100,50); 
ellipse(110,15,100,30);

//chão
strokeWeight(1);
stroke(15, 108, 16);
fill(116, 139, 104);
rect(0, 570, 500, 250);

//base prédio
stroke(204);
fill(204);
rect(190, 470, 230, 100);

//lua
stroke(168, 202, 245);
fill(191,213,242);
ellipse(430, 60, 100, 100);

//torres
stroke(204);
fill(204);
quad(100, 50, 420, 50, 420, 480, 190, 480);//torre ex
fill(248, 250, 156);
stroke(0);
strokeWeight(2);
quad(110, 60, 410, 60, 410, 470, 195, 470);//torre in

//observatorio
noStroke();
fill(15, 56, 108);
rect(70, 45, 57, 130);
fill(204);
rect(126, 50, 10, 130);

//porta
strokeWeight (2);
fill(180, 9, 25);
rect(250, 472, 110, 100);//porta
stroke(0);
line(313, 560, 313, 520);
line(293, 560, 293, 520);

//linhas
stroke(0);
strokeWeight(2);
line(135, 140, 410, 140);//linha h 3
line(135, 184, 410, 184);//linha h 4
line(145, 230, 410, 230);//linha h 5
line(153, 270, 410, 270);//linha h 6
line(162, 310, 410, 310);//linha h 7
line(170, 350, 410, 350);//linha h 8
line(178, 390, 410, 390);//linha h 9
line(186, 430, 410, 430);//linha h 10

stroke(0);
strokeWeight(2);
line(135, 60, 135, 180);//linha v 1
line(195, 60, 195, 467);//linha v 2
line(250, 60, 250, 467);//linha v 3
line(300, 60, 300, 467);//linha v 4
line(350, 60, 350, 467);//linha v 5

//faixa vermelha horizontal
fill(185, 9, 24);
stroke(0);
strokeWeight(2);
rect(120, 50, 305, 50);
fill(157, 48, 59);

//arvore 2
stroke(59, 21, 19);
strokeWeight(15);
line(30, 560, 30, 400);//tronco 2
noStroke();
fill(24,139,36);
ellipse(30, 425, 100, 120);//copa 2
stroke(59, 21, 19);
//arvore 1
stroke(59, 21, 19);
strokeWeight(15);
line(70, 550, 70, 400);//tronco 1
noStroke();
fill(11,100,21);
ellipse(70, 420, 100, 110);//copa 1
//arvore 3
strokeWeight(15);
stroke (59,21,19);
line(470, 550, 470, 450);//tronco 3
noStroke();
fill(46,108,52);
ellipse(470, 430, 100, 120);//copa 3

fill(46,108,52);
arc(80, 571, 90, 90, PI, TWO_PI);//arbusto
fill(18, 80, 24);
arc(100, 571, 90, 80, PI, TWO_PI);//arbusto
fill(46,108,52);
arc(495, 570, 90, 90, PI, TWO_PI);//arbusto
fill(18, 80, 24);
arc(470, 571, 90, 80, PI, TWO_PI);//arbusto
fill(18, 80, 24);
arc(45, 571, 90, 70, PI, TWO_PI);//arbusto
fill(12, 75, 19);
arc(130, 570, 90, 80, PI, TWO_PI);//arbusto

//boneco
fill (0);
ellipse (213, 533, 14, 14); //cabeça
fill (240, 15, 15);
//corpo
fill(0);
ellipse (213, 550, 7, 23);
//braço esquerdo
pushMatrix ();
rotate (-PI*25/360);
ellipse (93, 585, 2, 14);
popMatrix ();
//braço direito
pushMatrix ();
translate (40, 0);
rotate (PI*25/360);
ellipse (283, 500, 2, 14);
popMatrix ();
// perna direita
pushMatrix ();
translate (0, 50);
rotate (-PI*25/360);
ellipse (100, 550, 3, 18);
popMatrix ();
//perna esquerda
pushMatrix ();
translate (0, 50);
rotate (PI*25/360);
ellipse (315, 458, 3, 18);
