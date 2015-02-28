
/* rect (linha,coluna, largura, altura);
* line (linha1, coluna1, linha2, coluna2);
* strokeWeight(x.0); > Espessura linha
* triangle(linha1, coluna1, linha2, coluna2, linha3, coluna3);
*/

size(1265,400); //size(Largura, Altura);
textSize(20);
text("Rua da Aurora", 1100, 30);
text("Recife-PE", 1160, 50);


/*PRIMEIRO PREDIO*/
rect(3, 130, 86, 50); // Teclado Primeiro prédio
rect(6, 180, 82, 170); // Primeiro Predio
// JANELAS
//Segundo Andar > esquerda
rect(10, 190, 20, 36, 2); 
  line(20,190,20,226); // Detalhe Janela > horizontal
  line(10,202,30,202); // Detalhe Janela > vertical 1
  line(10,215,30,215); // Detalhe Janela > vertical 2
//Segundo Andar > centro
rect(36, 190, 20, 36, 2); 
  line(46,190,46,226); // Detalhe Janela > horizontal
  line(36,202,56,202); // Detalhe Janela > vertical 1
  line(36,215,56,215); // Detalhe Janela > vertical 2
//Segundo Andar > direita
rect(62, 190, 20, 36, 2); 
  line(72,190,72,226); // Detalhe Janela > horizontal
  line(62,202,82,202); // Detalhe Janela > vertical 1
  line(62,215,82,215); // Detalhe Janela > vertical 2
//Primeiro Andar > esquerda
rect(10, 250, 20, 36,2); 
  line(20,250,20,286); // Detalhe Janela > horizontal
  line(10,262,30,262); // Detalhe Janela > vertical 1
  line(10,275,30,275); // Detalhe Janela > vertical 2
//Primeiro Andar > centro
rect(36, 250, 20, 36,2); 
  line(46,250,46,286); // Detalhe Janela > horizontal
  line(36,262,56,262); // Detalhe Janela > vertical 1
  line(36,275,56,275); // Detalhe Janela > vertical 2
//Primeiro Andar > direita
rect(62, 250, 20, 36,2);
  line(72,250,72,286); // Detalhe Janela > horizontal
  line(62,262,82,262); // Detalhe Janela > vertical 1
  line(62,275,82,275); // Detalhe Janela > vertical 2
//Terreo > Porta esquerda
rect(11, 294, 41, 56); 
//Terreo > Porta direita
rect(59, 300, 21, 50,1);
  line(69,300,69,350); // Detalhe Janela > horizontal
  line(59,320,80,320); // Detalhe Janela > vertical 1
  line(59,330,80,330); // Detalhe Janela > vertical 2
//LINHAS ESPESSAS
strokeWeight(3.0);  
strokeCap(ROUND);
line(3,180,88,180); // Linha entre telhado e predio
line(6,225,86,225); //Linha Abaixo das janelas primeiro andar
strokeCap(SQUARE);
strokeWeight(1.0);
line(5,243,87,243);
strokeWeight(3.0);
line(5,289,87,289);
strokeCap(PROJECT);
strokeWeight(1.0);

/*SEGUNDO PREDIO*/
rect(89, 100, 85, 250); // Segundo Predio
rect(100, 95, 62, 5); // Detalhe Acima telhado
triangle(129, 88, 120, 95, 140, 95); // Detalhe Acima telhado
strokeWeight(2.0);  
rect(100, 110, 62, 25,2); // Detalhe Telhado
ellipse(131, 123, 7, 7);
strokeWeight(1.0);
//JANELAS
//Terceiro Andar > esquerda
rect(96, 142, 18, 27,2);
  line(105,142,105,170); // Detalhe Janela > horizontal
  line(96,155,114,155); // Detalhe Janela > vertical 1
//Terceiro Andar > centro
rect(122, 142, 18, 27,2); 
  line(131,142,131,170); // Detalhe Janela > horizontal
  line(122,155,140,155); // Detalhe Janela > vertical 1
