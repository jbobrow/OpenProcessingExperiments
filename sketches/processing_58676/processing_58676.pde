
void setup(){ //inicio do Set up da composição

size(500,500); //definição do tamanho da composição
background(255); //definição da cor de fundo
smooth(); //serve para suavisar os elementos da composição
noStroke(); //determina que os elementos da composição não terão contorno

}

void draw(){ //inicio da criação dos elementos da composição
  
  for (int i = 1; i < 11; i = i+1) { //determina a sequência de repetições
      
  //criação de uma variável para a cor
  
  float r = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
  float g = random (0,100); //determina um valor para a escala de verdes que vai de 0 a 255
  float b = random (0,20); //determina um valor para a escala de azuis que vai de 0 a 255
  
    //criação dos quadrados
    
    fill (r,g,b); //atribuição de cor aos circulos recorrendo às variáveis anteriores
    rect( i * 50 , height/2, 30,30); //coordenadas dos quadrados. estes encontram-se sempre na mesma coordenada de Y, neste caso, no centro da composição
      
    }
    
}

