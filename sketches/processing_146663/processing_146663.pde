
/*Bruno Pedroso Schmockel
inicio do projeto 27/04;
Descrição:
Toda a musica se refere ao poder de comunicação da internet, para a transmissaão de informações, idéias e opiniões. O proposito desse codigo é representar parte dessas ligações, atravez das 
linhas, que personificam os cabos de fibra óptica, responsaveis, obviamente, pela transmissão de informações citada de varias maneiras pela musica, e que engloba todo o planeta.
dicionados também elesmentos citados como figurações da musica, como o barco, que é usado para navegar ou até mesmo desbravar a rede, o videopôquer da ultima estrofe, e o virus de computador,
que como não tem representação visaul direta, foi adotado o formato do vírus biológico bacteriofago, que é a imagem mais difundida em questão de vírus.
*/
size(800,600);
background(0);
fill(255);
//strelas
ellipse(20,20,5,5);
ellipse(240,650,5,5);
ellipse(400,590,5,5);
ellipse(500,15,5,5);
ellipse(100,210,5,5);
ellipse(750,40,5,5);
ellipse(300,500,5,5);
ellipse(150,450,5,5);
ellipse(750,570,5,5);
ellipse(725,320,5,5);
fill(#4754DB);
noStroke();
//planeta
ellipse(400,300,400,400);
//polo
fill(255);
ellipse(400,130,200,58);
fill(#2BAF20);
//continente base
rect(400,200,150,80);//parte de cima
quad(410,260,440,260,490,370,460,370);//parte do meio
rect(390,370,120,70);//parte inferior
//detalhes de contorno
//continente parte superior
ellipse(420,220,90,40);
ellipse(460,200,90,45);
ellipse(520,200,60,25);
ellipse(550,230,34,65);
ellipse(550,260,25,75);
ellipse(500,280,110,25);
ellipse(520,280,45,35);
ellipse(400,280,35,75);
//continete parte mediana
ellipse(550,350,40,20);
ellipse(560,350,40,20);
ellipse(550,305,5,5);
ellipse(530,310,5,5);
ellipse(570,380,5,5);
//continente parte inferior
ellipse(420,365,116,55);
ellipse(390,390,45,95);
ellipse(420,430,90,110);
ellipse(480,420,100,100);
ellipse(500,380,45,60);
//cabos
stroke(#25CEC4);
strokeWeight(6);
line(500,380,420,220);
line(550,260,530,310);
line(530,210,550,350);
line(550,350,490,425);
line(420,365,520,280);
line(420,365,500,280);
line(420,365,550,260);
line(550,350,420,365);
line(420,365,200,300);
line(200,300,550,350);
line(200,300,500,380);
line(200,300,550,260);
line(200,300,550,260);
line(200,300,420,220);
line(200,300,530,210);
line(200,300,420,365);
//barco
fill(0);
stroke(0);
strokeWeight(1);
quad(230,240,260,240,255,250,235,250);//casco
rect(240,220,8,25);//mastro
fill(#FFFFFF);
triangle(248,220,248,235,260,235);//vela
//videopoquer
fill(0);
rect(400,400,80,70);
fill(255,0,0);
rect(410,410,20,40);
fill(0,255,0);
rect(430,410,20,40);
fill(0,0,255);
rect(450,410,20,40);
fill(0);
ellipse(420,430,10,15);
ellipse(440,430,10,15);
ellipse(460,410,10,15);
fill(255);
text("Videopôquer",405,467);
//Vírus
quad(200,290,230,330,200,370,170,330);
stroke(255);
strokeWeight(5);
line(200,370,200,400);
line(200,400,180,380);
line(200,400,220,380);
line(180,380,175,400);
line(220,380,225,400);
