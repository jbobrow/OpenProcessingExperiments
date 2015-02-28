

// Relógio

void setup(){ // Defini o setup
  size(300,300); // Defini o tamanho da janela
  smooth(); // Suaviza o desenho
  }
 
void draw() { // Defini o desenho
   
  background(255); // Defini o fundo branco
 
  translate (width/2, height/2); // Definindo a posição
 
  float m = minute(); // Define valores entre 0 - 59
  float h = hour(); // Define valores entre 0 - 23
   
  int escala = 360; // Cria uma variavel e dar o valor de 360
   
  m =   map (m, 0,59, 0, escala); // Define a ariavel dos minutos e vai dar valores de 0-59 fazendo 360 graus
  h =   map (h, 0,12, 0, escala); // Define a variavel das horas e vai dar valores de 0-12 fazendo 360 graus
   
  // Horas
  strokeWeight(5); // Define a espessura da linha
  stroke(255, 116, 3); // Define a cor da linha
  float angleHours = radians(h); // Converte os angulos 0-360 para radianos
   
  pushMatrix(); // Coloca os seguintes dados na mesma matriz
  rotate(angleHours); // Buscar a variavel e dar-lhe rotação
  line (0,0, 0, -40); // Desenha linha
  popMatrix(); // Fecha a matriz
 
  // Minutos
  strokeWeight(5); // Define a espessura da linha
  stroke(255, 3, 95); // Define a cor da linha  
  float angleMinutes = radians(m); // Converte os angulos 0-360 para radianos
   
  pushMatrix(); // Coloca os seguintes dados na mesma matriz
  rotate(angleMinutes); // Buscar a variavel e dar-lhe rotação
  line (0,0, 0, -50); // Desenha a linha
  popMatrix(); // Fecha a matriz
   
   
}


