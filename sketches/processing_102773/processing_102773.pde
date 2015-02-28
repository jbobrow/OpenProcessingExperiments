
size(500,700);

PFont fonte;

fonte = loadFont("ArialRoundedMTBold-48.vlw");

 

fill(#000000);

//Pneu esq

rect(100,490,70,100,15);

//Pneu dir

rect(330,490,70,100,15);

 

//Retangulo maior

fill(#FF3300);

rect(45,110,410,400,10,10,90,90);

 

//Retangulo preto para-brisa

fill(#000000);

rectMode(CORNERS);

rect(50,112,450,342,10,10,0,0);

 

//para-brisa

rectMode(CENTER);

fill(#F0E8E6);

rect(250,250,350,175);

 

//divisoria para-brisa

fill(#000000);

rect(250,250,5,175);

 

//limpador esq

line(164.5,162.5,200,240.8);

line(166.5,162.5,200,240.8);

rect(200,240.8,2,100);

 

//limpador dir

line(337.5,162.5,290,240.8);

line(339.5,162.5,290,240.8);

rect(290,240.8,2,100);

 

//letreiro

fill(#4B4847);

rect(250,132.5,300,30);

fill(#FF5500);

textSize(23);

text("L   I   G   E   I   R   Ã   O",115,140);

//Sei que ngm vai ler isso, mas estou me sentindo de volta ao orkut!!!

 

//Coisinhas do lado do letreiro

fill(#EAEAEA);

ellipseMode(CORNERS);

ellipse(75,117.5,90,132.5);

ellipse(410,117.5,425,132.5);

 

//Detalhe dos faróis

triangle(75,347.5,75,397.5,125,397.5);//esquerdo

triangle(425,347.5,425,397.5,375,397.5);//direito

 

//entradas de ar

fill(#000000);

quad(125,367.5,160,397.5,340,397.5,375,367.5);//trapézio

rect(250,437.5,300,30);//retangulo grande

rect(150,480,100,20);//retangulo esq

rect(350,480,100,20);//retangulo dir

 

ellipseMode(CENTER);

 

//Detalhe na entrada de ar

fill(#EAEAEA);

ellipse(250,382.5,25,25);

 

//Luzes dianteiras

fill(#FFFF00,100);

ellipse(412,385,20,20);//farol esq

ellipse(88,385,20,20);//farol dir

fill(#FF9100,150);

ellipse(80,360,10,10);//seta esq

ellipse(420,360,10,10);//seta dir

fill(#CBC9C5);

ellipse(110,390,12,12);//aux esq

ellipse(390,390,12,12);//aux dir

 

//placa

stroke(#FFFFFF);

fill(#FF0000);

rect(250,422.5,80,30,5);

fill(#FFFFFF);

textSize(15);

text("ALG-0001",212,435);

textSize(10);

text("CURITIBA - PR",214,420);

 

//Detalhe do ar condicionado

fill(#FF3300);

noStroke();

rectMode(CENTER);

rect(250,105,50,10);

 

//Retrovisores
