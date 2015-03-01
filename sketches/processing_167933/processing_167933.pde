
/* Nomes: Aline Martins Stainsack
          Felipe Branchi
   Data: 13/10/2014
  Explicação: 
No dia 14 de outubro é comemorado o Ada Lovelace Day,
criado por Suw Charman-Anderson, que tem como objetivo celebrar
e espalhar pelo mundo conquistas feitas por mulheres nas áreas de ciência,
tecnologia, engenharia e matemática. O título faz referência a Ada Augusta Byron King (1815-1852),
conhecida como Ada Lovelace – Condessa de Lovelace, considerada a primeira programadora por ter escrito
um algoritmo a ser processado por uma máquina. Além dos conhecimentos em matemática e das contribuições
em programação, Ada também foi escritora, habilidade que herdou do pai, o poeta George Gordon Byron,
com quem teve algum contato apenas durante o primeiro mês de vida. Comemorações através de  eventos e
divulgação de contribuições femininas com vistas ao desenvolvimento das áreas já citadas marcam a data  há 5 anos.*/
size(500,500);
background(255,255,255);
rectMode(CENTER);
noFill();
stroke(255,000,255);
strokeWeight(8);
rect(250,50,140,40,180); /*primeiro retangulo rosa*/
stroke(000,000,000);
strokeWeight(3);
line(250,75,250,125); /*linha de conexao*/
fill(000,000,000);
triangle(245,125,255,125,250,130);
noFill();
stroke(000,000,255);
strokeWeight(8);
rect(250,155,140,40); /*retangulo azul*/
stroke(000,000,000);
strokeWeight(3);
line(250,180,250,230);/*linha de conexao*/
fill(000,000,000);
triangle(245,230,255,230,250,235);
noFill();
stroke(000,255,000);
strokeWeight(8);
quad(250,243,345,295,250,350,155,295);/*losango verde*/
stroke(000,000,000);
strokeWeight(3);
line(147,295,128,295);
line(128,295,128,155);
line(128,155,172,155);
fill(000,000,000);
triangle(167,150,167,160,172,155);
stroke(000,000,000);
strokeWeight(3);
line(250,355,250,400);
triangle(245,395,255,395,250,400);
noFill();
stroke(255,000,255);
strokeWeight(8);
rect(250,427,140,40,180);/*retangulo rosa final*/
noFill();
stroke(255,000,255);
strokeWeight(2);
ellipse(250,285,20,20); /*Simbolo do sexo feminino*/
line(250,295,250,315);
line(240,305,260,305);
textSize(15);
text("Ada Lovelace Day",187,55); /*referencia a ada lovelace day comemorado em 14*/


