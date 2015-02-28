
size (400, 300); // tamanho do arquivo em pixels
noStroke (); // para o fantasma não adquirir contorno
ellipse (120, 150, 130, 60); // braço esquerdo
rect(150, 155, 100, 130, 12, 12, 12, 12); // corpo do fantasma com bordas arredondadas em baixo
ellipse (280, 150, 130, 60); // braço direito
ellipse (200, 100, 80, 150); // cabeça
stroke(0); // para contorno dos olhos
ellipse (185, 80, 15, 15); // olho esquerdo
ellipse (215, 80, 15, 15); // olho direito
fill (0); // para preenchimento de cor
ellipse (187, 80, 5, 5); // pupila esquerda
ellipse (212, 80, 5, 5); // pupila direita
noFill ( ); // para não preencher de cor
arc(195, 65, 15, 20, HALF_PI, PI); // sobrancelha esquerda
arc(205, 65, 15, 20, 0, HALF_PI); // sobrancelha direita
// line(160, 80, 195, 65);




