
// Autor ou Autora Luiz Ernesto Merkle
// licença CC A SA 

// variáveis globais 
int posicaox = 0;
int k = 0; 
color fundo = color(k,k,0);
color figura = color(0,k,k);
color traco = color (k,0,k); 

// Inicialização 
void setup() {
  size(200, 200);
  strokeWeight(5);
  strokeJoin(ROUND); 
// noLoop(); // Se estático descomente
}

void draw() {
  int aux;
// especifique como vai ser desenhado
  background(fundo);
  stroke(traco); 
  fill( figura); 
  aux = posicaox%(width/2);
// desenhe
  triangle(aux, aux, aux+width/2, aux+width/2, aux, aux+width/2);
  rect(posicaox++%width,40, 30, 80, 10); 

  
// atualize as variáveis para controlar o próximo desenho
  k = ++k% 255; // % soma mas se limita o resto, tornando o valor cíclico
  fundo = color(k,k,0);
  figura = color(0,k,k);
  traco = color (k,0,k); 
}
/*
Estrutura básica de um esboço em processing com setup() e draw() e uso de variáveis. 

Estas variáveis globais controlam posições e cores, e utilizadas ao início da função draw(). 

Elas são atualizadas ao final da draw, depois das figuras desenhadas. 

Propriedades que não mudam podem ser chamadas uma só vez, na função setup().
*/
