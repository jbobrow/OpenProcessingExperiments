
// Catarina Fidalgo 26934

void setup(){ // definição dos elementos estáticos
  size(500,500);// define a área de trabalho
  smooth();// suaviza a composição
 
} 

void draw() {// definição dos elementos em animação
  
  colorMode(HSB,360,100,100);// cor HSB
  background(255);// define a cor de fundo
  
   int s = second();  // define que a letra s é referente aos segundosValues from 0 - 59
   int m = minute();  // define que a letra m é referente aos minutos
  int h = hour();// define que a letra h é referente ás horas
   int escala = 100; // define a escala dos objectos que neste caso é 100
  
  s =  (int) map (s, 0,59, 0, escala);// a variável dos segundos vai até 59
  m =  (int) map (m, 0,59, 0, escala);// a variável dos minutos vai até 59
  h =  (int) map (h, 0,24, 0, escala);// a variável das horas vai até 24
  
  // definições referentes aos segundos
  
  strokeWeight(8);// define a espessura do stroke 
  stroke(54,0,0);// define a cor do stroke
  int sH = (int) map (s,0,escala,0,360); // converte os segundos em Hue
  fill(sH,88,99);// define a cor da elipse 
  ellipse ( width*0.25, height/2, s, s);// definição da elipse 
  noFill();// o quadrado não tem preechimento
  rect( width*0.25, height/2, s, s);// definições do quadrado
  
  // definições referentes aos minutos
  strokeWeight(8); // define a espessura do stroke
  stroke(54,0,0);// define a cor do stroke
  int mH = (int) map (m,0,escala,0,360); // converte os minutos em Hue
  fill(mH,88,99);// define a cor da elipse
  ellipse ( width*0.5, height/2, m, m);// definição de elipse
  noFill();// o quadrado não tem preenchimento
  rect ( width*0.5, height/2, m, m);// definições do quadrado
   
  // definições referentes ás horas
  strokeWeight(8);// define a espessura do stroke
  stroke(54,0,0);// define a cor do stroke
  int hH = (int) map (h,0,escala,0,360); // converter as horas em Hue
  fill(hH,88,99);// define a cor da elipse
  ellipse (width *0.75, height/2, h, h);// definição de elipse
  noFill();// o quadrado não tem preenchimento
  rect ( width *0.75, height/2, h,h);// definições do quadrado
  
  
  }

