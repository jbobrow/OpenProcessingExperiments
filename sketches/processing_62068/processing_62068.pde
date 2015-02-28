
/* Briefing 2
   Relógio
   Maryana Kruk #27300*/

PFont myFont;  //Declarar variável de fonte
int s,m,h,y,y2,y3;  //Declarar variáveis inteiras para segundos, minutos, horas e coordenasa verticais.
int largura,altura,diam;  //Declarar variáveis para a largura, a altura e diametro
float speed;  //Declarar variável decimal para a velocidade

int posI; //Declarar variável para a posição inicial

 
void setup(){  //Função para estabelecer as definições do programa
  size(650,300);  //Tamanho da janela
  smooth();  //Suavizar as formas
  background(255);  //Definir a cor do fundo (branco)
  
  posI=height-35;  //Inicializar a variável com o valor de "height-30"
  s=posI;  //Inicializar variável 
  m=posI;  //Inicializar variável 
  h=posI;  //Inicializar variável 
  largura=150;  //Inicializar variável 
  altura=6;  //Inicializar variável 
  diam=10;  //Inicializar variável
  y=posI;  //Inicializar variável 
  y2=posI; //Inicializar  variável 
  
  myFont= loadFont("AgencyFB-Reg-48.vlw");  //Carregar a fonte para o programa
  textFont(myFont,26);  //Indicar os atributos da fonte (nome da variável, tamanho da fonte)
}

void draw(){  //Função para desenhar
  background(255);  //Definir a cor do fundo
  
  s=second();  //Corresponder a variável "s" a função dos segundos
  m=minute();  //Corresponder a variável "m" a função dos minutos
  h=hour();  //Corresponder a variável "h" a função dos horas
  speed= 1.5;  //Inicializar a variável da velocidade
  
  fill(2,115,155);  //Definir cor de preenchimento 
  text(h,width/2-35,height-5);  //Escrever o valor de "h" nas respectivas coordenadas
  text(m,width/2-10,height-5);  //Escrever o valor de "m" nas respectivas coordenadas
  text(s,width/2+15,height-5);   //Escrever o valor de "s" nas respectivas coordenadas
    
  s= (int) map(s,0,59,posI,1);  //Mapear a variável "s", passando a valores entre posI e 1 
  m= (int) map(m,0,59,posI,1);  //Mapear a variável "m", passando a valores entre posI e 1
  h= (int) map(h,0,23,posI,1);  //Mapear a variável "h", passando a valores entre posI e 1
 
  y=y-(int)speed;  //Alterar o valor de "y" de forma a diminuir de acordo com a velocidade 
  y2=y2-(int)speed;  //Alterar o valor de "y2" de forma a diminuir de acordo com a velocida
 
 
 ellipseMode(CENTER);  //Modo da elipse, desenhar à partir do centro
 ellipse(width/8-15,posI+3,diam,diam);  //Desenhar uma elipse do lado esquerdo, 1ª a contar de baixo
 ellipse(width-width/8+15,posI+3,diam,diam);  //Desenhar uma elipse do lado direito, 1ª a contar de baixo
 ellipse(width/8-15,posI-63,diam,diam);  //Desenhar uma elipse do lado esquerdo, 2ª a contar de baixo
 ellipse(width-width/8+15,posI-63,diam,diam);  //Desenhar uma elipse do lado direito, 2ª a contar de baixo
 ellipse(width/8-15,138,diam,diam);  //Desenhar uma elipse do lado esquerdo, 3ª a contar de baixo
 ellipse(width-width/8+15,138,diam,diam);  //Desenhar uma elipse do lado direito, 3ª a contar de baixo
 ellipse(width/8-15,72,diam,diam);  //Desenhar uma elipse do lado esquerdo, 4ª a contar de baixo
 ellipse(width-width/8+15,72,diam,diam);  //Desenhar uma elipse do lado direito, 4ª a contar de baixo
 ellipse(width/8-15,6,diam,diam);  //Desenhar uma elipse do lado esquerdo, 5ª a contar de baixo
 ellipse(width-width/8+15,6,diam,diam);  //Desenhar uma elipse do lado direito, 5ª a contar de baixo
 
  
  stroke(0);  //Cor do traço (preto)
  noFill();  //Sem preenchimento
  rect(width/8,posI,largura,altura);  //Desenhar um rectângulo na posição inicial (height-35)
  rect(width/8,h,largura,altura);  //Desenhar um rectângulo na posição do valor das horas
  if (y>h){  //Condição "se", executa o bloco de código no caso de se verificar que "y" é maior que "h" 
    noStroke();  //Sem contorno
    fill(90,160,34);  //Definir cor de preenchimento
    rect(width/8,y,largura,altura);  //Desenhar um rectângulo de acordo com o valor de "y"
  }else{  //Se a condição não se verificar, executar o seguinte
    y=posI;  //Alterar o valor de "y" para a posição inicial
  }
  
  stroke(0);  //Cor do traço (preto)
  noFill();  //Sem preenchimento
  rect(width/2-75,posI,largura,altura);  //Desenhar um rectângulo na posição inicial (height-35)
  rect(width/2-75,m,largura,altura);  //Desenhar um rectângulo na posição do valor dos minutos
  if (y2>m){  //Condição que executa o bloco de código no caso de se verificar que "y2" é maior que "m"
    noStroke();  //Sem contorno
    fill(2,115,155);  //Definir cor de preenchimento
    rect(width/2-75,y2,largura,altura);  //Desenhar um rectângulo de acordo com o valor de "y2"
  }else{  //Se a condição não se verificar, executar o seguinte
    y2=posI;    //Alterar o valor de "y2" para a posição inicial
 } 
 
  stroke(0);  //Cor do traço (preto)
  fill(165,38,70);  //Definir cor de preenchimento
  noStroke();  //Sem contorno
  rect(width-width/8-150,s,largura,altura);  //Desenhar um rectângulo de acordo com o valor dos segundos
 
}

