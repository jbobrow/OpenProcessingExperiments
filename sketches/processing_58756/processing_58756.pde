
/*********************************
 composição 1d Grid
 
 objectivo - uma grelha com circulos, passando pela paleta de cores num sentido horizontal
 
 Carlos Pereira - nª26539 - Design Multimedia
 
 *********************************/

size(600, 600);//tamanho da janela predefenido
background(255);//cor de fundo da minha janela

smooth();//suavia o desenho

colorMode(HSB, 360, 100, 100); /*mudar o sistema de cores para HSB
 assim onde o utilizo o fill() os valores atribuidos serao de acordo com o 
 sistema --  HSB - Hue Saturation Brightness - 360 > todas as cores,
 100 a saturação e o brilho*/

/*******CODIGO COPIADO*******/

for (int w = 1; w < 30; w = w+1) {/*crio um ciclo for para desenhar a grelha dos 
   circulos, o w começa em 0 e vai aumentando ate 30. horizontal*/

  /********FIM CODIGO COPIADO*******/

  for (int h = 1; h < 30; h = h+1) { /*crio um ciclo for para desenhar a grelha dos 
   circulos, o h começa em 0 e vai aumentando ate 30. vertical*/

    float m; //variavel para a cor dos rectangulos
    m = map ( w, 0, 30, 360, 0);/**o intervalo do map é de 360 a 0, em um valor que varia de 
    baixo para cima. como uma paleta de cores*/
    fill(m, 100, 100);//cor atribuida em conjunto com a variavel m
    ellipse( h * 20, w* 20, 10, 10);/*desenho do rectangulo. o "h" começa em 0
     e vai aumentando de 0 ate 30, multiplicando o h e o w por 20 - espaçamento*/
  } //fechar ciclo
} //fechar ciclo
for (int w = 1; w < 15; w = w+1) {/*crio outro ciclo for para desenhar a grelha dos 
   rectangulos, o w começa em 0 e vai aumentando ate 15. horizontal*/
   
  for (int h = 1; h < 30; h = h+1) {/*crio outro ciclo for para desenhar a grelha dos 
   rectangulos, o h começa em 0 e vai aumentando ate 30. vertical*/
    colorMode(RGB);//mudo o sistema de cor para RGB
    fill(0);//cor dos rectangulos, preto
    rectMode(CENTER);//ponto central do rectangulo é a referencia
    rect ( h *20, w* 40, 10, 10);/*desenho do rectangulo. o "h"vai de 0 a 30 multipliando por 20, o w vai de 0 a 15
    multiplicando por 40.*/
  } //fechar ciclo
} //fechar ciclo

saveFrame("2d_grid.jpg"); //codigo para guardar a imagem, apenas uma 


