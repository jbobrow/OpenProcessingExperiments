
size(400,500); //tamanho da tela
background(#A5C2FF); //cor do fundo

fill(#AFAFAF); //cor do chão
stroke(#AFAFAF); //linha do horizonte
rect(0,390,400,110); //chão

stroke(0); //cor das linhas da esfera
strokeWeight(0); //espessura das linhas da esfera
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

strokeWeight(0); //espessura das bordas
stroke(#FFEC8E);//cor das figuras

fill(#FCD49E); //cor do lado esquerdo do prédio
stroke(#FCD49E); //cor das linhas

rect(50,150,85,280); //lado esquerdo do prédio

arc(285, 110, 140, 30, 0, 20,20); //elipse acima do retângulo direito

rect(225,110,100,280); //retãngulo direito do prédio

rect(290,390,25,40); //retângulo inferior direito

triangle(325,110,325,390,355,110); //triângulo extremo direito

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


beginShape(); //forma orgânica azul central
vertex(125, 60);
bezierVertex(160, 60, 230,65, 225, 75);
bezierVertex(235, 200, 230, 280, 225,390);
bezierVertex(100, 395, 200, 395, 85,400);
bezierVertex(90, 330, 125, 290, 135, 235);
endShape();
