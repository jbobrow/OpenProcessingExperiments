
/*Título: Interpretação gráfica da canção "Pela Internet", de Gilberto Gil.
Autor: Marcos Paulo Ruppel
Disciplina: IF61F - Algoritmos I - S73
Turma: BSI 2014
Descrição: a criação do "web site", como é dito na primeira estrofe, a 
jangada de Gigabytes que veleja no mar de informações, levando um oriki até um micro
em "Taipé" (Taipei, Taiwan).
*/
size(600,500, P2D);
background(181,227,240);
/*monitor*/
fill(0,0,0);
rect(200,10,150,100);//moldura
quad(255,110,235,140,315,140,295,110);//base
fill(255,255,255);
rect(210,20,130,80);//tela
noStroke();
fill(215,215,215);
rect(211,20,129,15);//barra de endereços
fill(0,0,0);
text("http://www.eu.com",215,30);
fill(139,190,255);
textSize(32);
text("☻",260,70);
/*barco*/
fill(175,175,175);
quad(20,420,60,470,260,470,300,420);
fill(255,255,255);
textSize(26);
text("? GB",130,445);
/*bandeira Taiwan*/
fill(255,0,0);
rect(480,340,80,50);
noStroke();
fill(0,0,149);
rect(480,340,40,25);
fill(255,255,255);
ellipse(500,352,12,12);
/*disquete*/
stroke(0);
rect(460,435,120,30);
rect(500,440,40,20);
strokeWeight(5);
line(470,450,570,450);
strokeWeight(1);
/*mar de informações*/
textSize(12);
fill(0,142,210);
text("01101001 01101110 01110100 01100101 01110010 01101110 01100101 01110100",0,480); 
fill(0,142,210);
text("01110111 01100101 01100010 00101101 01110011 01101001 01110100 01100101",0,490);
fill(0,142,210);
text("01101001 01101110 01110100 01100101 01110010 01101110 01100101 01110100",0,500);

