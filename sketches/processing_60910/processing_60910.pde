
PImage horas2;//dar nome à imagem que irei carregar


void setup()//definições do Setup
{
  size(1245,300);//tamanho da janela
  horas2 = loadImage("horas2.png");//carregar imagem
}
 
void draw() {//executar o código

  int s = second();//variável para os segundos
  int m = minute(); //variável para os minutos
  int h = hour(); //variável para as horas
  
  background(79,166,26);//cor do background

  fill(255);//cor do preenchimento do rectângulo das horas
  rect(0, 10, h*21, 30);//dimensões do rectângulo para as horas
  fill(255);//cor do preenchimento do rectângulo dos minutos
  rect(0, 93, m*21, 30);//dimensões do rectângulo para os minutos
  fill(255);//cor do preenchimento do rectângulo dos segundos
  rect(0,186, (s*21), 30);//dimensões do rectângulo para os segundos   

   image(horas2, 0, 0);//posicionar a imagem

}