//Terceiro Andar > direita
rect(148, 142, 18, 27,2);
  line(157,142,157,170); // Detalhe Janela > horizontal
  line(148,155,166,155); // Detalhe Janela > vertical 1
//Segundo Andar > esquerda
rect(96, 190, 18, 40,1);
  line(105,190,105,230); // Detalhe Janela > horizontal
  line(96,200,114,200); // Detalhe Janela > vertical 1
  line(96,220,114,220); // Detalhe Janela > vertical 2
//Segundo Andar > centro
rect(122, 190, 18, 40,1);
  line(131,190,131,230); // Detalhe Janela > horizontal
  line(122,200,140,200); // Detalhe Janela > vertical 1
  line(122,220,140,220); // Detalhe Janela > vertical 2
//Segundo Andar > direita
rect(148, 190, 18, 40,1); 
  line(157,190,157,230); // Detalhe Janela > horizontal
  line(148,200,166,200); // Detalhe Janela > vertical 1
  line(148,220,166,220); // Detalhe Janela > vertical 2
//Primeiro Andar > esquerda
rect(96, 250, 18, 38,2); 
  line(105,250,105,288); // Detalhe Janela > horizontal
  line(96,260,114,260); // Detalhe Janela > vertical 1
  line(96,280,114,280); // Detalhe Janela > vertical 2
//Primeiro Andar > centro
rect(122, 250, 18, 38,2); 
  line(131,250,131,288); // Detalhe Janela > horizontal
  line(122,260,140,260); // Detalhe Janela > vertical 1
  line(122,280,140,280); // Detalhe Janela > vertical 2
//Primeiro Andar > direita
rect(148, 250, 18, 38,2);
  line(157,250,157,288); // Detalhe Janela > horizontal
  line(148,260,166,260); // Detalhe Janela > vertical 1
  line(148,280,166,280); // Detalhe Janela > vertical 2
//Terreo > esquerda
rect(96, 300, 18, 35,2);
  line(105,300,105,335); // Detalhe Janela > horizontal
  line(96,310,114,310); // Detalhe Janela > vertical 1
  line(96,330,114,330); // Detalhe Janela > vertical 2
//Terreo > centro
rect(122, 300, 18, 35,2); 
 line(131,300,131,335); // Detalhe Janela > horizontal
 line(122,310,140,310); // Detalhe Janela > vertical 1
 line(122,330,140,330); // Detalhe Janela > vertical 2
//Terreo > porta
rect(148, 300, 18, 50,1);
 line(157,300,157,350); // Detalhe Janela > horizontal
 line(148,320,166,320); // Detalhe Janela > vertical 1
 line(148,330,166,330); // Detalhe Janela > vertical 2
//Detalhes janelas
strokeWeight(2.0);
line(95,169,115,169); //Terceiro Andar > esquerda
line(121,169,141,169); //Terceiro Andar > centro
line(147,169,167,169); //Terceiro Andar > direita
strokeWeight(2.0);
line(89,289,174,289); //Primeiro Andar > todas
triangle(105, 294, 101, 289, 110, 289); // Primeiro Andar > esquerda
triangle(131, 294, 126, 289, 136, 289); // Primeiro Andar > centro
triangle(157, 294, 152, 289, 162, 289); // Primeiro Andar > direita

/*TERCEIRO PREDIO*/
strokeWeight(1.0);
quad (175, 130, 175, 165, 327, 165, 317, 130); //Telhado
triangle(248, 110, 233, 140, 263, 140); //Detalhe Teclhado
rect(236,140,24,40); //Detalhe Telhado
rect(242,147,12,12); //Detalhe Telhado
rect(175,165,150,185); // Predio
strokeWeight(2.0);
line(175,165,325,165); // Detalhe Predio
line(175,175,325,175); // Detalhe Predio
//Detalhe Telhado
line(190,165,200,175);line(200,165,210,175);
line(210,165,220,175);line(220,165,230,175);
line(230,165,240,175);line(240,165,250,175);
line(250,165,260,175);line(260,165,270,175);
line(270,165,280,175);line(280,165,290,175);
line(270,165,280,175);line(280,165,290,175);
line(290,165,300,175);line(300,165,310,175);

