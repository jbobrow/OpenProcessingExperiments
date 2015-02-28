

size (500,500);
smooth();
background(0);
/*definições do programa*/

int posx=50;
int posy=50;
int largura=400;
int altura=400;
/*definições iniciais das coordenadas dos quadrados*/


for (int x=1; x<10; x++){
  /*processo de repetição dos quadrados*/
  fill (random(255), random(255), random(255));
  /*o random de cores*/
  rect(posx, posy, largura, altura);
  /*desenho dos quadrados*/
  posx=posx+50;
  posy=posy+50;
  largura=largura-50;
  altura=altura-50;
  /*alteração das variaveis para haver diminuição dos quadrados*/
}

      

