
/*
Nome: Lucas Machado Ribeiro

Decidi utilizar esta imagem pois esta corresponde a capa de um cd de uma banda 
que gosto bastante (Arctic Monkeys) e que foi lancado neste ano. Juntei dinheiro
para ir no show deles ano passado e com certeza foi o melhor que ja fui ate hoje.
O album da foto nao e necessariamente o meu preferido deles, mas colocaria-o em
terceiro lugar dentre os cinco que eles ja lancaram ate hoje.
Peguei a imagem ja pronta, pois nao estava conseguindo fazer um desenho de linha curvada com perfeicao, 
e como eram muitas o desenho ficaria estranho. Tentei fazer uns efeitos em cima dela,
por isso tive que utilizar algumas estruturas ainda nao vistas. Como nao consegui (e nao sei se existe)
alguma maneira de deixar o for calcular mais lentamente, disponibilizo aqui o link para que a 
srta. possa ver a imagem original: 
http://www.gigsoup.co.uk/wp-content/uploads/2013/07/arctic-monkeys-am-cover-620x350.jpg

OBS.:O processing nao conseguiu converter para Javascript, entao copiei e colei o codigo aqui.
*/
PImage img;
 
void setup()
  {
    img = loadImage("arcticmonkeys.jpg");
    size(img.width, img.height);
    image(img, 0, 0);
  } // fim do setup

//retorna um valor inteiro aleatorio entre baixo e alto
int randInt(int baixo, int alto) 
  {
    int r = floor(random(baixo, alto+1)); //converte um valor float para int
    r = constrain(r, baixo, alto);//delimitar o maximo e minimo
    return r;
  } // fim do randInt
  
void draw() 
  {
    for (int y = 0; y < img.height; y++)
      {
        for (int x = 0; x < img.width; x++)  
          {
           int novoX = randInt(x-1, x+1);//mexe os pixels horizontalmente
           int novoY = randInt(y-1, y+1);//mexe os pixels vericalmente
           //o fato de colocar o +1 e o -1 eh para nao deixar o desenho "escapar" da janela
           set(x, y, get(novoX, novoY));//sobrepoe o pixel pelo pixel do lado
          }
      }
  } // fim do draw
