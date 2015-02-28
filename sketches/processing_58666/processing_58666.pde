
void setup(){ //inicio do Set up da composição
  
  size (500,500); //definição do tamanho da composição
  background (255); //definição da cor de fundo
  smooth (); //serve para suavisar os elementos da composição
  
}

void draw (){ //inicio da criação dos elementos da composição
  
//criação de uma variável para o tamanho do circulo
  
  float circulo = random (20,100); //determina um tamanho aleatorio para o circulo que vai de 20 a 100
  
//criação de uma variável para a cor
  
 float r = random (0, 255); //determina um valor para a escala de vermelhos que vai de 0 a 255
 float g = random (0, 255); //determina um valor para a escala de verdes que vai de 0 a 255
 float b = random (0, 255); //determina um valor para a escala de azuis que vai de 0 a 255

//criação de circulos aleatorios
 
  fill (r,g,b); //atribuição de cor aos circulos recorrendo às variáveis anteriores
  noStroke(); //determina que os circulos não terão contorno
  ellipse (random (500), random (500), circulo, circulo); //cordenadas do circulo
  
//+++++++criação de uma nova layer
  
  fill (255); //atribuição de cor ao circulo, neste caso, branco
  noStroke (); //determina que os circulos não terão contorno
  ellipse (255,255,200,200); //cordenadas do circulo

}
  
