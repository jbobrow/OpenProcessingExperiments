
size(500,505);

//Fundo(Calçada de representação do Jardim Botânico
background(100);
//Representação dos triangulos (Jd. Botânico)
stroke(0,100,0);
strokeWeight(5);
fill(50,200,0);
triangle(250,240,490,10,10,10);
triangle(250,260,10,490,490,490);
triangle(260,250,490,475,490,25);
triangle(240,250,10,25,10,475);
//Texto
fill(85);
textSize(50);
text("Curitiba",150,70);
//Pinheiro
strokeWeight(2);
stroke(139,69,19);//contorno da madeira da arvore
rect(100,40,1,30);//tronco 
fill(50,200,0); //cor de fundo
arc(100,45,20,10,HALF_PI, PI); //galho inferior lado esquerdo
arc(100,35,15,8,HALF_PI, PI); //galho superior esquerdo
arc(102,45,20,10,0,HALF_PI);//galho inferior direito
arc(102,35,15,8,0,HALF_PI);//galho superior direito
fill(0,100,0); //cor das folhas
stroke(0,100,0);//contorno das folhas
ellipse(94,30,8,8); //folhas lado superior esquerdo
ellipse(90,43,8,8);//Folhas lado esquerdo inferior
ellipse(110,44,8,8);//Folhas direito inferior
ellipse(106,31,8,8); //Folhas direito superior
//PINHÃO
fill(139,69,19);//cor interna do pinhão
stroke(139,69,19);//contorno do pinhão
ellipse(390,50,9,25);
triangle(390,60,385,70,395,70);
//TRIANGULO LADO ESQUERDO
stroke(10);
fill(80);
line(20,302,170,300);//chão
stroke(90);
rect(30,280,30,20);//tubo do ônibus
stroke(10);
ellipse(45,260,50,50);//tubo do ônibus
line(60,280,70,280);
stroke(255,0,0);
fill(255,0,0);
rect(80,230,50,60,8);//ônibus
fill(10);
stroke(10);
rect(83,291,10,10);//pneu esquerdo
rect(117,291,10,10);//pneu direito
rect(83,235,20,30);//vidro esq.
rect(108,235,20,30);//vidro dir.
ellipse(85,280,2,2);//farol esq1.
ellipse(91,280,2,2);//farol esq2.
ellipse(119,280,2,2);//farol dir1.
ellipse(125,280,2,2);//farol dir2.
//MUSEU DO OLHO
noStroke();
fill(215,215,0);
rectMode(CENTER);
rect(250,415,30,30);//base (amarela) do olho
fill(10);
ellipse(250,380,100,50);//olho
triangle(190,380,210,395,210,365);//lateral esq. do olho
triangle(310,380,290,395,290,365);//lateral dir. do olho
//ARCO DE STA FELICIDADE
noStroke();
fill(244,164,96);
rect(330,250,20,60);//torre 1
triangle(330,200,320,220,340,220);//triangulo em cima da torre 1
fill(50,200,0);
quad(330,225,323,230,330,235,337,230);//quadrado vazado na torre 1
fill(255,228,181);
rectMode(CORNER);
rect(340,220,75,60);//meio, ao lado da torre 1
fill(50,200,0);
arc(380,280,60,80,PI,TWO_PI);//arco da parte do meio
fill(250,128,114);
rect(400,230,80,60);//parte do lado direito
triangle(440,200,410,230,470,230);
fill(50,200,0);
rect(415,250,50,40);
quad(440,230,435,235,440,240,445,235);//quadrado vazado no lado direito.



