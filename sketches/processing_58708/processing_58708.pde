
void setup () { // definiçao set up
  
  size (700, 700); // tamanho da janela
  background (0); // cor fundo janela
  smooth (); // suavizar elementos
  noLoop (); // manter a imagem estatica
  
  perc = 20; // percentagem quadrados verdes
  prob = 100 - perc; // total quadrados menos a percentagem 
  
  cprob = 0; // caso contrario
  
}

float posX, posY; // variavel posiçao X, e Y
float lado; // variavel lado
float r, g, b; // variavel  cor

float prob; // variavel probabilidade
float perc; // variavel percentagem 
int cprob; // variavel caso contrario 

void draw () { // definiçao elementos composiçao 

  for (int i = 0; i < 100; i = i + 1){ // a repetiçao varia entre os valores de 1 e 100
    
    posX = random (width); // posiçao X aleatoria
    posY = random (height); // posiçao Y aleatoria
    lado = 70;
    
if (random (100) > prob) { // caso 100 superior a probabilidade
  
  r = 0; // variavel cor na escala vermelho
  g = 255; // variavel cor na escala de verde
  b = 0; // variavel cor na escala de azul
  
  cprob = cprob + 1; 
  
}
else { // caso contrario
  r = 0; // variavel cor na escala de vermelho
  g = 0; // variavel cor na escala de verde
  b = 255; // variavel cor na escala de azul

}  
    noStroke (); // nao existe contorno
    fill (r, g, b); // preenchimento
    rect ( posX, posY, lado, lado); // posiçao quadrado
  }

}  
