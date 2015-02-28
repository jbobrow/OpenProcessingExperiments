
//Transito de Curitiba! Por Ana Paula Galdino e Yuri Aguiar.
size (550,500);//tamanho desenho
fill (175);
ellipse (100, 200, 200, 200);//tubo
fill(255,0,0);//cor biarticulado vermelho
rect(210, 100, 250, 250, 7);//biarticulado
fill(0);//cor pneu preto
rect(220, 350, 30, 30, 7);//pneu direito
rect(420, 350, 30, 30, 7);//pneu esquerdo
fill(175);//cor itnerário cinza
rect(220, 110, 230, 30);//itnerário
fill(145);//cor janela cinza
rect(220, 140, 230, 125);//jnela onibus
line(335, 140, 335, 265);//linha meio janela
fill(255);//cor farol - branco
triangle(220, 265, 220, 295, 260, 295);//farol direito
triangle(450, 295, 450, 265, 410, 295);//farol esquerdo
fill(255,0,0);//cor retrovisores vermelho
rect(195, 135, 20, 30, 7);//retrovisor direito
rect(455, 135, 20, 30, 7);//retrovisor esquerdo
strokeWeight(8); // escada
line(50, 300, 150, 300);
strokeWeight(8); // escada
line(40, 320, 160, 320);
strokeWeight(6); // catraca meio
line(100, 300, 100, 220);
strokeWeight(6); // catraca esquerda
line(160, 220, 100, 220);
strokeWeight(6); // catraca direita
line(160, 220, 40, 220);
rect(309, 300, 70, 30);//placa

fill(255);//fonte placa branca
textSize(15);//tam fonte itnerário
text("ABC 123", 315, 320); //centralizaço do texto


fill(255,255,0);//cor itnerário - amarelo
textSize(30);//tam fonte itnerário
text("Curitiba", 275, 135); //centralizaço do texto