//JANELAS
strokeWeight(1.0);
//Segundo Andar > primeira
rect(180, 190, 20, 45,1);
 line(190,190,190,235); // Detalhe Janela > horizontal
 line(180,200,200,200); // Detalhe Janela > vertical 1
 line(180,220,200,220); // Detalhe Janela > vertical 2
//Segundo Andar > segunda
rect(210, 190, 20, 45,1); 
 line(220,190,220,235); // Detalhe Janela > horizontal
 line(210,200,230,200); // Detalhe Janela > vertical 1
 line(210,220,230,220); // Detalhe Janela > vertical 2
//Segundo Andar > terceira
rect(240, 190, 20, 45,1);
 line(250,190,250,235); // Detalhe Janela > horizontal
 line(240,200,260,200); // Detalhe Janela > vertical 1
 line(240,220,260,220); // Detalhe Janela > vertical 2
//Segundo Andar > quarta
rect(270, 190, 20, 45,1);
 line(280,190,280,235); // Detalhe Janela > horizontal
 line(270,200,290,200); // Detalhe Janela > vertical 1
 line(270,220,290,220); // Detalhe Janela > vertical 2
//Segundo Andar > quinta
rect(300, 190, 20, 45,1);
 line(310,190,310,235); // Detalhe Janela > horizontal
 line(300,200,320,200); // Detalhe Janela > vertical 1
 line(300,220,320,220); // Detalhe Janela > vertical 2
//Primeiro Andar > primeira
rect(180, 250, 20, 45,1);
 line(190,250,190,295); // Detalhe Janela > horizontal
 line(180,260,200,260); // Detalhe Janela > vertical 1
 line(180,280,200,280); // Detalhe Janela > vertical 2
//Primeiro Andar > segunda
rect(210, 250, 20, 45,1); 
 line(220,250,220,295); // Detalhe Janela > horizontal
 line(210,260,230,260); // Detalhe Janela > vertical 1
 line(210,280,230,280); // Detalhe Janela > vertical 2
//Primeiro Andar > terceira
rect(240, 250, 20, 45,1); 
 line(250,250,250,295); // Detalhe Janela > horizontal
 line(240,260,260,260); // Detalhe Janela > vertical 1
 line(240,280,260,280); // Detalhe Janela > vertical 2
//Primeiro Andar > quarta
rect(270, 250, 20, 45,1);
 line(280,250,280,295); // Detalhe Janela > horizontal
 line(270,260,290,260); // Detalhe Janela > vertical 1
 line(270,280,290,280); // Detalhe Janela > vertical 2
//Primeiro Andar > quinta
rect(300, 250, 20, 45,1);
 line(310,250,310,295); // Detalhe Janela > horizontal
 line(300,260,320,260); // Detalhe Janela > vertical 1
 line(300,280,320,280); // Detalhe Janela > vertical 2
//Terreo > primeira
rect(180, 310, 20, 30,1);
 line(190,310,190,340); // Detalhe Janela > horizontal
 line(180,320,200,320); // Detalhe Janela > vertical 1
 line(180,330,200,330); // Detalhe Janela > vertical 2
//Terreo > segunda
rect(210, 310, 20, 30,1);
 line(220,310,220,340); // Detalhe Janela > horizontal
 line(210,320,230,320); // Detalhe Janela > vertical 1
 line(210,330,230,330); // Detalhe Janela > vertical 2
//Terreo > terceira
rect(240, 310, 20, 40,1); 
 line(250,310,250,350); // Detalhe Janela > horizontal
 line(240,315,260,315); // Detalhe Janela > vertical 1
 line(240,340,260,340); // Detalhe Janela > vertical 2
//Terreo > quarta
rect(270, 310, 20, 30,1);
 line(280,310,280,340); // Detalhe Janela > horizontal
 line(270,320,290,320); // Detalhe Janela > vertical 1
 line(270,330,290,330); // Detalhe Janela > vertical 2
//Terreo > quinta
rect(300, 310, 20, 30,1); 
 line(310,310,310,340); // Detalhe Janela > horizontal
 line(300,320,320,320); // Detalhe Janela > vertical 1
 line(300,330,320,330); // Detalhe Janela > vertical 2
