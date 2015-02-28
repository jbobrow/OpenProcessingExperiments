
// Avaliação Computação 1 - Arquiterura e Urabanismo
// Exercício 03 
// [2,5] Desenvolva o esboço da questão 1 por meio de um laço com for(){}, ou while(){};, e variáveis auxiliares

size(200, 200);

/*line (width/10, height/10, width-width/1,200);
 line (width/10, height/10, width-width/2,175);
 line (width/10, height/10, width-width/3,150);
 line (width/10, height/10, width-width/4,125);
 line (width/10, height/10, width-width/5,100);
 line (width/10, height/10, width-width/6, 75);
 line (width/10, height/10, width-width/7, 50);
 line (width/10, height/10, width-width/8, 25);
 line (width/10, height/10, width-width/9, 0);
 line (width/10, height/10, width-width/9, 0);
 line (width - width/1, 200,width-width/9, 0);
 */

// O código da questão pode ser subdividido em duas partes, 
// uma que pode ser incluida em um laço e outra que não

// - as constantes "width/10" e "height/10" não variam
// - as coordenadas em x finais dos segmentos a desenhar 
//   podem ser expressas por (width - width/(i+1)) 
//   com i variando de 1 a 8;
// - a variação de 200 a 0 pode ser obtida por (200 -i+*25)

for (int i = 0; i<9; i++)
  line (width/10, height/10, width - width/(i+1), 200 -i*25);

line (width - width/1, 200, width-width/9, 0);
