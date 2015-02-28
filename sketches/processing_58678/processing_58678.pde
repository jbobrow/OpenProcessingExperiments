
void setup(){ //inicio do Set up da composição

size(500,500); //definição do tamanho da composição
smooth(); //serve para suavisar os elementos da composição
noLoop(); //determina que vai ser uma imagem estática
background (0); //definição da cor de fundo

}

void draw(){ //inicio da criação dos elementos da composição

for ( int y = 1; y < 10; y++) //determina a sequência de repetições, neste caso para Y
{
  for (int x = 1; x < 10; x = x+1) //determina a sequência de repetições, neste caso para X
{
        
  //criação de uma variável para o tamanho dos quadrados
  
  float tamanho = random (0,50); //variável para o tamnho que vai de 0 a 50
  
  //criação de uma variável para a cor
  
  float r = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
  float g = random (255); //determina um valor para a escala de verdes que vai de 0 a 255
  float b = random (255); //determina um valor para a escala de azuis que vai de 0 a 255
  
  //criação dos quadrados
      
  fill (r,g,b); //atribuição de cor aos circulos recorrendo às variáveis anteriores   
  noStroke(); //determina que os elementos da composição não terão contorno
  rect ( x*50, y*50, tamanho, tamanho); //coordenadas dos quadrados. estes encontram-se sempre na mesma coordenada de Y, neste caso, no centro da composição     
}
    
}

}
