
//Monyse Takaki
//Inspirado em 'Transformations', Seb Lee-Delisle

float angle = 0;
 
void setup() {
  size(400, 400);
  strokeWeight(2); 
}
 
void draw() {
  background(0);
  // noFill pra ocorrer apenas o os traços do desenho
  noFill();
  // Traços brancos
  stroke(255);
  // Desenha retângulos no centro
  rectMode(CENTER);
  // HSB (hue, saturation, brightness) permitem uma melhor
  // abstração
  colorMode(HSB);
  translate(width/2, height/2);
  
  int counter =0 ;
 
  while(counter<100) {
     
    // A cor do traço dependerá do quão longe do loop
    //estará.
    stroke(193+counter,255,255);
    rect(width/2, height/2, 200,200);
    // Rotaciona as coordenadas do sistema num
    // ângulo determinado por uma variavel
    rotate(radians(angle));
    // As proporções tomadas nesta rotação 90%
    //formam de maneira indireta proporção aurea.
    scale(0.900,0.900);
     
    counter++;
  }
 
  // Criação da animação
  angle += 0.1000; 
 
}
