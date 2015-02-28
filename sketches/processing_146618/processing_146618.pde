
/*
  Autor: saulo mendonca teles
  Data: 28.04.2013
  Descricao/Explicao:
     *Fiz o desenho a partir dos trechos que falavam da jangada, do mar de informacoes e do website.
       -Representei o mar de informacoes com numeros binarios pois todo tipo de informacao dentro de um
      computador existe devido ao sistema de numeros binarios.
       -O website citado na musica foi representapo por toda a imagem, para isso criei uma barra de navegador
      no topo da imagem.
       -A jangada seria o meio de transporte no qual o compositor iria viajar ate os destinos citados na
      musica.
*/

size(1000, 600);
background(0, 255, 255);

//barra navegador (nao precisava desse tanto de lines, se nao me engano no rect msm da pra fazer as bordas...)
rectMode(CENTER);
noStroke();
rect(width/2, 10, 1002, 20);
stroke(200);
line(0, 0, 1000, 0); //borda
line(0, 0, 0, 20); // ||
line(0, 20, 1000, 20); // ||
line(999, 0, 999, 20); // ||
line(20, 0, 30, 10); //  extremidade esquerda barra navegador
line(20, 20, 30, 10); // ||
rectMode(CENTER); // "cadeado" inicio
fill(150);
rect(40, 13, 12, 9);
noFill();
stroke(150);
strokeWeight(2);
ellipse(40, 10, 8, 12); // "cadeado" fim
textSize(13);
text("https://", 52, 16);
fill(0, 0, 0);
text("website.com.br", 94, 16); //texto na cor preta
fill(150);
text("/music/mpb-lounge-chillout/gilberto-gil/album_quanta_1997/Pela_Internet.mp3", 183, 16);



//mar
rectMode(CORNER);
fill(0, 0, 128);
noStroke();
rect(0, 400, 1000, 600);

//numeros binarios no "mar"
textSize(20);
fill(0, 0, 0);
text("101010101010111000101010101010101010000101010101010101010000101010101010101010111011110", 1, 480); 
text("101010101010111000101010101010101010000101010101010101010000101010101010101010111011110", 1, 510);
text("101010101010111000101010101010101010000101010101010101010000101010101010101010111011110", 1, 540);
text("101010101010111000101010101010101010000101010101010101010000101010101010101010111011110", 1, 570);
text("101010101010111000101010101010101010000101010101010101010000101010101010101010111011110", 1, 600);

// centro jangada
rectMode(CENTER);
fill(0);
noStroke();
rect(500, 440, 500, 100); 

//extremidades
triangle(125, 350, 250, 490, 250, 390); //extremidade jangada esquerda
triangle(875, 350, 750, 490, 750, 390); //extremidade jangada direita

//tamanho jangada hahahaha
fill(0, 255, 0);
textSize(20);
text("2727272727272727272727272727272727272727 GB", 260, 480); 

//velas jangada
stroke(0);
strokeWeight(10);
line(700, 400, 700, 80);
triangle(700, 80, 200, 330, 700, 300);

//gil (cantor)
stroke(0);
strokeWeight(10);
line(500, 400, 500, 280); //corpo
line(500, 320, 470, 360); //braco
line(500, 320, 530, 360); // braco
noStroke();
fill(0);
ellipse(500, 290, 40, 40); // cabeca

//nuvens
ellipseMode(CENTER);
fill(255);
ellipse(60, 90, 100, 20); // nuvem 1
ellipse(110, 90, 100, 20);
ellipse(160, 90, 100, 20);
ellipse(400, 90, 100, 20); // nuvem 2
ellipse(450, 90, 100, 20);
ellipse(50, 90, 100, 20);
ellipse(60, 150, 100, 20); // nuvem 3
ellipse(70, 150, 100, 20);
ellipse(80, 150, 100, 20);
ellipse(200, 220, 50, 20); // nuvem 4
ellipse(230, 220, 50, 20);
ellipse(260, 220, 50, 20);
ellipse(800, 220, 50, 20); // nuvem 5
ellipse(830, 220, 50, 20);
ellipse(860, 220, 50, 20);
