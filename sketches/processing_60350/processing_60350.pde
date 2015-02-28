
/*
"(DE)FRAGMENTED"

Random - Aleatoriedade
Técnica de Composição - Imagem Estática

- Geração de ellipses
- Geração de imagens
- Tamanho aleatório
- Cor aleatória
- Transparência aleatória
*/

int numPieces;//variável para definir o número total de objectos, neste caso da imagem
PImage piece;//definir a variável para carregar a imagem
int numTriangle;//número total de objectos, neste caso triângulos
int numEllipse;//variável para definir o número total de objectos, neste caso círculos
float posX,posY;//variáveis para a posição horizontal e vertical dos objectos
float tamanho;//variável para o tamanho dos objectos
float r,g,b;//variáveis definir a cor dos objectos
float s;//variável para controlar a espessura do outline

//início da função setup
//definir propriedades gerais do ambiente, chamadas somente uma vez
void setup(){
  
  size(1024,700);//tamanho da tela
  background(255);//cor de fundo
  smooth();//suavizar pixelização
  noLoop();//sem repetição
  piece = loadImage("piece.png");//carregar a imagem
  numPieces = 100;//número total de imagens (controlo do loop)
  numEllipse = 200;//número total de ellipses (controlo do loop)
  
}
//fim da função setup
//fim das definições gerais do ambiente

//função draw
//definir a composição de objectos
void draw(){
  
  background(255);//cor de fundo
  
  //gerar valores e desenhar a ellipse
  for(int i = 0; i < numEllipse; i++){//variável para desenhar a ellipse em loop
     posX = random(width);//gerar um número para posição horizonral 
     posY = random(height);//gerar um número para posição vertical
     tamanho = random(5,200);//gerar um tamanho entre 5 e 200
     r = random(255);//gerar um valor para a componente vermelha entre 0 e 255
     g = random(255);//gerar um valor para a componente verde entre 0 e 255
     b = random(255);//gerar um valor para a componente azul entre 0 e 255
     noStroke();//sem contorno
     fill(r,g,b,random(255));//preenchimento a ellipse com os valores gerados
     ellipse(posX,posY,tamanho,tamanho);//desenhar a ellipse com os valores gerados
  }
  
  //gerar valores e desenhar a imagem
  for(int i = 0; i < numPieces; i++){//variável para desenhar a imagem em loop
    tint(random(255),random(255),random(255),random(255));//definir o valor da tonalidade de preenchimento e a transparência
    tamanho = random(5,300);//gerar um tamanho entre 5 e 300
    image(piece,random(width),random (height),tamanho,tamanho);//desenhar a imagem definindo a posição x e Y e o tamanho
  }
  
  saveFrame("(De)Fragmented.png");//guardar a imagem
}
//fim da função draw
//fim das definições da composição de objectos

