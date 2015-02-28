
PFont texto;// variavel de texto

texto = loadFont ("LatinWide-48.vlw");// load da font relativa a variavel de texto


size ( 500, 700);// tamanho da janela

background (255);//cor de fundo

smooth();//suavizar as formas


// lado esquerdo
fill (0);// cor preto
strokeWeight ( 50);// espessura do contorno / outline
line (0, 450, 250, 550);// desenho de uma lonha (pt1, pt2, pt3, pt4)

strokeWeight ( 50);// espessura do contorno / outlin
line (0, 550, 250, 650);// desenho de uma lonha (pt1, pt2, pt3, pt4)

strokeWeight ( 50);// espessura do contorno / outlin
line (0, 650, 250, 750);// desenho de uma lonha (pt1, pt2, pt3, pt4)

strokeWeight ( 25);// espessura do contorno / outlin
line (0, 350, 250, 450);// desenho de uma lonha (pt1, pt2, pt3, pt4)



// lado direito
strokeWeight ( 50);// espessura do contorno / outlin
line (500, 450, 250, 550);// desenho de uma lonha (pt1, pt2, pt3, pt4)

strokeWeight ( 50);// espessura do contorno / outlin
line (500, 550, 250, 650);// desenho de uma lonha (pt1, pt2, pt3, pt4)

strokeWeight ( 50);// espessura do contorno / outlin
line (500, 650, 250, 750);// desenho de uma lonha (pt1, pt2, pt3, pt4)

strokeWeight ( 25);// espessura do contorno / outlin
line (500, 350, 250, 450);// desenho de uma lonha (pt1, pt2, pt3, pt4)


//desenho de ellipses
ellipseMode (CENTER);// definição do modo de posicionamento da elipse para centro

strokeWeight (20);// espessura do contorno / outlin
stroke (255);// cor do contorno / outline branco
ellipse (250, 350, 300, 300); // desenho de elipse

strokeWeight (20);// espessura do contorno / outlin
stroke (255);// cor do contorno / outline branco
ellipse (75, 350, 200, 200); // desenho de elipse

strokeWeight (20);// espessura do contorno / outlin
stroke (255);// cor do contorno / outline branco
ellipse (425, 350, 200, 200); // desenho de elipse

//part superior

noStroke();// sem contorno / outline
rect (0, 0, 50, 50);// desenho de quadrado

rect (75, 0, 50, 50);// desenho de quadrado

rect (150, 0, 50, 50);// desenho de quadrado

rect (225, 0, 50, 50);// desenho de quadrado

rect (300, 0, 50, 50);// desenho de quadrado

rect (375, 0, 50, 50);// desenho de quadrado

rect (450, 0, 50, 50);// desenho de quadrado

//aplicação do texto

//stroke (255);
rect (0, 550, 500, 150);// desenho de rectangulo

rect (0, 70, 500, 5);// desenho de rectangulo

rect (0, 170, 500, 5);// desenho de rectangulo

textFont (texto, 38);// definição de um tamanho para a fonte da variavel de texto

text ("Pedra do Couto", 10, 130);

textFont (texto, 9);// definição de um tamanho para a fonte da variavel de texto

text ("TEK HARDTEK HARDFLOOR | DJS LIVE PERFORMANCE", 10,140);// desenho de texto estático

textFont (texto, 13);// definição de um tamanho para a fonte da variavel de texto

fill (255);
text ("Próximo dia 30 de Fevereiro", 170, 570);// desenho de texto estático

text ("Entrada Livre", 330, 590);// desenho de texto estático

text ("-Com a participação de:", 20, 640);// desenho de texto estático

textFont (texto, 8);// definição de um tamanho para a fonte da variavel de texto

text ("   -dj ZEQUINHAz", 20, 650);// desenho de texto estático

text ("   -e ratos do porao", 20, 660);// desenho de texto estático

textFont (texto, 5);// definição de um tamanho para a fonte da variavel de texto

text ("Carlos Maia", 450, 690);// desenho de texto estático

fill (255);// cor de preenchimento branca
rect (0, 590, 300, 5);// desenho de rectangulo

rect (300, 640, 200, 5);// desenho de rectangulo

