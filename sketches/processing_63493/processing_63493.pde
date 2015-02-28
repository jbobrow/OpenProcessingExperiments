
//Briefing 3 - relógio
//André Vaz 28214

import ddf.minim.*;//o minim é uma biblioteca de áudio, 
Minim minim;//que permite usar som dentro da aplicação
AudioSample player_1;//dou um nome à variavel de som

int seconds;//definição de uma variavel para os segundos 
int lastSecond;//definição de uma variavel para o ultimo segundo 
int secondsBeat;//definição de uma variavel para que consigamos a cada segundo, executar um som

float s;//definição de uma variavel para os segundos
float m;//definição de uma variavel para os minutos
float h;//definição de uma variavel para as horas
float h12;////definição de uma variavel para a hora
float r,g,b;//definição de uma variavel para cores (vermelho, verde, azul)
PFont myFont;//dizer ao processing que vamos criar uma fonte e dar o nome. 
            //isto faz-se chamado a classe das fontes "PFont" e dando um nome, neste caso "myFont"

void setup(){//definições de setup
  size (640,480);//tamanho da janela
  background (0);//cor de fundo (background)
  smooth();//suaviza o desenho
  
  minim = new Minim(this);
  //digo ao processing para carregar o ficheiro de audio
  player_1 = minim.loadSample("sonr.wav", 512);

  seconds = 0;//definições de valores de variaveis
  secondsBeat = 1;//definições de valores de variaveis
  
}

void draw(){//definições de desenho
 background (0);//cor de fundo (background)
 translate (width/2, height/2);// definir o centro de translação para as coordenadas indicadas
 background (0);// definição do fundo para ficar limpo (sem rasto)
 
 myFont = loadFont ("GillSansMT-48.vlw");//carregar a fonte para o processing
 textFont(myFont,18);//digo ao processing para ir buscar a fonte que carreguei e meter com 18 de tamanho
 text("I always arrive late at the class but i make up for it by leaving early.",-230,160);//o texto que quero inserir, e as coordenadas da altura e da largura
 textFont(myFont,15);//digo ao processing para ir buscar a fonte que carreguei e meter com 15 de tamanho
 text(" - What time is it? - CLICK ME!! LEFT or RIGHT",-150,200);//o texto que quero inserir, e as coordenadas da altura e da largura

 
 if (mousePressed && (mouseButton == LEFT)) {//caso pressione o botão esquerdo do rato
  background (0);//cor de fundo (background)
  seconds = second();//definir o valor para segundos
  fill(3,74,100);//preenchimento da ellipse
  ellipse(0,0,330,330);//desenha ellipse

  fill(224,82,0);//preenchimento da ellipse
  ellipse(0,0,102,102);//desenha ellipse
  s = second();//atribuição da funçao segundos à variavel "s"
  m = minute();// atribuição da função minutos à variavel "m"
  h = hour();// atribuição da função horas à variavel "h"
  h12 = h%12;// redefinição dos valores da variavel "h" para metade
  
  s = map (s, 0, 59, 0, 360);// mapeamento da variavel "s" para fazer uma rotação de 360
  m = map (m, 0, 59, 0, 360);// mapeamento da variavel "m" para fazer uma rotação de 360
  h = map (h12, 0, 12, 0, 360);// mapeamento da variavel "h" para fazer uma rotação de 360
  
 
  //segundos
  strokeWeight(4);//espessura da linha
  stroke(224,82,0);//cor da linha
  float angleSeconds = radians(s);// convertemos de angulos 0 a 360 para radianos
  pushMatrix();//função que coloca os seguintes dados na mesma matriz.
  rotate(angleSeconds);//dizemos para ir buscar a variavel, e dar-lhe rotação
  line (0,0, 0, -161);//desenha linha 
  popMatrix();//função que fecha a matriz.


  //horas
  strokeWeight(5);//espessura da linha
  stroke(0);//cor da linha 
  float angleHours = radians(h);// convertemos de angulos 0-360 para radianos
  pushMatrix();//função que coloca os seguintes dados na mesma matriz. 
  rotate(angleHours);//dizemos para ir buscar a variavel, e dar-lhe rotação
  line (0,0, 0, -40);//desenha linha
  popMatrix();//função que fecha a matriz.
  
  //minutos
  strokeWeight(5);//espessura da linha
  stroke(0);//cor da linha   
  float angleMinutes = radians(m);// convertemos de angulos 0-360 para radianos
  pushMatrix();//função que coloca os seguintes dados na mesma matriz. 
  rotate(angleMinutes);//dizemos para ir buscar a variavel, e dar-lhe rotação
  line (0,0, 0, -50);//desenha a linha
  popMatrix();//função que fecha a matriz.

 
 if (lastSecond+1 == seconds){//condição que diz que o ultimo segundo +1 é = ao segundo, permite sincronizar o som com o segundo
    player_1.trigger();//entao vai chamar a variavel do som, para o reproduzir
    
  }
 lastSecond = seconds;// se o valor de lastSecond + 1 for igual ao valor dos segundos, entao a musica toca

    
 } else if (mousePressed && (mouseButton == RIGHT)) {//caso pressione o botão direito do rato
   background (0);//cor de fundo da janela (background)

   s = second();//vamos dizer ao processing que o s vai ser = aos segundos, varia entre 0 - 59
   m = minute();//vamos dizer ao processing que o m vai ser = aos minutos, varia entre 0 - 59
   h = hour();//vamos dizer ao processing que o h vai ser = à hora, varia entre 0 - 23

  text( h,  -80,0, height/2);//criar um texto onde vou chamar a variavel das horas, e de acordo com o sitio onde as quero posicionar na janela
  h = (int) map(h, 0, 23, 0, width);//chamar a variavel das horas, e vai mapear valores de 0 a 12
  
  text( m, 0,0, height/2);//criar um texto onde vou chamar a variavel dos minutos, e de acordo com o sitio onde as quero posicionar na janela
  m = (int) map(m, 0, 59, 0, width);//chamar a variavel dos minutos, e vai mapear valores de 0 a 59

  text( s, 80,0, height/2);//criar um texto onde vou chamar a variavel dos segundos, e de acordo com o sitio onde as quero posicionar na janela
  noStroke();//sem contorno
  s = (int) map(s, 0,59,0,width);//chamar a variavel dos segundos, e vai mapear valores de 0 a 59
  } else {//caso contrário
    fill(255);//preenche branco
  }

}

void stop()//definições de stop
{
  // assim que se fecha a janela vai encerrar todas as classes criadas de minim
  player_1.close();

  //função para parar o Minim assim que se fecha a janela
  minim.stop();
  super.stop();
}

