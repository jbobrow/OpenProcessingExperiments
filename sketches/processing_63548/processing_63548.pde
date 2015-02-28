

  PImage a;//dá orde ao programa para guardar a imagem a numa pasta do programa
  PImage b;//dá orde ao programa para guardar a imagem b numa pasta do programa
  PImage c;//dá orde ao programa para guardar a imagem c numa pasta do programa

void setup()//definições setup
{
  size(500,500);// definições da area da janela
  background(255);// definições da cor do fundo da janela neste caso preto
  smooth();//alisa as barras
  
}
void draw()// definições de desenho
{
  for (int y = 1; y < 10; y = y+1) { //circle for para a variavel y
  for (int x = 1; x < 10; x = x+1) {// circle for para a variavel x
   
  noFill();//define o nao preenchimento do fundo
}
}
 
  int s = second();//atribuimos a variavel s para os segundos
  int m = minute();//atribuimos a variavel m para os minutos
  int h = hour();// atribuimos a variavel h para as horas
   
  a = loadImage("animais 3.jpg");//faz o load da imagem 3
  b = loadImage("animal2.jpg");//faz o load da imagem 2
  c = loadImage("animal1.jpg");//faz o load da imagem 1
      
  s=(int)map(s,0,59,0,height);//mapear os segundos
  m=(int)map(m,0,59,0,height);//mapear os minutos
  h=(int)map(h,0,24,0,height);//mapear as horas
  
  image (a,0,0);//cooredenadas da imagem a
  image (b,0,166.6);//cooredenadas da imagem b
  image (c,0,333.3);//cooredenadas da imagem c
  strokeWeight(10);//espessura do stroke

  rect(0,0,s,166.6);//coordenadas da barra dos segundos
  rect(0,166.6,m,166.6);// coordenadas da barra dos minutos
  rect(0,333.3,h,166.6);// coordenadas da barra das horas
    
}  



