
//Nome:Lucas Machado Ribeiro
//Data da criacao: 17/11/2013
//Cidade, estado e pais: Sao Jose dos Campos, Sao Paulo, Brasil

size(1000, 800); //tamanho da janela

background(69, 227, 207);//cor do fundo

fill(0,0,0);
textSize(34);
text("Embraer 314 - Super Tucano/São José dos Campos - SP",50,50);//identificacao do desenho

/* as linhas abaixo servem como guia para simular o desenho,
 facilitando a compreensão do espaço 2D. Elas podem ser ocultadas 
 quando o desenho estiver pronto.

line(100, 0, 100, 1000);
line(200, 0, 200, 1000);
line(300, 0, 300, 1000);
line(400, 0, 400, 1000);
line(500, 0, 500, 1000);
line(600, 0, 600, 1000);
line(700, 0, 700, 1000);
line(800, 0, 800, 1000);
line(900, 0, 900, 1000);

line(0, 100, 1000, 100);
line(0, 200, 1000, 200);
line(0, 300, 1000, 300);
line(0, 400, 1000, 400);
line(0, 500, 1000, 500);
line(0, 600, 1000, 600);
line(0, 700, 1000, 700);
*/

//ponta do aviao
fill(0, 0, 0);
arc(500, 100, 50, 50, PI, TWO_PI);
strokeWeight(7);
line(400, 77, 600, 77);
strokeWeight(1);

//corpo
fill(11, 111, 10);
quad(475, 100, 450, 200, 550, 200, 525, 100);
line(450,200,450,300);
noStroke();
quad(450, 200, 450, 500, 550, 500, 550, 200);
stroke(1);
fill(0,0,0);
line(450,200,450,300);
line(550,200,550,300);

//vidros
fill(189, 203, 189);
triangle(495, 110, 460, 190, 495, 170);
triangle(505, 110, 505, 170, 540, 190);

//texto no corpo
fill(0, 0, 0);
textSize(32);
text("E", 490, 250);
text("M", 490, 290);
text("B", 490, 330);
text("R", 490, 370);
text("A", 490, 410);
text("E", 490, 450);
text("R", 490, 490);

//misseis
ellipse(250,330,50,200);
ellipse(750,330,50,200);

//asas
fill(6, 64, 5);
quad(450, 300, 50, 350, 50, 450, 450, 500);
quad(550, 300, 950, 350, 950, 450, 550, 500);
line(450, 475, 50, 425);
line(550, 475, 950, 425);
fill(0, 0, 0);
textSize(28);
text("EMB 314-SUPER TUCANO", 90, 400);
text("EMB 314-SUPER TUCANO", 575, 400);

//traseira
fill(11, 111, 10);
noStroke();
quad(450, 500, 550, 500, 525, 600, 475, 600);
quad(475, 600, 525, 600, 525, 725, 475, 725);
stroke(1);
line(450,500,475,600);
line(550,500,525,600);
line(475,725,525,725);

//asas traseiras
fill(6, 64, 5);
quad(475, 600, 350, 625, 350, 700, 475, 725);
quad(525, 600, 650, 625, 650, 700, 525, 725);
strokeWeight(8);
line(500,575,500,725);
strokeWeight(1);
fill(0,0,0);
line(350,675,475,700);
line(525,700,650,675);





