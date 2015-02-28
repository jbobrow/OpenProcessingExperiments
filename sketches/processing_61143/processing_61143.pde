
void setup(){//definições de setup
  size(640,480);//tamanho da janela
  smooth();//suaviza o desenho
  } 

void draw() {//definições de desenho
  
  background(0);//fundo preto

  translate (width/2, height/2);//especifica um valor para deslocar objetos dentro da janela, definindo assim a posição

  fill(3,74,100);//preenchimento da ellipse
  ellipse(0,0,330,330);//desenha ellipse

  fill(224,82,0);//preenchimento da ellipse
  ellipse(0,0,102,102);//desenha ellipse

  float s = second();//valores entre 0 - 59
  float m = minute();//valores entre 0 - 59
  float h = hour();//valores entre 0 - 23
  
  int escala = 360;//criar uma variavel e dar o valor de 360
  
  s =   map (s, 0,59, 0, escala);//chamar a variavel dos segundos, e vai mapear valores de 0 a 59 fazendo 360graus
  m =   map (m, 0,59, 0, escala);//chamar a variavel dos minutos, e vai mapear valores de 0 a 59 fazendo 360graus
  h =   map (h, 0,12, 0, escala);//chamar a variavel das horas, e vai mapear valores de 0 a 12 fazendo 360graus
  
  // segundos
  strokeWeight(4);//espessura da linha
  stroke(224,82,0);//cor da linha
  float angleSeconds = radians(s);// convertemos de angulos 0 a 360 para radianos
  
  pushMatrix();//função que coloca os seguintes dados na mesma matriz.
  rotate(angleSeconds);//dizemos para ir buscar a variavel, e dar-lhe rotação
  line (0,0, 0, -165);//desenha linha 
  popMatrix();//função que fecha a matriz.

  //horas
  strokeWeight(5);//espessura da linha
  stroke(3,74,100);//cor da linha 
  float angleHours = radians(h);// convertemos de angulos 0-360 para radianos
  
  pushMatrix();//função que coloca os seguintes dados na mesma matriz. 
  rotate(angleHours);//dizemos para ir buscar a variavel, e dar-lhe rotação
  line (0,0, 0, -40);//desenha linha
  popMatrix();//função que fecha a matriz. 

  //minutos
  strokeWeight(5);//espessura da linha
  stroke(3,74,100);//cor da linha   
  float angleMinutes = radians(m);// convertemos de angulos 0-360 para radianos
  
  pushMatrix();//função que coloca os seguintes dados na mesma matriz. 
  rotate(angleMinutes);//dizemos para ir buscar a variavel, e dar-lhe rotação
  line (0,0, 0, -50);//desenha a linha
  popMatrix();//função que fecha a matriz.
  
  
}

