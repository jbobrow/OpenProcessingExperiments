
void setup() { // construção do stage
  size (600,600); // tamanho da janela
  background (255);  // cor de fundo
  smooth(); // suaviza as formas
  noStroke(); // retira a linha de contorno das formas
  frameRate(10); // define o numero de frames por segundo
}

void draw(){ // construção do desenho/formas
  
  float posX; //define uma variavel para o posição em x do circulo
  float posY; //define uma variavel para o posição em y do circulo
  float diametro = random (20,100); // define uma variavel para um diametro aleatório do circulo
  float r = random(255); // define uma variavel para um valor aleatório na escala dos vermelhos
  float g = random(255); // define uma variavel para um valor aleatório na escala dos verdes
  float b = random(255); // define uma variavel para um valor aleatório na escala dos azuis
  float probabilidade = 50; // define uma variavel para o valor da percentagem
    
    // a composição vai ter 50% dos circulos com cores e posições aleatórias e os outros 50% dos circulos vao estar a preto no centro horizontal da janela  
     if (random(100) > probabilidade){ // define que estão conticionados 50% dos circulos
      posX = random (0,600); //define a posição aleatória no eixo de x entre 0 a 600
      posY = 300; // define a posição no eixo de y
      r = 0; // define o valor da cor na escala de vermelhos
      g = 0; // define o valor da cor na escala de verdes
      b = 0; // define o valor da cor na escala de azuis
    }
     else{ // define qe estão condicionados os restantes circulos
     posX = random (0,600); // define uma posição aleatória no eixo de x entre 0 a 600
     posY = random (0,600); // define uma posição aleatória no eixo de y entre 0 a 600
     }
     
     fill(r,g,b); // define a cor de preenchimento dos circulos
     ellipse ( posX, posY, diametro, diametro); // construção dos circulos
  } 
