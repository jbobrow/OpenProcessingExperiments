
void setup () { // definiçao set up
  
  size (700, 700); // tamanho da janela
  background (255); // cor fundo janela 
  smooth (); // suavizar elementos
  noLoop (); // manter a imagem estatica
  
}

float posX, posY; // variavel posiçao X e Y
float diametro; // variavel diametro 
float r, g, b; // variavel cor
float sw; // variavel contorno 

void draw () { // definiçao elementos composiçao 

  colorMode (RGB, 255, 255, 255); // modo cor RGB
  
  colorMode (HSB, 360, 100, 100); // modo cor HSB
  
  for (int i = 0; i < 400; i = i + 1){ // definiçao elementos composiçao 
    
    posX = random (width/2 - 100, width/2 + 100); // posiçao aleatoria X
    posY = i ; // posiçao Y

    float h = map (i, 200, 400, 100, 400); // variavel h

    diametro = map (i, 100, 400, 400, 100); // diametro 
   
    noStroke (); // nao existe contorno 
    fill (h, 200, 300); // preenchimento 
    ellipse (posX, posY, diametro, diametro); // posiçao circulos

  }

}  
