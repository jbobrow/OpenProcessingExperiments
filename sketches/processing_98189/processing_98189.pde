
// Cindy Feijó, 2S2012 - AU UTFPR
// Proposta: Planta ou fachada com texturas / 

Entrega:07/05/2013
// Praça

size (400,400);
PImage img= loadImage("gramaFUNDO.jpg");
image (img, 0, 0, width, height);

noStroke();
smooth ();
fill (35,35,142); //cor do lago (Azul-Marinho)
ellipse (200,100, 148,148); //parte superior do 

lago
ellipse (200,300,150,150); //parte inferior do 

lago
ellipse (200,200,100,100); // meio do lago

fill (#107927); //cor do acabamento da grama, 

sobre o lago
ellipse (155,200,70,70); //acabamento da direita
ellipse (245, 200, 70,70); //acabamento da 

esquerda

// Ligação entre os espaços com a ponte
fill (151,105,79); //Tan Escuro
rect (120,180,40,40); //direita
rect (240,180,40,40); //esquerda

fill (235,199,158); // espaço de convivência, 

cor Bronze Claro
ellipse (70,200,120,120); // espaço de 

convivência da direita
ellipse (330,200,120,120); //espaço de 

convivência da esquerda

//Vegetação do lado direito, da área de 

convivência
stroke (0);
fill (35,142,35); // árvore Verde Floresta
ellipse (20,230,20,20);
fill (0,255,127); //árvore Verde Primavera 

(opaco)
ellipse (30, 245, 20,20);
fill (107,142,35); //árvore Verde Floresta Médio
ellipse (45, 250, 20,20);
fill (50,205,50); // árvore Verde Limão
ellipse (60, 252,20,20);
fill (33,94,33); //árvore Verde Hunter
ellipse (75,250,20,20);
fill (153,204,50); // árvore Amarelo Esverdeado
ellipse (35, 230,20,20);
fill (47,79,47); // árvore Verde Escuro
ellipse (50, 235, 20,20);
fill (0,255,127); // árvore Verde Primavera 

(opaco)
ellipse (65,235, 20, 20);
fill (107,142,35); // árvore Verde Floresta 

Médio
ellipse (15,215,20,20);

fill (234,173,234); // ipê Plum
ellipse (90,150,20,20);
fill (135,31,120); //ipê Púrpura Escuro
ellipse (95, 165, 20,20);
fill (217,217,25); // ipê Bright Ouro
ellipse (105, 155, 20,20);

//bancos do lado direito
fill (142,107,35); // cor sienna
rect (45,210,20,8); // baixo
rect (30, 185, 8, 20); //lado
rect (45, 170, 20, 8); // cima

//caminho para convivência
fill (235,199,158); //Bronze Claro
noStroke();
rect (10,20, 20,185); // para cima
ellipse (20,20,20,20); //arredondamento da curva 

1
rect (20,10,350,15); // para direita
ellipse (370,20,20,20); // arredondamento da 

curva 2
rect (360,20,20,185); // para baixo

//vegetação da esquerda
stroke (0);
fill (35,142,35); // árvore Verde Floresta
ellipse (365,230,20,20);
fill (0,255,127); //árvore Verde Primavera 

(opaco)
ellipse (350, 245, 20,20);
fill (107,142,35); //árvore Verde Floresta Médio
ellipse (340, 250, 20,20);
fill (50,205,50); // árvore Verde Limão
ellipse (325, 252,20,20);
fill (33,94,33); //árvore Verde Hunter
ellipse (310,250,20,20);
fill (153,204,50); // árvore Amarelo Esverdeado
ellipse (347, 230,20,20);
fill (47,79,47); // árvore Verde Escuro
ellipse (335, 235, 20,20);
fill (0,255,127); // árvore Verde Primavera 

(opaco)
ellipse (320,235, 20, 20);
fill (153,204,50); // árvore Amarelo Esverdeado
ellipse (370,215,20,20);
fill (33,94,33); //árvore Verde Hunter
ellipse (365,240, 20, 20);

fill (234,173,234); // ipê Plum
ellipse (310,150,20,20);
fill (135,31,120); //ipê Púrpura Escuro
ellipse (305, 165, 20,20);
fill (217,217,25); // ipê Bright Ouro
ellipse (295, 155, 20,20);

//bancos do lado esquerdo
fill (142,107,35); // cor sienna
rect (325,205,20,8); //baixo
rect (350, 180, 8, 20); //lado
rect (325, 170, 20, 8); //cima

//vegetação aleatória
stroke (0);
fill (35,142,35); // árvore Verde Floresta
ellipse (20,300,20,20);
fill (0,255,127); //árvore Verde Primavera 

(opaco)
ellipse (30, 325, 20,20);
fill (107,142,35); //árvore Verde Floresta Médio
ellipse (25, 340, 20,20);
fill (50,205,50); // árvore Verde Limão
ellipse (55,320,20,20);
fill (33,94,33); //árvore Verde Hunter
ellipse (70,350,20,20);
fill (35,142,35); // árvore Verde Floresta
ellipse (328, 320,20,20);
fill (47,79,47); // árvore Verde Escuro
ellipse (325, 350, 20,20);
fill (0,255,127); // árvore Verde Primavera 

(opaco)
ellipse (320,305, 20, 20);
fill (153,204,50); // árvore Amarelo Esverdeado
ellipse (360,310,20,20);
fill (35,142,35); // árvore Verde Floresta
ellipse (360,340, 20, 20);

// Ponte
smooth();
fill (92,64,51); // ponte cor Marrom Escuro
rect (160,180,80,40); //ponte
// condições da textura em linhas, imitando 

tábuas de madeira
int ystart=180;
int yend =220;
for (int x=160; x<240; x=x+4 ){ 
line (x,ystart, x, yend);
//guarda-corpo da ponte
int x1=160;
int x2=240;
strokeWeight (2);
line (x1, ystart,x2,ystart);
line (x1, yend, x2, yend);
}

//Pato
smooth ();
noStroke();
fill (168,168,168); //cor do corpo do pato 

(cinza)
ellipse (200,350,10,8); //corpo do pato
ellipse (195,349,3,3); //rabo do pato
fill (255); //cor da cabeça do pato
ellipse (202,350,4,4); //cabeça do pato
fill (255,165,0); //cor do bico do pato 

(laranja)
ellipse (204,350,3,2); //bico do pato


PFont fonte;
     fonte = createFont("Century751BT-ItalicB", 14);
  textFont(fonte);
  noLoop();
  textAlign(RIGHT);
  fill (255);
  strokeWeight (3); 
  text("Cindy Feijó 2013", width-10, height-10);


// tabela de cores usada: 

http://shibolete.tripod.com/RGB.html
