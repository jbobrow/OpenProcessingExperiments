
void setup () { // definiçao set up
  
  size (700, 700); // tamanho janela
  background (255); // cor fundo 
  smooth (); // suavizar elementos
  noLoop (); // manter imagem estatica
  
}

float posX, posY; // variavel posiçao X e Y
float diametro; // variavel diametro 
float r, g, b; // variavel cor

float px, py; // variavel px e py

void draw () { // definiçao elementos composiçao 

  colorMode (RGB, 255, 255, 255); // cor modo RGB
  
  colorMode (HSB, 360, 100, 100, 100); // cor modo HSB
  
  px = width/2; // posiçao aleatoria janela
  py = height/2; // posiçao aleatoria janela
  
  posX = width/2; // posiçao aleatoria janela
  posY = height/2; // posiçao aleatoria janela
  
  for (int i = 0; i < 400; i = i + 1){ // a repetiçao varia entre 1 e 400
    
    posX = width/2 + random (-i, i); // posiçao variavel de X
    posY = height/2 + random (-i, i); // posiçao variavel de Y

    diametro = map (i, 0, 300, 10, 1); // diametro 
    
    float h = map (i, 0, 300, 0, 260); // variavel h
   
    stroke (0, diametro*50); // contorno 
    ellipse (posX, posY, diametro, diametro); // posiçao circulos
    
    r = random (255); // variavel de cor na escala de vermelhos
    g = random (255); // variavel de cor na escala de verde
    b = random (255); // variavel de cor na escala de azul
    noStroke (); // nao existe contorno
    fill (r, g, b); // preenchimento 
    ellipse (posX, posY, 4, 4); // posiçao circulos
    
    stroke (0, diametro*20); // contorno 
    line (px, py, posX, posY); // posiçao linha
    
    px = posX;
    py = posY;
    
  }

}  
