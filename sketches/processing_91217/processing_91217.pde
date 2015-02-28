
/***************************************************
Experimentation based on the code of Maria Paula Sada and
Bernardo Schorr, which applies the concepts of motion and ease.

--- 
 Curso de Processing
 Maria Paula Saba e Bernardo Schorr
 Janeiro de 2013
 
 Transformações
 
 Translate - desloca a grid para outra posição
 Rotate - gira a grid com o ângulo determinado
 Scale - multiplica o tamanho da grid
 
 Para que a transformação só afete os elementos desejados,
 define-se uma nova grid (pushMatrix) e a retira depois (popMatrix)
 
 
 ***************************************************/

float x;
float y;


void setup()
{
  size(500, 500);
  smooth();
  x = 0;
  y= 0;
}

void draw() {
  float vermelho = random(255);
  float verde = random(255);
  float azul = random(255);
  
  //desenha o background
  fill (255, 255, 255, 127);
  rect(0, 0, 1000, 1000);

  pushMatrix();
  //transformações
  translate(width/2, height/2);
  rotate(radians(x));
  scale(y/50);

  //quadrado vermelho
   fill(255, 0, 0);
  if (mousePressed == true) {
    fill (vermelho, verde, azul);
  }
  rectMode(CENTER); 
  rect(0, 0, 40, 40);
  popMatrix();

  //easing
  x = x*0.9 + mouseX*0.1;
  y = y*0.9 + mouseY*0.1;
}



