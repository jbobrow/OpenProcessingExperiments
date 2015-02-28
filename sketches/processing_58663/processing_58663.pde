
void setup (){ //inicio do loop na composição
  
  size (500,500); //definição do tamanho da composição
  smooth(); //serve para suavisar os elementos da composição
  background(255); //definição da cor de fundo

}

void draw(){ //inicio da criação dos elementos da composição
  
  //criação de uma variável para o tamanho do quadrado
  
  float tamanhoq = random (100); //determina um tamanho aleatorio para o quadrado que vai de 0 a 100
  
  //criação de quadrados aleatórios
  
  noStroke (); //determina que os quadrados não têm linha
  fill (0); //atribuição de cor aos quadrados (neste caso preto)
  rect (random(500), random (500), tamanhoq, tamanhoq); //coordenadas do quadrado recorrendo à variável de tamanho

  //criação de uma variável para o tamanho do circulo
  
  float tamanhoc = random (100); //determina um tamanho aleatorio para o circulo que vai de 0 a 100
  
  //criação de uma variável para a cor do circulo
   
  float rc = random (0,1); //determina um valor para a escala de vermelhos que vai de 0 a 1
  float gc = random (0,1); //determina um valor para a escala de verdes que vai de 0 a 1
  float bc = random (255); //determina um valor para a escala de azuis que vai de 0 a 255
  
  //criação de circulos aleatorios
  
  noStroke(); //determina que os circulos não têm linha
  fill (rc, gc, bc); //atribuição de cor aos circulos recorrendo às variáveis anteriores
  ellipse (random(500), random (500), tamanhoc, tamanhoc); //cordenadas dos circulos
  
  //criação de uma variável para o tamanho dos triangulos
  
  float tamanhot = random (100);
  
  //criação de uma variável para a cor dos triangulos
  
  float rt = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
  float gt = random (0,1); //determina um valor para a escala de verdes que vai de 0 a 1
  float bt = random (0,1); //determina um valor para a escala de azuis que vai de 0 a 1
  
  //criação dos triangulos aleatorios 
  
  noStroke (); //determina que os triangulos não têm linha
  fill (rt,gt,bt); //atribuição de cor aos triangulos recorrendo às variáveis anteriore
  triangle (random (500), random (500), random (500), random (500),random (500), random (500)); //cordenadas dos triangulos
  
}
