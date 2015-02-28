
int s; // variavel para guardas segundos
int m; // variavel para guardar os minutos
int h; // variavel para guardar as horas

PImage rel; // variavel para imagem
import netscape.javascript.*;
void setup () {
  
  size (600,300);// tamanho da janela 
  background (255); // fundo da janela
  s = 0;//valor inicio de segundos
  m = 0;//valor inicio de minutos
  h = 0;//valor inicio de horas
  
  rel = loadImage("relogio.jpg"); // importar imagem externa
  image(rel, 0, 0); //posição da imagem
}


void draw () {
  background(rel); // definir imagem como background
   
 s = second(); // a variavel 's' vai guardar o actual valor dos segundos do pc
 m = minute();// a variavel 'm' vai guardar o actual valor dos minutos do pc
 h = hour();// a variavel 'h' vai guardar o actual valor dos horas do pc
 
  int s = second();  // valor dos segundos de 0 a 59
  int m = minute();  // valor dos minutos de 0 a 59
  int h = hour();    // Valor das horas de 0 a 23
  

  
  
  s =  (int) map (s, 0,60, 0, width); // mapear os valores de 0 a 60, para o tamaho da largura da janela
  m =  (int) map (m, 0,60, 0, width);// mapear os valores de 0 a 60, para o tamaho da largura da janela
  h =  (int) map (h, 0,24, 0, width);// mapear os valores de 0 a 24, para o tamaho da largura da janela

  //desenhos para definir o relogio
  
  
  noStroke();
  //segundos
  fill(0); // cor do rectangulo
  rect(0, height/2 -5, s,10); //definições para a posição e tamanho do rectangulo
  
  // horas
 fill(255); // cor do rectangulo
 rect( h, height/2 , 600/25,h/4);//definições para a posição e tamanho do rectangulo
 
 //minutos
 fill(255);// cor do rectangulo
 rect( m, height/2 , 10, -m/4);//definições para a posição e tamanho do rectangulo
 
  stroke(255);// cor da outline 
  line(0,150,600,150);//posição da outline
  
  
}

