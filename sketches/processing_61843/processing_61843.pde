
size(1000,1000); // tamanho da janela 
background(700); // cor de fundo
smooth(); // definicao de contorno

int verticalResolution = 20; // quantidade de circulos na vertical
int horizontalResolution = 20; // quantidade de circulos na horizontal
int pixelsStep = 50; // espaçamento entre os circulos

for ( int y = 1; y < verticalResolution; y++){
  
    for (int x = 1; x < horizontalResolution; x = x+1) {
      
        noStroke(); // sem contorno
        ellipse ( x*pixelsStep, y*pixelsStep, 50,50); // tamanho do circulo
    
    }
    
} 

