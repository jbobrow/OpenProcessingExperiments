
/* Briefing 3
   Relógio com input de som
   Maryana Kruk #27300*/

import ddf.minim.*;  //Importar livraria
import ddf.minim.signals.*;  //Importar livraria
import ddf.minim.analysis.*;  //Importar livraria
import ddf.minim.effects.*;  //Importar livraria

Minim minim;  //Inicializar classe
AudioInput in;  //Detecção de som, input 
float scaleV; //Declarar variável decimal
float getIn; ///Declarar variável decimal
float volume; //Declarar variável decimal
  
PFont myFont;  //Declarar variável de fonte
int s,m,h,y,y2,y3;  //Declarar variáveis inteiras para segundos, minutos, horas e coordenasa verticais.
int largura,altura,diam;  //Declarar variáveis para a largura, a altura e diametro
float speed;  //Declarar variável decimal para a velocidade
float h12;  //Declarar variável decimal para mudar o sistema de horas de 24 para 12


int posI; //Declarar variável para a posição inicial
int c=color(240,239,237);  //Declara e inicializa uma cor "c"
int c2=color(252,252,252);  //Declara e inicializa uma cor "c2"
int c3=color(216,216,214);  //Declara e inicializa uma cor "c3"
int c4=color(98,98,97);  //Declara e inicializa uma cor "c4"
 
void setup(){  //Função para estabelecer as definições do programa
  size(650,300);  //Tamanho da janela
  smooth();  //Suavizar as formas
  background(255);  //Definir a cor do fundo (branco)
  
  minim = new Minim(this);  //Inicializar novo som
  minim.debugOn();  //Verificação de erros
  in = minim.getLineIn(Minim.MONO,50);  //Inicializar a detecção de som
  
  posI=height-35;  //Inicializar a variável com o valor de "height-30"
  s=posI;  //Inicializar variável 
  m=posI;  //Inicializar variável 
  h=posI;  //Inicializar variável 
  largura=150;  //Inicializar variável 
  altura=5;  //Inicializar variável 
  diam=10;  //Inicializar variável
  y=posI;  //Inicializar variável 
  y2=posI; //Inicializar  variável 
  
  myFont= loadFont("AgencyFB-Reg-48.vlw");  //Carregar a fonte para o programa
  textFont(myFont,20);  //Indicar os atributos da fonte (nome da variável, tamanho da fonte)
}

