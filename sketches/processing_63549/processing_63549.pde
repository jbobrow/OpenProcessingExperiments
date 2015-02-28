


  import ddf.minim.*;//definições da livraria minim
  import ddf.minim.signals.*;//definições da livraria minim
  import ddf.minim.analysis.*;//definições da livraria minim
  import ddf.minim.effects.*;//definições da livraria minim

  PFont font;//variavel que vai gerar a fonte
  PImage a;//dá ordem ao programa para guardar a imagem a numa pasta do programa
  PImage b;//dá ordem ao programa para guardar a imagem b numa pasta do programa
  PImage c;//dá ordem ao programa para guardar a imagem c numa pasta do programa

  Minim minim;//variaveis minim
  AudioSample player_1;//variavel para tocar o som no player 1 
  int seconds; //variavel para os segundos
  int lastSecond;//variavel para o last second, ultimo segundo 
  int secondsBeat;//variavel para as batidas no segundo
void setup()//definições de setup
{
  size(500,500);// defenições da area da janela
  background(255);// definições da cor do fundo da janela neste caso preto
  smooth();//alisa as barras 
  minim = new Minim(this);//diz que minim é igual a Minim 
  player_1 = minim.loadSample("38868__m-red__clock-tic.wav", 512);//fazer load do som para ser reproduzido no player 1 gerado anteriormente
  seconds = 0;//inicio do play do som 
  secondsBeat = 10;//sao as batidas por segundo
}
void draw()// defenições de desenho
{
  seconds = second();//seconds vai ser igual ao second que ordena os segundos no relogio
  if (lastSecond+1 == seconds){//condição para o som continuar apos o primeiro minuto de som produzido
  player_1.trigger();//iniciar o player 1
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
  
  
  fill(255,0,0);//preenchimento com vermelho
  
 
 
  textAlign(CENTER,CENTER);//alinhamento do texto
  
  font = loadFont("AgencyFB-Reg-48.vlw");//faz o load da fonte
  textFont(font, 50);//define o tamanho da fonte
  text("15",width/4,249.9);//posição do texto 15 na aplicação
  text("30",width/2,249.9);//posição do texto 30 na aplicação
  text("45",375,249.9);//posição do texto 45 na aplicação  
  
  
  text("6",width/4,416.5);//posição do texto 6 na aplicação
  text("12",width/2,416.5);//posição do texto 12 na aplicação
  text("18",375,416.5);//posição do texto 18 na aplicação

  
  font = loadFont("Arial-Black-48.vlw");//novo load de fonte
  textAlign(RIGHT,RIGHT);//alinhamento do texto a direita
  textFont(font,15);//tamanho da fonte
  
  fill(100,100,255);//preenchimento com cor em tons de azul para o texto
  

  strokeWeight(2);//define a espessura do stroke
  text("SECONDS",s,160);//texto seconds e a sua posição
  text("MINUTES",m,328);//texto minutes e a sua posição
  text("HOURS",h,494);//texto hours e a sua posição
  
  lastSecond = seconds;//last second vai ser igual a seconds
}  
  lastSecond = seconds;//last second vai ser igual a seconds 
 
}

void stop()//definições de stop
{
  
  player_1.close();//fecha sempre as classes de minim quando acabar de as utilizar/fecha o payer 1

  
  minim.stop();//define o stop para o Minim
  super.stop();//para sempre o Minim apos sair
}



