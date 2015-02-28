
size(400,500); //tamanho da tela
background(#A5C2FF); //cor do fundo

fill(#FFFFFF); //cor da nuvem
stroke(#FFFFFF);

arc(70, 50, 100, 20, 0,30,50); //nuvens
arc(100, 65, 100, 20, 0,30,50);
arc(130, 45, 110, 30, 0,30,50);

arc(230, 65, 100, 20, 0,30,50);
arc(260, 80, 100, 20, 0,30,50);
arc(290, 60, 110, 30, 0,30,50);


fill(#AFAFAF); //cor do chão
stroke(#AFAFAF); //linha do horizonte
rect(0,390,400,110); //chão

stroke(#696F6B); //cor das linhas da esfera
strokeWeight(1); //espessura das linhas da esfera
noFill(); //preenchimento da esfera
arc(295, 100, 70, 70, 0, 20,20); //esfera vazada no topo


noFill(); //linha da esfera 1
beginShape();
vertex(295, 100);
bezierVertex(270,50, 285, 45, 300, 65);
endShape();

noFill(); //linha da esfera 2
beginShape();
vertex(295, 100);
bezierVertex(240,50, 245, 80, 300, 120);
endShape();

noFill(); //linha da esfera 3
beginShape();
vertex(295, 100);
bezierVertex(250,60, 285, 65, 300, 70);
endShape();

noFill(); //linha da esfera 4
beginShape();
vertex(295, 100);
bezierVertex(300,80, 350, 40, 300, 60);
endShape();

noFill(); //linha da esfera 5
beginShape();
vertex(295, 100);
bezierVertex(330,100, 360, 40, 315, 80);
endShape();

noFill(); //linha da esfera 6
beginShape();
vertex(300, 100);
bezierVertex(260,50, 295, 65, 320, 70);
endShape();

noFill(); //linha da esfera 7
beginShape();
vertex(300, 100);
bezierVertex(290,50, 295, 65, 270, 70);
endShape();

noFill(); //linha da esfera 8
beginShape();
vertex(300, 100);
bezierVertex(290,50, 295, 65, 340, 70);
endShape();

strokeWeight(0); //espessura das bordas das figuras
stroke(#FFEC8E);//cor das figuras

fill(#FCD49E); //cor do lado esquerdo do prédio
stroke(#FCD49E); //cor das linhas

rect(50,150,85,280); //lado esquerdo do prédio

arc(285, 110, 140, 30, 0, 20,20); //elipse acima do retângulo direito

rect(225,110,100,280); //retângulo direito do prédio

rect(290,390,25,40); //retângulo inferior direito

triangle(325,110,325,390,355,110); //triângulo extremo direito

noFill(); //linha das janelas 1
stroke(20);
beginShape();
vertex(50, 200);
bezierVertex(70,170, 45, 190, 348, 180);
endShape();

noFill(); //linha das janelas 2
stroke(0);
beginShape();
vertex(50, 230);
bezierVertex(70,245, 45, 200, 342, 235);
endShape();

noFill(); //linha das janelas 3
stroke(0);
beginShape();
vertex(50, 255);
bezierVertex(90,275, 120, 230, 340, 260);
endShape();

noFill(); //linha das janelas 4
stroke(0);
beginShape();
vertex(50, 290);
bezierVertex(110,295, 120, 300, 338, 280);
endShape();

noFill(); //linha das janelas 5
stroke(0);
beginShape();
vertex(50, 345);
bezierVertex(80,310, 120, 340, 334, 310);
endShape();

noFill(); //linha das janelas 6
stroke(0);
beginShape();
vertex(50, 375);
bezierVertex(80,330, 120, 360, 330, 360);
endShape();

stroke(0); //linha das janela 7
beginShape();
vertex(210, 150);
bezierVertex(290, 140, 330, 110, 354, 115);
endShape();

stroke(#039DAD);
fill(#039DAD); //cor do retângulo central inferior azul
rect(135,390,155,40); //retângulo central inferior azul

int x=60;
int y=170;

rect (x, y, 25,35); //janela 1 lado esquerdo

rect (x+35, y, 25,35);

rect (x, y+50, 25,35); //janela 3 lado esquerdo

rect (x+35, y+60, 25,35);

rect (x, y+100, 25,35); //janela 5 lado esquerdo

rect (x+35, y+110, 25,35);

rect (x, y+150, 25,35); //janela 7 lado esquerdo

rect (x, y+200, 25,35);

rect (235, 130, 20,40); //janela 1 lado esquerdo primeira linha
rect (270, 130, 20,40);
rect (305, 130, 20,40); //janela 3 lado esquerdo primeira linha
rect (340, 130, 15,40); //janela 4 mais estreita primeira linha

rect (235, 190, 20,30); //janela 1 segunda linha
rect (267, 190, 20,30);
rect (302, 190, 20,30); //janela 3 segunda linha
rect (337, 190, 15,30);

rect (235, 240, 20,30); //janela 1 terceira linha
rect (265, 245, 20,30);
rect (300, 240, 20,30); //janela 3 terceira linha
rect (330, 245, 15,30);

rect (235, 290, 20,30); //janela 1 quarta linha
rect (263, 295, 20,30);
rect (297, 290, 20,30); //janela 3 quarta linha
rect (326, 295, 15,30);

rect (235, 340, 20,30); //janela 1 quinta linha
rect (261, 345, 20,30);
rect (293, 340, 20,30); //janela 3 quinta linha
rect (322, 345, 15,30);

fill(#FCD48F); // pilares inferiores
stroke(200);
rect(210,390,15,40);
rect(180,390,13,40);
rect(150,390,10,40);
rect(120,390,15,40);
rect(87,395,10,35);


fill(#039DAD); // cor das linhas da forma central
stroke(#039DAD);

beginShape(); //forma orgânica azul central
vertex(125, 60);
bezierVertex(160, 60, 230,65, 225, 75);
bezierVertex(235, 200, 230, 280, 225,390);
bezierVertex(100, 395, 200, 395, 85,400);
bezierVertex(90, 330, 125, 290, 135, 235);
endShape();

fill(#FCD49E); 
stroke(#FCD49E);
rect(200,260,50,15); // detalhe em balanço
