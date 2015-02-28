
/*********************************
 composição 1d Grid
 
 objectivo - uma grelha com retangulos, passando pela paleta de cores
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/

size(600, 600);//tamanho da janela predefenido
background(0);//cor de fundo da minha janela

noStroke(); //rectangulos sem linha
smooth();//suavia o desenho

colorMode(HSB, 360, 100, 100); /*mudar o sistema de cores para HSB
assim onde o utilizo o fill() os valores atribuidos serao de acordo com o 
sistema --  HSB - Hue Saturation Brightness - 360 > todas as cores,
100 a saturação e o brilho*/


for (int r = 1; r < 30; r = r+1) { /*crio um ciclo for para desenhar a grelha dos 
rectangulos, onde tera o espaçamento de cada rectangulo de 20.*/

  float m; //variavel para a cor dos rectangulos
  m = map ( r, 0, 30, 0, 360);/**o intervalo do map é de 0 a 360, em um valor que varia da
    esqueda para a direita. como uma paleta de cores*/
  fill(m, 100, 100);//cor atribuida em conjunto com a variavel m
  rectMode(CENTER);//o ponto de referencia do rectangulo é o centro
  rect( r * 20, width/2, 5, 580);/*desenho do rectangulo. o "r" começa em 0
  e vai aumentando de 0 ate 30, multiplicando o r por 20 - o tal espaçamento*/
  
} //fechar ciclo

saveFrame("1d_grid.jpg"); //codigo para guardar a imagem, apenas uma 