void draw(){  //Função para desenhar
  background(255);  //Definir a cor do fundo
  //float b=map(volume,5,20,0,100);
  getIn=in.left.get(0)*150;  //Inicializar "getIn" para obter um valor do volume
  volume=getIn;  //Inicializar o volume
    
  s=second();  //Corresponder a variável "s" a função dos segundos
  m=minute();  //Corresponder a variável "m" a função dos minutos
  h=hour();  //Corresponder a variável "h" a função dos horas
  
  noStroke(); //Sem contorno
  fill(c);  //Preencher com a cor "c"
  rect(0,0,width,height);  //Desenhar o rectângulo de fundo
  if(h>6 && h<13){  //Condição para que o rectÂngulo de fundo mude para a cor "c2" 
    fill(c2);  //Preencher com cor "c2"
    rect(0,0,width,height);  //Desenhar o rectângulo de fundo
  }
  if(h>12 && h<19){  //Condição para que o rectângulo de fundo mude para a cor "c3" 
    fill(c3);  //Preencher com cor "c3"
    rect(0,0,width,height);  //Desenhar o rectângulo de fundo
  }
  if(h>18){  //Condição para que o rectÂngulo de fundo mude para a cor "c4" 
    fill(c4);  //Preencher com cor "c4"
    rect(0,0,width,height);  //Desenhar o rectângulo de fundo
  }
  
  rectMode(CORNERS);  //Mudar o modo como é desenhado um rectângulo, indicando-se dois vertices
  fill(255);  //Preencher com branco
  rect(width/8-3,32,width-width/8+4,posI+8);  //Desenhar o rectângulo branco
  
  h12=h%12; //Inicializar a variável "h12", para que as horas sejam de 0 a 12
  speed= 1.5;  //Inicializar a variável da velocidade
    
  s= (int) map(s,0,59,posI,35);  //Mapear a variável "s", passando a valores entre posI e 1 
  m= (int) map(m,0,59,posI,35);  //Mapear a variável "m", passando a valores entre posI e 1
  h= (int) map(h12,0,11,posI,35);  //Mapear a variável "h", passando a valores entre posI e 1
    
  y=y-(int)speed;  //Alterar o valor de "y" de forma a diminuir de acordo com a velocidade 
  y2=y2-(int)speed;  //Alterar o valor de "y2" de forma a diminuir de acordo com a velocida
 
  fill(2,115,155);  //Definir cor de preenchimento
  text("0",width/8-15,posI+3);  //Escrever "0" do lado esquerdo
  text("0",width-width/8+8,posI+3);  //Escrever "0" do lado direito
  text("4",width/8-15,188,332);  //Escrever "4" do lado esquerdo
  text("15",width-width/8+8,207,5);  //Escrever "15" do lado direito
  text("8",width/8-15,111,666);  //Escrever "8" do lado esquerdo
  text("30",width-width/8+8,150);  //Escrever "30" do lado direito
  text("12",width/8-18,35);  //Escrever "12" do lado esquerdo
  text("45",width-width/8+8,92,5);  //Escrever "45" do lado direito
  text("60",width-width/8+8,35);  //Escrever "60" do lado direito

  
  rectMode(CORNER); //Mudar o modo como é desenhado um rectângulo
  stroke(90,155,30);  //Cor do traço (preto)
  strokeWeight(2);  //Espessura do traço
  noFill();  //Sem preenchimento
  line(width/8,posI+3,width/8+largura,posI+3);  //Desenhar uma linha na posição inicial +3
  line(width/8,h,width/8+largura,h);  //Desenhar uma linha na posição do valor das horas
  if (y==h){  //Condição "se", executa o bloco de código no caso de se verificar que "y" é igual a "h"  
    fill(90,155,30);  //Cor de preenchimento
    rect(width/8-2,y-2,largura+2,altura+2);  //Desenhar o rectângulo das horas
  }
  if (y>h){  //Condição "se", executa o bloco de código no caso de se verificar que "y" é maior que "h" 
    noStroke();  //Sem contorno
    fill(90,160,34);  //Definir cor de preenchimento
    rect(width/8,y,largura,altura);  //Desenhar um rectângulo de acordo com o valor de "y"
  }else{  //Se a condição não se verificar, executar o seguinte
    y=posI;  //Alterar o valor de "y" para a posição inicial
  }
  
  stroke(2,115,155);  //Cor do traço 
  noFill();  //Sem preenchimento
  line(width/2-75,posI+3,width/2-75+largura,posI+3);  //Desenhar uma linha na posição inicial +3
  line(width/2-75,m,width/2-75+largura,m);  //Desenhar uma linha na posição do valor dos minutos
  if (y2>m){  //Condição que executa o bloco de código no caso de se verificar que "y2" é maior que "m"
    noStroke();  //Sem contorno
    fill(2,115,155);  //Definir cor de preenchimento
    rect(width/2-75,y2,largura,altura);  //Desenhar o rectângulo dos minutos
  }else{  //Se a condição não se verificar, executar o seguinte
    y2=posI;    //Alterar o valor de "y2" para a posição inicial
 } 
 
  stroke(0);  //Cor do traço (preto)
  fill(165,38,70);  //Definir cor de preenchimento
  noStroke();  //Sem contorno
  rect(width-width/8-150,s,largura,altura);  //Desenhar o rectângulo dos segundos

  if(volume>25){  //Condição para que ocorra o seguinte bloco de codigo
    fill(0);  //Preencher com preto
    rect(0,0,width,height);  //Desenhar um rectângulo preto
  }
}

  void stop(){  //Função para parar
  in.close(); //Terminar a entrada de som
  minim.stop();  //função para parar a aplicação de 
  
  
 
}