/*QUARTO PREDIO*/

rect(325,175,255,17); //Telhado
rect(325,175,255,175); //Predio
strokeWeight(2.0);
triangle(450, 130, 370, 175, 530, 175); //Detalhe Teclhado
line(326,175,578,175); // Detalhe Predio
line(326,193,578,193); // Detalhe Predio
//JANELAS
strokeWeight(1.0);
 //Primeiro Andar > primeira
rect(335, 205, 16, 70,1);
 line(343,205,343,275); // Detalhe Janela > horizontal
 line(335,220,350,220); // Detalhe Janela > vertical 1
 line(335,260,350,260); // Detalhe Janela > vertical 2
 //Primeiro Andar > segunda
rect(355, 205, 16, 70,1);
 line(363,205,363,275); // Detalhe Janela > horizontal
 line(355,220,370,220); // Detalhe Janela > vertical 1
 line(355,260,370,260); // Detalhe Janela > vertical 2
 //Primeiro Andar > segunda
//Primeiro Andar > terceira
rect(385, 205, 18, 70,1); 
 line(394,205,394,275); // Detalhe Janela > horizontal
 line(385,220,403,220); // Detalhe Janela > vertical 1
 line(385,260,403,260); // Detalhe Janela > vertical 2
//Primeiro Andar > quarta
rect(410, 205, 18, 70,1); 
 line(419,205,419,275); // Detalhe Janela > horizontal
 line(410,220,428,220); // Detalhe Janela > vertical 1
 line(410,260,428,260); // Detalhe Janela > vertical 2
//Primeiro Andar > quinta
rect(440, 205, 28, 70,1); 
 line(454,205,454,275); // Detalhe Janela > horizontal
 line(440,220,468,220); // Detalhe Janela > vertical 1
 line(440,260,468,260); // Detalhe Janela > vertical 2
//Primeiro Andar > sexta
rect(480, 205, 18, 70,1); 
 line(489,205,489,275); // Detalhe Janela > horizontal
 line(480,220,498,220); // Detalhe Janela > vertical 1
 line(480,260,498,260); // Detalhe Janela > vertical 2
//Primeiro Andar > setima
rect(505, 205, 18, 70,1); 
 line(514,205,514,275); // Detalhe Janela > horizontal
 line(505,220,523,220); // Detalhe Janela > vertical 1
 line(505,260,523,260); // Detalhe Janela > vertical 2
//Primeiro Andar > oitava
rect(535, 205, 16, 70,1); 
 line(543,205,543,275); // Detalhe Janela > horizontal
 line(535,220,551,220); // Detalhe Janela > vertical 1
 line(535,260,551,260); // Detalhe Janela > vertical 2
//Primeiro Andar > nona
rect(555, 205, 16, 70,1);
 line(563,205,563,275); // Detalhe Janela > horizontal
 line(555,220,571,220); // Detalhe Janela > vertical 1
 line(555,260,571,260); // Detalhe Janela > vertical 2
//Terreo > primeira
rect(335, 290, 16, 35,1);
 line(343,290,343,325); // Detalhe Janela > horizontal
 line(335,300,351,300); // Detalhe Janela > vertical 1
 line(335,315,351,315); // Detalhe Janela > vertical 2
//Terreo > segunda
rect(355, 290, 16, 35,1); 
 line(363,290,363,325); // Detalhe Janela > horizontal
 line(355,300,371,300); // Detalhe Janela > vertical 1
 line(355,315,371,315); // Detalhe Janela > vertical 2
//Terreo > terceira
rect(385, 290, 18, 35,1);
 line(394,290,394,325); // Detalhe Janela > horizontal
 line(385,300,403,300); // Detalhe Janela > vertical 1
 line(385,315,403,315); // Detalhe Janela > vertical 2
//Terreo > quarta
rect(410, 290, 18, 35,1);
 line(419,290,419,325); // Detalhe Janela > horizontal
 line(410,300,428,300); // Detalhe Janela > vertical 1
 line(410,315,428,315); // Detalhe Janela > vertical 2
