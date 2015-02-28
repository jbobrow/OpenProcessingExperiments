
int s; // variavel para segundos
int m; // variavel para guardar os minutos
int h; // variavel para guardar as horas

PImage img; // define o nome da imagem 

void setup () {
  
  size (600,601); // Tamanho da imagem
  background (0);// cor de fundo
  smooth();//nao pixeaçizar
  
   img = loadImage("relogio.jpg");// carrega a imagem em ficheiro

  s = 0;// atribuir um valor de inicio
  m = 0;
  h = 0;
  
  PFont fonte; // variável da fonte de letra
  fonte = loadFont("CenturyGothic-48.vlw");// criar a fonte
  textFont(fonte);// tipo de letra
  
} 

void draw () {
  colorMode(HSB,360,100,100);// variável cor
  background(img);// imagem como fundo
  
 

  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
int escala = 600;
  
  
 s =  (int) map (s,0,60,0,height); // mapear os valores de 0,59, para o tamaho da largura da janela
 m =  (int) map (m, 0,60, 0, height);  
 h =  (int) map (h, 0,60, 0, height);
  
 

  
  
 
  int sH = (int) map (s,0,escala,200,360); // converter os segundos em Hue
  noStroke();
  fill(sH,255,255);
  ellipse(500,s,200,200);
 
   noFill();
   //println(s);
   
  
  int mH = (int) map (m,0,escala,0,100); // converter os segundos em Hue
  noStroke();
  fill(mH,88,99);
  ellipse(300,m,200,200);
 
  noFill();
 
  int hH = (int) map (h,0,escala,100,200); // converter os segundos em Hue
  noStroke();
  fill(hH,88,99);
  ellipse(100,h,200,200);
noFill();

  fill(0); // cor da letra
  textSize(200); // Tamanho da letra
  text("H", 100, h+110); // texrto e coordenadas
  textAlign(CENTER); // enquadramento do texto
  
  fill(0);// cor da letra
  textSize(200);// Tamanho da letra
  text("M", 300, m+110);// texrto e coordenadas
  textAlign(CENTER);// enquadramento do texto
  
  
  fill(0);
  textSize(200);
  text("S", 500, s+110);
  textAlign(CENTER);
 
 textSize(32); //tamanho da letra
  fill(360);// cor da bola
  text( s, 500, s+16);// texto
  textAlign(CENTER);//enquadramento
  s = (int) map(s, 0, 60, 0, width); // formula q cria a variavel s do relógio

textSize(32);//tamanho da letra
  fill(360);// cor da bola
  text( m, 300, m+16);// texto
  textAlign(CENTER);//enquadramento
  m = (int) map(m, 0, 60, 0, width);// formula q cria a variavel m do relógio
  
  textSize(32);//tamanho da letra
  fill(360);// cor da bola
  text(h, 100, h+16); //texto 
  textAlign(CENTER);// enquadramento
  h = (int) map(h, 0, 23, 0, width);// formula q cria a variavel m do relógio
  
  
  
  

}
  
  
  


