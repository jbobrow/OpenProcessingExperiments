
/* @pjs preload="ceu.jpg"; */

size(500,500);//tamanho da janela

//paisagem
PImage img;
img=loadImage("ceu.jpg");
background(img);//cor do céu e mar

//ilha e passarela
strokeWeight(3);//espessura da borda da ilha
stroke(220);//cor da borda da ilha
fill(90,140,79);//cor da ilha
triangle(125,370,250,470,370,370);//formato da ilha
noStroke();
quad(235,455,233,501,267,501,265,455);//para formar a passarela à ilha
stroke(220);//cor das bordas da passarela
line(234,457,233,501);//borda esquerda da passarela
line(266,457,267,501);//borda direita da passarela
strokeWeight(11);//espessura da linha de centro da passarela
stroke(100);//cor da linha de centro da passarela
line(250,430,250,501);//linha de centro da passarela
noStroke();
fill(100);//preencher detalhes da estrada
ellipse(250,430,30,21);//via circular
stroke(200,200,0);//cor da faixa da via
strokeWeight(1);//espessura da faixa da via
ellipse(250,430,20,13);//faixa circular da via
line(250,437,250,501);//faixa da via vertical
noStroke();
fill(90,140,79);//cor do detalhe central da via
ellipse(250,430,10,5);//detalhe central da via

//burj al arab
fill(75,150,170);//cor do corpo do prédio
quad(196,413,196,130,256,130,305,413);//corpo do prédio
stroke(225);//cor da borda esquerda do prédio
strokeWeight(7);//espessura das bordas laterais do prédio
noFill();
bezier(203,70,290,130,284,310,300,412);//borda direita do prédio
line(203,70,202,411);//borda esquerda do prédio
line(204,72,209,411);//auxiliar borda esquerda do prédio
strokeWeight(3);//espessura da antena
line(202,30,202,70);//linha da antena
strokeWeight(2);//espessura da borda do topo do prédio e dos andares
line(195,130,250,130);//borda do topo do prédio
int x=195;
int y=130;
line(x,y+15,257,y+15);//linha dos andares
line(x,y+30,260,y+30);//linha dos andares
line(x,y+45,263,y+45);//linha dos andares
line(x,y+60,266,y+60);//linha dos andares
line(x,y+75,270,y+75);//linha dos andares
line(x,y+90,272,y+90);//linha dos andares
line(x,y+105,275,y+105);//linha dos andares
line(x,y+120,278,y+120);//linha dos andares
line(x,y+135,280,y+135);//linha dos andares
line(x,y+150,282,y+150);//linha dos andares
line(x,y+165,283,y+165);//linha dos andares
line(x,y+180,284,y+180);//linha dos andares
line(x,y+195,286,y+195);//linha dos andares
line(x,y+210,289,y+210);//linha dos andares
line(x,y+225,290,y+225);//linha dos andares
line(x,y+240,293,y+240);//linha dos andares
line(x,y+255,295,y+255);//linha dos andares
line(x,y+270,296,y+270);//linha dos andares
strokeWeight(3);//espessura da linha do térreo
line(x+1,414,303,414);//linha do térreo
strokeWeight(7);//espessura dos detalhes da fachada
line(x+8,y+30,260,y+30);//1 detalhe horizontal 
line(260,y+30,x+8,y+120);//1 detalhe diagonal
line(x+8,y+120,278,y+120);//2 detalhe horizontal
line(278,y+120,x+8,y+210);//2 detalhe diagonal
line(x+8,y+210,289,y+210);//3 detalhe horizontal
line(289,y+210,x+10,412);//3 detalhe diagonal
strokeWeight(3);//espessura do terraço
line(257,y+15,270,y);//sustentação do terraço
ellipse(270,y,30,7);//borda do terraço
fill(90,140,79);//preenchimento da grama
ellipse(270,y,25,7);//grama do terraço
fill(170);//cor da entrada
stroke(255);//cor da borda da entrada
strokeWeight(1);//espessura borda da entrada
rect(240,410,20,6);//entrada
stroke(170);//cor da linha inferior
line(240,416,260,416);//cor da linha inferior à entrada

//Árvores da ilha
stroke(85,71,50);//cor do tronco
strokeWeight(2);//espessura do tronco
line(180,400,180,404);//tronco
line(167,389,167,393);//tronco
line(180,385,180,381);//tronco
line(220,435,220,431);//tronco
line(317,400,317,404);//tronco
line(329,385,329,389);//tronco
noStroke();
fill(59,75,45);//cor árvore
ellipse(180,398,7,7);//árvore
ellipse(167,387,7,7);//árvore
ellipse(180,379,7,7);//árvore
ellipse(220,429,7,7);//árvore
ellipse(317,398,7,7);//árvore
ellipse(329,382,7,7);//árvore








