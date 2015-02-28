
size (200,200);
stroke (252,245,173);
fill (250,240,150);//preenchimento da parte de cima do sobrado (lado direito
rect (25,65,55,40);// parte de cima do sobrado (lado direito)
fill (240,235,180);//preenchimento do efeito
stroke (240,235,180);// cor do efeito
rect (34,105,35,5);//efeito de sombra e profundidade
smooth (0);
triangle (25,105,34,105,34,110);// efeito de sombra e profundidade
triangle (70,105,80,105,70,110);//efeito de sombra e profundidade
fill (250,245,195);// cor de prenchimento do teto da parte de baixo do sobrado (lado direito)
stroke (250,245,200);//cor do teto da parte de baixo do sobrado (lado direito)
rect (25,110,55,50);//teto da parte de baixo do sobrado (lado direito)
triangle (25,105,25,110,34,110);//teto da parte de baixo do sobrado (lado direito)
triangle (70,110,80,105,80,110);//teto da parte de baixo do sobrado (lado direito)
stroke (157,121,19);// cor da parte mais alta da casa
fill (157,121,19);//cor de preenchimento da parte mais alta da casa
triangle (106,35,80,50,106,50);//parte mais alta da casa
rect (80,50,27,110);// "coluna", parte mais alta da casa 
fill (211,200,92);//cor de preenchimento parte de cima do sobrado (lado direito)
stroke (211,200,92);//cor parte de cima do sobrado (lado direito)
rect (107,40,75,65);// parte de cima do sobrado (lado direito)
stroke(234,224,128);// cor do teto da garagem
fill (234,224,128);//cor de preenchimento do teto da garagem
rect (107,105,55,10);// teto da garagem
triangle (160,105,172,105,160,115); //teto da garagem
fill (245,236,156);// cor da parede de fundo com a garagem
rect (107,115,55,40);// parede de fundo com a garagem
rect (172,105,10,50);//coluna da garagem (lado mais claro)
fill (211,200,92);//cor da parte mais escura da coluna
stroke (211,200,92);//cor da parte mais escura da coluna
rect (176,105,6,50);// parte mais escura da coluna
stroke(186,174,85);//cor das esquadrias
fill (240);//cor de preenchimento das janelas
rect (125,60,57,20);// janelas sobrado lado direito
stroke(186,174,85);//cor da esquadria
line (140,60,140,80);//esquadrias das janelas do sobrado da direita
int  x= 15;
line (140+x,60,140+x,80);//esquadrias (divisões) da janela
int y=30;
line (140+y,60,140+y,80);//esquadrias (divisões) da janela
strokeWeight (1.5);//largura da esquadria da janela ao fundo da garagem
rect (110,130,15,8);// janela pequena na parede de fundo com a garagem
fill (85,62,13);//cor da porta
stroke (72,53,9);//cor do batente
strokeWeight (1.5);//tamanho do batente
rect (35,120,35,40);//porta
stroke (100,74,13);//cor da divisão da porta
line (52.5,120,52.5,160);//divisão da porta
strokeWeight (4);//tamanho da maçaneta
point (50,140);// maçaneta da porta lado esquerdo
point (54.5,140);//maçaneta da porta lado direito
strokeWeight (1);
stroke (186,174,85);//cor das esquadrias
fill (240);//cor de preenchimento das janelas
rect (35,80,15,15);// janelinhas no sobrado do lado direito
int z=20;
rect (35+z,80,15,15);//janelinhas no sobrado do lado direito
stroke (6,57,4);//cor da grama
fill(6,57,4);//cor da grama
rect (0,140,24,60);//grama
rect (24,160,83,40);//grama
rect (83,160,116,47);//grama
rect (107,156,78,5);//grama
rect (183,140,20,60);//grama
rect (163,140,8,15);//grama
stroke (9,3,80);//cor do céu
fill(9,3,80);////cor do céu
rect(0,0,24,140);//céu
rect (24,0,55,64);//céu
rect (55,0,52,34);//céu
triangle(79,50,79,35,107,35);//céu
rect (107,0,95,40);//céu
rect (183,40,19,100);//céu
rect (163,115,8,27);//céu
triangle (163,115,171,115,171,110);//céu
stroke (255);//cor da luz (porta)
strokeWeight (4);//tamanho do ponto que representa a luz
point (52,107);// luz em cima da porta
stroke (240);//cor da luz (garagem)
point (120,110);//luz na garagem
point(145,110);//luz na garagem
