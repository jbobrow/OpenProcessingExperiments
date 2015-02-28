
int s; // segundos 
int m; // minutos 
int h; // horas


void setup(){ // esta função serve para as definiçoes do setup
  size(500,500); // define o tamanho da janela, que neste caso será 500x500
   
   
  s = 0;// segundos
  m = 0;// minutos
  h = 0;// horas
  
}


void draw(){ // esta funçao serve para as definiçoes do void draw
   background(0); // para definir a cor do fundo 
  
  
    s = second();// variavel dos segundos de 0 - 59
    m = minute();// variavel dos minutos de 0 - 59
    h = hour();// variavel das horas de 0 - 23
  
  float h12; // variavel de h12
  h12=h;// os nossos relogios marcam 24horas, assim sendo, esta função assume que sempre que chegue as 12h soma-se de 1 a 1 até às completar mais 12 que dá 24h
 
  
  println(s); // esta funçao vai nos permitir ver no rectangulo a preto embaixo os segundos a passar
  noFill(); // esta funçao serve para nao ter cor de preenchimento
  stroke(255); // espessura da linha - stroke - a cor do mesmo
  
  
  translate(width/2, height/2);// esta funçao serve para mover o objecto sem mover a janela
  for (float i = 0; i < 50; i++) { // esta função controla a sequência de repetições, neste caso de ellipses
  rotate(0.1);// esta função serve para rodar o objecto que neste caso é uma espiral feita de ellipses
   
   

    ellipse(i, 0, s*10, s*10);// ellipses que constinuem a espiral dos segundos 
    ellipse(i, 0, m*10, m*10);// ellipses que constinuem a espiral dos minutos
    ellipse(i, 0, h*10, h*10);// ellipses que constinuem a espiral das horas
  }
}
