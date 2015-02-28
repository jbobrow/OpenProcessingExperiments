
void setup(){ //criação do Set Up da composição
  
  background (0); //definição da cor de fundo
  size (500,500); //definição do tamanho da composição
  smooth (); //serve para suavizar os elementos da composição
  frameRate (1000); //definição do número de frames por segundo
  
}

void draw(){ //inicio da criação dos elementos da composição
 
 //criação de uma variável para o tamanho dos circulos
 
 float circulo = random (10); //determina um tamanho aleatorio para o circulo que vai de 0 a 10

 //criação de uma variável para a cor dos circulos
 
 float rc = random (255); //determina um valor para a escala de vermelhos que vai de 0 a 255
 float gc = random (255); //determina um valor para a escala de verdes que vai de 0 a 255
 float bc = random (255); //determina um valor para a escala de azuis que vai de 0 a 255

 fill (rc,gc,bc); //atribuição de cor aos circulos recorrendo às variáveis anteriores 
 ellipse (random (500), random (500), circulo, circulo); //coordenadas dos circulos
 noStroke (); //determina que os circulos não têm contorno

for (int i=0; i < 200; i= i+1){ //determina que a repetição dá-se 200 vezes começando em 0

if (random (mouseX) > 80){ ///caso a posição do rato seja superior a 80 de X(...)

  
 ellipse (random (0,250), random (500), circulo, circulo); //(...) surgem na imagem circulos aleatórios preenchendo toda a composição(...)
 
}
  else //(...)caso contrario (...)

  {
  
    ellipse (random (250,500), random (500), circulo, circulo); //(...) surgem circulos apenas a partir de 250 de X
 
  }

}

}

  
