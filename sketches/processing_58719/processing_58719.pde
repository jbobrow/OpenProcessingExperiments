
void setup () { // definiçao set up
  
  size (700, 700); // tamanho da janela
  background (0); // cor fundo janela
  smooth (); // suavizar elementos
  noLoop (); // manter imagem estatica
  
  lh = 100; // limite horizontal janela
  lv = 200; // limite vertical janela
  
}

float posX, posY; // variavel posiçao X e Y
float lado; // variavel lado
float r, g, b; // variavel cor

float lh, lv; // variavel limites horizontal e vertical 

void draw () { // definiçao elementos composiçao 

  for (int i = 0; i < 200; i = i + 1){ // a repetiçao varia entre os valores de 1 e 200
    
    posX = random (width/2 - lh, width/2 + lh); // variavel posiçao X
    posY = random (height/2 - lv, height/2 + lv); // variavel posiçao Y
    lado = random (5, 200); // variavel lado entre 5 e 200
    r = random (255); // variavel cor na escala de vermelho
    g = random (255);  // variavel cor na escala de verde
    b = random (255); // variavel cor na escala de vermelho
  
    noStroke (); // nao existe contorno 
    fill (r, g, b); // preenchimento
    rect ( posX, posY, lado, lado); // posiçao quadrado 
  }

}  
