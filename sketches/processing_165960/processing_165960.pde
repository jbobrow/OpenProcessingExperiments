
/*
Rodrigo H. Carlin & Alexandre V. Delazeri;
13/10/2014;
Materia:Alg1;
Explicação:
  Imagem produzida em homanagem ao Ada Lovelace Day, comemorado em homenagem a Ada Lovelace, matematica britanica considerada desenvolvedora do primeiro algoritmo, para a maquina de babbage.
  O no dia quatorze do outubro é comemorado o já citado Ada Lovelace Day, onde homenageamos os feitos cientificos e matematicos das mulheres.
  Ele foi criado por Suw Charman-Anderson para comemorar e divulgar as conquistas das mulheres na ciência, tecnologia, engenharia e matemática 
  Representativa de um diagrama de fluxo de um algoritimo abstrato para mostrar como uma mulher (Ada Lovelace) criou toda a ideia de programação e que tanto homens e mulheres, 
  ou até ambos juntos podem programar e desenvolver sistemas.
*/

size(500,500);
background(255,255,255);
strokeWeight(3);
stroke(0,0,0);
line(100, 160, 400, 160); // primeira linha horizontal - cima
line(100,160, 100, 300); // primeira linha vertical - esquerda
line(400,160, 400, 300); // segunda linha vertical - direita
line(250,190,250,400); // terceira linha vertical - centro
line(100,300,400,300); // segunda linha horizontal - baixo
rectMode(CENTER);
fill(255,0,0);
rect(100,300, 90, 60); // retangulo esquerdo
fill(0,0,255);
rect(400,300, 90, 60); // retangulo direito
fill(142,135,135);
rect(250, 400, 120, 60); // retangulo central-inferior
fill(51,0,102);
rect(250, 250, 90, 60); // ratangulo central-superior
stroke(255,0,0);
line(height/2, width/5, (height/2), (width/5)+90);
line(225,160,275,160);
fill(255,0,230);
ellipseMode(CENTER);
ellipse(height/2, width/5.5, 100, 100);
fill(0,0,0);
textSize(14);
text("Programming", 205, 91);// texto da bola rosa
textSize(20);
text("Both!", 225,255); // texto do retangulo roxo
textSize(30);
text("F", 90,310);  // texto do retangulo vermelho
text("M", 390,310); // text of the blue rectangle
textSize(14);
text("Happy",230,390);
text("Ada Lovelace", 210,405); 
text("Day!",238 ,420); 