//Terreo > quinta
rect(440, 290, 28, 60,1);
 line(454,290,454,350); // Detalhe Janela > horizontal
 line(440,310,468,310); // Detalhe Janela > vertical 1
 line(440,325,468,325); // Detalhe Janela > vertical 2
//Terreo > sexta
rect(480, 290, 18, 35,1);
 line(489,290,489,325); // Detalhe Janela > horizontal
 line(480,300,498,300); // Detalhe Janela > vertical 1
 line(480,315,498,315); // Detalhe Janela > vertical 2
//Terreo > setima
rect(505, 290, 18, 35,1);
 line(514,290,514,325); // Detalhe Janela > horizontal
 line(505,300,523,300); // Detalhe Janela > vertical 1
 line(505,315,523,315); // Detalhe Janela > vertical 2
//Terreo > oitava
rect(535, 290, 16, 35,1);
 line(543,290,543,325); // Detalhe Janela > horizontal
 line(535,300,551,300); // Detalhe Janela > vertical 1
 line(535,315,551,315); // Detalhe Janela > vertical 2
//Terreo > nona
rect(555, 290, 16, 35,1); 
 line(563,290,563,325); // Detalhe Janela > horizontal
 line(555,300,571,300); // Detalhe Janela > vertical 1
 line(555,315,571,315); // Detalhe Janela > vertical 2
/*QUINTO PREDIO*/

quad (625, 140, 580, 175, 830, 175, 785, 140); //Telhado
rect(580,175,248,175); //Predio
strokeWeight(2.0);
line(635,140,620,175); // Detalhe Predio > Esquerdo
line(775,140,790,175); // Detalhe Predio > Direito
line(580,175,828,175); //Detalhe telhado
line(580,193,828,193); //Detalhe telhado
//JANELAS
strokeWeight(1.0);
//Primeiro Andar > primeira
rect(586, 205, 26, 60,1); 
 line(599,205,599,265); // Detalhe Janela > horizontal
 line(586,220,612,220); // Detalhe Janela > vertical 1
 line(586,250,612,250); // Detalhe Janela > vertical 2
//Primeiro Andar > segunda
rect(621, 205, 26, 60,1); 
 line(634,205,634,265); // Detalhe Janela > horizontal
 line(621,220,647,220); // Detalhe Janela > vertical 1
 line(621,250,647,250); // Detalhe Janela > vertical 2
//Primeiro Andar > terceira
rect(656, 205, 26, 60,1); 
 line(669,205,669,265); // Detalhe Janela > horizontal
 line(656,220,682,220); // Detalhe Janela > vertical 1
 line(656,250,682,250); // Detalhe Janela > vertical 2
//Primeiro Andar > quarta
rect(691, 205, 26, 60,1); 
 line(704,205,704,265); // Detalhe Janela > horizontal
 line(691,220,717,220); // Detalhe Janela > vertical 1
 line(691,250,717,250); // Detalhe Janela > vertical 2
//Primeiro Andar > quinta
rect(726, 205, 26, 60,1);
 line(739,205,739,265); // Detalhe Janela > horizontal
 line(726,220,752,220); // Detalhe Janela > vertical 1
 line(726,250,752,250); // Detalhe Janela > vertical 2
//Primeiro Andar > sexta
rect(761, 205, 26, 60,1); 
 line(774,205,774,265); // Detalhe Janela > horizontal
 line(761,220,787,220); // Detalhe Janela > vertical 1
 line(761,250,787,250); // Detalhe Janela > vertical 2
//Primeiro Andar > setima
rect(796, 205, 26, 60,1);
 line(809,205,809,265); // Detalhe Janela > horizontal
 line(796,220,822,220); // Detalhe Janela > vertical 1
 line(796,250,822,250); // Detalhe Janela > vertical 2
//Terreo > primeira
rect(586, 285, 26, 45,1);
 line(599,285,599,330); // Detalhe Janela > horizontal
 line(586,300,612,300); // Detalhe Janela > vertical 1
 line(586,315,612,315); // Detalhe Janela > vertical 2
