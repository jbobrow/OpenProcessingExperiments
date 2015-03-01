
/*  13/10/2014 - Author: Igor Moreira e Fernando Levy 
Name: Ada Lovelace Day
 RepresentaÃ§Ã£o em homenagem a Ada Lovelace, considerada como a primeira progamadora da histÃ³ria. A boneca 
tem como representatividade o gÃªnero femenino e a calculadora como a informÃ¡tica em um todo, os quais ligados 
entre si transmitem a mensagem de nÃ£o existirem limitaÃ§Ãµes.
 Contudo como a prÃ³pria Ada Lovelace provou, nÃ£o existem restriÃ§Ãµes na informÃ¡tica independente de seu ambiente 
ou sua criaÃ§Ã£o e que sua capacidade de desempenho so depende de si mesmo.*/

size (500, 330);
strokeWeight(2);
rect(88, 200, 10, 10);
rect(103, 200, 10, 10);
//PÃ©s da Boneca

rect(77, 170, 15, 10);
rect(108, 170, 15, 10);
//MÃ£os da Boneca

fill(250, 0, 0);
triangle(100, 120, 80, 200, 120, 200);
fill(255, 255, 255);
//Barriga da Boneca

ellipse(100, 138, 40, 40);
//CabeÃ§a da Boneca

ellipse(92, 135, 10, 10);
ellipse(108, 135, 10, 10);
//olhos da boneca

arc(112, 143, 50, 14, HALF_PI, PI);
//Boca da Boneca

line(115, 125, 130, 170);
line(85, 125, 70, 170);

//Cabelo da Boneca

strokeWeight(3);
ellipse(220, 120, 20, 20);
line (220, 130, 220, 160);
line (210, 145, 230, 145);
fill(255, 255, 255);
// Simbolo feminino

strokeWeight(4);
line (250,180,250,215);
line (190,180,190,215);
line (250,180,270,198);
line (250,215,270,198);
line (190,180,172,198);
line (190,215,172,198);
line (190, 190, 250, 190);
line (190, 205, 250, 205);
// "<=>"

rect (320, 100, 100, 140);
rect (330, 120, 80, 20);
noFill();
textSize (18);
fill (#000000);
text ("1   2   3", 335, 170);
text ("4   5   6", 335, 190);
text ("7   8   9", 335, 210);
text ("     0", 335, 230);
textSize (22);
text ("Think Different", 140, 260);
//calculadora + frase



