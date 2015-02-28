
//Primeiro Trabalho de Algoritimo - Turma S72 - 
//Curso de Bacharelado em Sistemas da Informação
//Autor: João Calixto Bonfim Neto
//Trabalho inpirado pelo Música "Pela Internet" de Gilberto Gil

//Tamanho da tela e fundo
size(900 , 700);
background(#000000);
noStroke();
fill(#1D895B);
ellipse(300 , 200 , 400 , 50);
fill(#52AA85);
ellipse(300 , 200 , 300 , 30 );
arc( 300 , 200 , 200 , 200 , PI , PI+PI, CHORD  );
fill(0);
textSize(18);
text("AlienEx", 266 , 150);
textSize(14);
text("Work with SMTP, POP, etc", 210 , 170);

//Parte Superior Direita
noStroke();
fill(#B2BEFF);
rectMode(CENTER);
rect(750 , 150 , 300 ,300 );
fill(#AAAAAA);
rect(685 , 400 , 50 , 20 );
rect(700 , 300 , 20 , 200);
triangle(605 , 180 , 795 , 180 , 700 , 300);
fill(#8E8E8E);
ellipse(700 , 180 , 190 , 20);
fill(255);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 80);
fill(0);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 100);
fill(#1EB9A3);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 100);
fill(0);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 120);
fill(255);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 140);
fill(0);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 160);
fill(#1EB9A3);
textSize(12);
text("01 010 00100 0101 0101 011 0", 605 , 180);


//Parte Inferior Esquerda
fill(#5E77AD);
stroke(#000000);
rectMode(CORNER);
rect(100 , 550 , 250 , 200);
quad(70 , 600 , 100, 550 , 100 , 700 , 70 , 700);
fill(#DE1414);
textSize(30);
text("Send to:", 120 , 590);
fill(0);
text("Calcuta", 170 , 640);

//Conexão
noStroke();
fill(#AAAAAA);
triangle(680 , 400 , 600 , 360 , 600 , 440);
fill(#8E8E8E);
ellipse(600 , 400 , 20 , 80 );
fill(#F09B9E);
rectMode(CENTER);
rect(570 , 400 , 10 , 10);
rect(540 , 400 , 20 , 20);
rect(500 , 400 , 30 , 30);
rect(450 , 400 , 40 , 40);


//Primeira fila de  @

textSize(25);
text("@", 400 , 390);
text("@", 400 , 410);
text("@", 400 , 430);

//Segunda fila de @

text("@", 370 , 370);
text("@", 370 , 390);
text("@", 370 , 410);
text("@", 370 , 430);
text("@", 370 , 450);

//Terceira fila de @

text("@", 340 , 350);
text("@", 340 , 370);
text("@", 340 , 390);
text("@", 340 , 410);
text("@", 340 , 430);
text("@", 340 , 450);
text("@", 340 , 470);

//Envelopes

fill(#ABE0F5);
rect(290 , 470 , 50 , 30);
stroke(0);
line(265 , 455 , 290 , 470);
line(315 , 455 , 290 , 470);
fill(#7BB5CB);
noStroke();
rect(270 , 390 , 70 , 40);
stroke(0);
line(235 , 370 , 270 , 390);
line(305 , 370 , 270 , 390);
fill(#1696C6);
noStroke();
rect(180 , 475 , 120 , 70);
stroke(0);
line(120 , 440 , 180 , 475);
line(240 , 440 , 180 , 475);