//Terreo > segunda
rect(621, 285, 26, 45,1); 
 line(634,285,634,330); // Detalhe Janela > horizontal
 line(621,300,647,300); // Detalhe Janela > vertical 1
 line(621,315,647,315); // Detalhe Janela > vertical 2
//Terreo > terceira
rect(656, 285, 26, 45,1);
 line(669,285,669,330); // Detalhe Janela > horizontal
 line(656,300,682,300); // Detalhe Janela > vertical 1
 line(656,315,682,315); // Detalhe Janela > vertical 2
//Terreo > Porta
rect(691, 285, 26, 65,1); 
 line(704,285,704,350); // Detalhe Janela > horizontal
 line(691,300,717,300); // Detalhe Janela > vertical 1
 line(691,320,717,320); // Detalhe Janela > vertical 2
 line(691,340,717,340); // Detalhe Janela > vertical 3
//Terreo > quinta
rect(726, 285, 26, 45,1);
 line(739,285,739,330); // Detalhe Janela > horizontal
 line(726,300,752,300); // Detalhe Janela > vertical 1
 line(726,315,752,315); // Detalhe Janela > vertical 2
//Terreo > sexta
rect(761, 285, 26, 45,1); 
 line(774,285,774,330); // Detalhe Janela > horizontal
 line(761,300,787,300); // Detalhe Janela > vertical 1
 line(761,315,787,315); // Detalhe Janela > vertical 2
//Terreo > setima
rect(796, 285, 26, 45,1); 
 line(809,285,809,330); // Detalhe Janela > horizontal
 line(796,300,822,300); // Detalhe Janela > vertical 1
 line(796,315,822,315); // Detalhe Janela > vertical 2
/*SEXTO PREDIO*/

rect(828,160,240,20); // Telhado
strokeWeight(7.0);
line(836,170,1060,170); // Detalhe Telhado
strokeWeight(1.0);
rect(828,180,240,170); // Prédio
strokeWeight(2.0);
line(829,190,1067,190); //Detalhe Prédio
//JANELAS
strokeWeight(1.0);
//Primeiro Andar > primeira
rect(842, 205, 30, 50,1); 
 line(857,205,857,255); // Detalhe Janela > horizontal
 line(842,220,872,220); // Detalhe Janela > vertical 1
 line(842,240,872,240); // Detalhe Janela > vertical 2
//Primeiro Andar > segunda
rect(880, 205, 30, 50,1); 
 line(895,205,895,255); // Detalhe Janela > horizontal
 line(880,220,910,220); // Detalhe Janela > vertical 1
 line(880,240,910,240); // Detalhe Janela > vertical 2
//Primeiro Andar > terceira
rect(916, 205, 30, 50,1); 
 line(931,205,931,255); // Detalhe Janela > horizontal
 line(916,220,946,220); // Detalhe Janela > vertical 1
 line(916,240,946,240); // Detalhe Janela > vertical 2
//Primeiro Andar > quarta
rect(952, 205, 30, 50,1); 
 line(967,205,967,255); // Detalhe Janela > horizontal
 line(952,220,982,220); // Detalhe Janela > vertical 1
 line(952,240,982,240); // Detalhe Janela > vertical 2
//Primeiro Andar > quinta
rect(988, 205, 30, 50,1);
 line(1003,205,1003,255); // Detalhe Janela > horizontal
 line(988,220,1018,220); // Detalhe Janela > vertical 1
 line(988,240,1018,240); // Detalhe Janela > vertical 2
//Primeiro Andar > sexta
rect(1024, 205, 30, 50,1);
 line(1039,205,1039,255); // Detalhe Janela > horizontal
 line(1024,220,1054,220); // Detalhe Janela > vertical 1
 line(1024,240,1054,240); // Detalhe Janela > vertical 2
//Terreo > primeira
rect(842, 275, 30, 50,1);
 line(857,275,857,325); // Detalhe Janela > horizontal
 line(842,290,872,290); // Detalhe Janela > vertical 1
 line(842,310,872,310); // Detalhe Janela > vertical 2
//Terreo > segunda
rect(880, 275, 30, 50,1); 
 line(895,275,895,325); // Detalhe Janela > horizontal
 line(880,290,910,290); // Detalhe Janela > vertical 1
 line(880,310,910,310); // Detalhe Janela > vertical 2
//Terreo > terceira
rect(916, 275, 30, 50,1); 
 line(931,275,931,325); // Detalhe Janela > horizontal
 line(916,290,946,290); // Detalhe Janela > vertical 1
 line(916,310,946,310); // Detalhe Janela > vertical 2
//Terreo > Porta
rect(952, 275, 30, 75,1);
 line(967,275,967,350); // Detalhe Janela > horizontal
 line(952,280,982,280); // Detalhe Janela > vertical 1
 line(952,300,982,300); // Detalhe Janela > vertical 2
 line(952,310,982,310); // Detalhe Janela > vertical 3
//Terreo > quinta
rect(988, 275, 30, 50,1); 
 line(1003,275,1003,325); // Detalhe Janela > horizontal
 line(988,290,1018,290); // Detalhe Janela > vertical 1
 line(988,310,1018,310); // Detalhe Janela > vertical 2

/*SÉTIMO PRÉDIO*/

rect(1068,155,190,30); // Telhado
strokeWeight(6.0);
line(1080,169,1245,169); // Detalhe Telhado
strokeWeight(1.0);
rect(1068,185,190,165); // Prédio
strokeWeight(2.0);
line(1068,196,1256,196); //Detalhe Prédio
line(1068,200,1256,200); //Detalhe Prédio 
//JANELAS
strokeWeight(1.0);
//Primeiro Andar > primeira
rect(1075, 215, 30, 50,1); 
 line(1090,215,1090,265); // Detalhe Janela > horizontal
 line(1075,230,1105,230); // Detalhe Janela > vertical 1
 line(1075,250,1105,250); // Detalhe Janela > vertical 2
//Primeiro Andar > segunda
rect(1120, 215, 30, 50,1); 
 line(1135,215,1135,265); // Detalhe Janela > horizontal
 line(1120,230,1150,230); // Detalhe Janela > vertical 1
 line(1120,250,1150,250); // Detalhe Janela > vertical 2
//Primeiro Andar > terceira
rect(1175, 215, 30, 50,1); 
 line(1190,215,1190,265); // Detalhe Janela > horizontal
 line(1175,230,1205,230); // Detalhe Janela > vertical 1
 line(1175,250,1205,250); // Detalhe Janela > vertical 2
//Primeiro Andar > quarta
rect(1220, 215, 30, 50,1);
 line(1235,215,1235,265); // Detalhe Janela > horizontal
 line(1220,230,1250,230); // Detalhe Janela > vertical 1
 line(1220,250,1250,250); // Detalhe Janela > vertical 2
//Terreo > primeira
rect(1075, 280, 30, 50,1);
 line(1090,280,1090,330); // Detalhe Janela > horizontal
 line(1075,295,1105,295); // Detalhe Janela > vertical 1
 line(1075,315,1105,315); // Detalhe Janela > vertical 2
//Terreo > segunda
rect(1120, 280, 30, 50,1); 
 line(1135,280,1135,330); // Detalhe Janela > horizontal
 line(1120,295,1150,295); // Detalhe Janela > vertical 1
 line(1120,315,1150,315); // Detalhe Janela > vertical 2
//Terreo > terceira
rect(1175, 280, 30, 50,1); 
 line(1190,280,1190,330); // Detalhe Janela > horizontal
 line(1175,295,1205,295); // Detalhe Janela > vertical 1
 line(1175,315,1205,315); // Detalhe Janela > vertical 2
//Terreo > Porta
rect(1220, 280, 30, 70,1); 
 line(1235,280,1235,350); // Detalhe Janela > horizontal
 line(1220,295,1250,295); // Detalhe Janela > vertical 1
 line(1220,315,1250,315); // Detalhe Janela > vertical 2
 line(1220,335,1250,335); // Detalhe Janela > vertical 2
